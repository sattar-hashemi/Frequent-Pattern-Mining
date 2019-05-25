%% In The Name Of Allah
%% Emerging Pattern Classify
function labeltest=Classifier_EP_Total(CEP,sample,NumClass,class,continuos)
score=[];
    
for j=1:NumClass
    score(j)=0;
    med_score=[];
   if ~isempty(CEP(j))
    for k=1:numel(CEP(j).EP)
        fea=CEP(j).EP(k).feature;
         fi=sample(fea);
         interval=CEP(j).EP(k).interval;
         
         if continuos(fea)==0         
             
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
         else 
           max_EP=max(interval);
           min_EP=min(interval);
          if((fi >= min_EP && fi <= max_EP))
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
 
    end
   end
    med=median(med_score);
%     if(numel(med_score)>2)
%      score(j)=score(j)/ med;
%     end
end

[~,index]=max(score);
labeltest=class(index);
score=[];
end
%% End Of Function