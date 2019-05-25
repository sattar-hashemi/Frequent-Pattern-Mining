%% In The Name Of Allah
%% Emerging Pattern Classify
function labeltest=Classifier_EP_categorical(CEP,sample,NumClass,class)
score=[];
    
for j=1:NumClass
    score(j)=0;
    med_score=[];
    for k=1:numel(CEP(j).EP)
         fi=sample(CEP(j).EP(k).feature);
         interval=CEP(j).EP(k).interval;
        if fi == interval
            GR=CEP(j).EP(k).GrowthRate;
             if isinf(GR)
                  scor=CEP(j).EP(k).support;
                  med_score=[med_score scor];
                  score(j)=score(j)+scor;
              else
                  scor=(GR/(GR+1))*(CEP(j).EP(k).support);
                  med_score=[med_score scor];
                  score(j)=score(j)+scor;
              end 
        end
 
    end
%     med=median(med_score);
%     if(NumEP>2)
%      score(j)=score(j)/ med;
%     end
end

[~,index]=max(score);
labeltest=class(index);
score=[];
% end


end
%% End Of Function