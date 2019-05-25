%% IN The Name Of God
%% main of Thesis Program
clc;
close all;
clear;

%% ReadData
[data,label,Continuous]=ReadData('N');
data=data(:,1:3);
% [w,model] =Alpha_Investing(data, label);



NumClass=numel(unique(label));
min_support=0.005;
min_GR= 20;
class=unique(label);

cross = crossvalind('Kfold',size(data,1),10);
avg=0;
for tenfold = 1:10
    test = data(cross == tenfold,:); 
    train = data(cross ~= tenfold,:);
    label_train=label(cross ~= tenfold);
    label_test=label(cross == tenfold);     
    
    CEP=[];
    mb=[];
    remove=0;
    redundant=0;
    irrelevant=0;
    CMB=[];
    efficient_feature=[];
    
for i=1:size(train,2)
 feature=unique( train(:,i));
 
 %% Identify and Remove irrelevant features
 [out]=Irrelevant(train(:,i),label_train,NumClass,class,feature);
 
    if(out==1)
        irrelevant=irrelevant+1;
        remove=remove+1;
    end    
    
    
    
   if ~out
       %% Identify redundant features 
       if(isempty(CMB))
            extra=0;
            mb=[];
        else
            mb=CMB;
            extra=Redundnt(train,label_train,NumClass,class,mb,feature,i);
            if extra==1
             redundant=redundant+1;   
             remove=remove+1;
            end
        end        
     if extra==0
         mb =[mb i];
            for j=1:NumClass 
                    
                    %% Convert feature i into set of itemset with discretize
                    if(Continuous(i))                     
                        %% Weka
%                         [outputTrain]=DiscretizeWeka(data(:,i),label);
%                         [~,~,targetNDX,stringVals,~] =weka2matlab(outputTrain,{});
% %                                                               (data,label,stringVal,min_support,min_GR,class,fi,j,efficient_feature)
%                         [EP,efficient_fea]=EmergingPatternWeka(train(:,i),label_train,stringVals,min_support,min_GR,class(j),i,j,efficient_feature);
%                         if ~isempty(efficient_fea)
%                         efficient_feature=efficient_fea;
%                         end
                         %% MDL
                        [set_intervals,~] = CutPoint(train(:,i),label_train);
                        [EP,efficient_fea]=EmergingPattern(train(:,i),label_train,set_intervals,min_support,min_GR,class(j),i,j,efficient_feature);
                        if ~isempty(efficient_fea)
                        efficient_feature=efficient_fea;
                        end
                    else
                       [EP,efficient_fea]=EmergingPatternnCategorical(train(:,i),label_train,min_support,min_GR,class(j),feature,j,i,efficient_feature); 
                       if ~isempty(efficient_fea)
                       efficient_feature=efficient_fea;
                       end
                    end

                    %% mine EPs for each class 
                    EP_feature(i).EP=EP;
                        if i==1
                            CEP(j).EP=EP(j).EP;
                            CEP(j).class=EP(j).class;
                        else
                        CEP(j).EP=horzcat(CEP(j).EP, EP(j).EP);
                        end            

             end
      CMB=mb;   
     end    
    end    
end

%% Classify EP
set_test=[];
label_out=[];
disp('irrelevant:');
disp(irrelevant);
disp('redundant: ');
disp(redundant);
disp('remove: ');

disp(remove);
labeltest=[];
for i=1:size(test,1)    
           labeltest1=Classifier_EP_Total(CEP,test(i,:),NumClass,class,Continuous);
           labeltest=[labeltest labeltest1];     

end
 classifier=(numel((find(labeltest==label_test')))/numel(labeltest))*100;
           disp(classifier);
           avg =avg+classifier;

end
disp('average of Accuracy:');
disp(avg/10);
disp('successfull');
