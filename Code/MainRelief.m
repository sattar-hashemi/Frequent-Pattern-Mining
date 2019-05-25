%% IN The Name Of God
%% main of Thesis Program
clc;
clear;

%% ReadData
[data,label,Continuous]=ReadData('C');
% [w1,model] =Alpha_Investing(data, label);


NumClass=numel(unique(label));
min_support=0.005;
min_GR= 1.4;
Number_Nearest=floor( size(data,1)/5);
class=unique(label);
% [weight bestidx] = RELIEF ( data, label, 10);
% tha=1/sqrt(numel(label));
tha=1/numel(label);


cross = crossvalind('Kfold',size(data,1),10);
avg=0;
for tenfold = 1:10
    test = data(cross == tenfold,:); 
    train = data(cross ~= tenfold,:);
    label_train=label(cross ~= tenfold);
    label_test=label(cross == tenfold); 
 
    
%      [rankedd,weee]=relieff(train,label_train,Number_Nearest);
    
    CEP=[];
    mb=[];
    remove=0;
    redundant=0;
    irrelevant=0;
    CMB=[];
    efficient_feature=[];
   add1=[];
    first=1;
for i=1:size(train,2)
 feature=unique( train(:,i));
 
 %% Identify and Remove irrelevant features
 [out]=Irrelevant(train(:,i),label_train,NumClass,class,feature);
 
%  [rankedd,weee]=relieff(train(:,i),label_train,Number_Nearest);
% add1= horzcat(add1,train(:,i));
%  w=OnlineRELIEF2(add1,label_train,Continuous(i),Number_Nearest);
%

w=OnlineRELIEF(train(:,i),label_train,Continuous(i),Number_Nearest);

 weight(i)=w;
 irrel=0;
 if(w<=0)
%      if(out==1)
%         irrelevant=irrelevant+1;
%         remove=remove+1;
%      end 
    irrelevant=irrelevant+1;
        remove=remove+1;
    irrel=1;
 end
        
   if  w>0
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
                        if first
                            
                            CEP(j).EP=EP(j).EP;
                            CEP(j).class=EP(j).class;
                            if j==NumClass 
                                first=0;
                            end
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
