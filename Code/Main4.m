%% IN The Name Of God
%% main of Thesis Program
clc;
close all;
clear;

%% ReadData
[data,label,Continuous]=ReadData();


NumClass=length(unique(label));
first=1;
min_support=0.005;
min_GR= 20;
class=unique(label);
efficient_feature=[];
CMB=[];
mb=[];
remove=0;
redundant=0;
irrelevant=0;

% 
% %% Identify Redundant Feature and Irrelevant feature
% for i=1:size(data,2)
%     
%     feature=unique( data(:,i));
%     %% Identify and Remove irrelevant features
%     [out,weak,weakclass]=Irrelevant(data,label,i,NumClass,class,feature);
%     if(out==1)
%         irrelevant=irrelevant+1;
%         remove=remove+1;
%     end
%     if out==0 && weak==1
%         %% Identify redundant features
%         if(isempty(CMB)||isempty(CMB(weakclass).mb))
%             extra=0;
%             mb=[];
%         else
%             mb=CMB(weakclass).mb;
%             extra=Redundnt(data,label,NumClass,class,mb,i);
%             if extra==1
%              redundant=redundant+1;   
%             remove=remove+1;
%             end
%         end
%          if extra==0
%             efficient_feature=[efficient_feature i];
%             mb =[mb i];
%          end
%          CMB(weakclass).mb=mb;  
%     end
% end
% disp('irrelevant:');
% disp(irrelevant);
% disp('redundant: ');
% disp(redundant);
% disp('remove: ');
% disp(remove);

cross = crossvalind('Kfold',size(data,1),10);
avg=0;
for tenfold = 1:10
%     test = data(cross == tenfold,efficient_feature); 
%     train = data(cross ~= tenfold,efficient_feature);
    test = data(cross == tenfold,:); 
    train = data(cross ~= tenfold,:);
    label_train=label(cross ~= tenfold);
    label_test=label(cross == tenfold);
    first=1;    
    CEP=[];
for i=1:size(train,2)    
    
            %% Convert feature i into set of itemset with discretize
            if(Continuous(i))
                [outputTrain]=DiscretizeWeka(data(:,i),label);
                [~,~,targetNDX,stringVals,~] =weka2matlab(outputTrain,{});
                [EP]=EmergingPatternWeka(train,label_train,stringVals,min_support,min_GR,NumClass,class,i);
            else
               [EP]=EmergingPatternnCategorical(train,label_train,min_support,min_GR,NumClass,class,i); 
            end
            %% map between Itemset and feature's

            %% mine EPs for each class 
            
            EP_feature(i).EP=EP;
    
            for w=1:NumClass
                if first==1
                    CEP(w).EP=EP(w).EP;
                    
                    CEP(w).class=EP(w).class;
                    if w==NumClass
                        first=0;
                    end
                else
                CEP(w).EP=horzcat(CEP(w).EP, EP(w).EP);
                end
            end
            
            %% Update CMB
end

%% Classify EP
set_test=[];
label_out=[];
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
