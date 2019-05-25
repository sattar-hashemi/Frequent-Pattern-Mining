%% In The Name Of Allah
%% Emerging Pattern Classify
function labeltest=Classifier_EP(CEP,set_test,NumClass)
score=[];

for w=1:length(set_test)
    class=[];
     max_test=max(set_test(w).interval);
     min_test=min(set_test(w).interval);
for j=1:NumClass
    score(j)=0;
    class=[class CEP.EP(j).class];
    NumEP=length(CEP.EP(j).EP);
    
    med_score=[];
    for k=1:NumEP
%         EP_Feature=CEP(j).EP(k).feature;
%         if( EP_Feature==feature)
           max_EP=max(CEP.EP(j).EP(k).interval);
           min_EP=min(CEP.EP(j).EP(k).interval);
          if((min_EP<=min_test && max_EP>=max_test )||(min_EP>=min_test && max_EP<=max_test)||(min_EP>=min_test && max_EP>=max_test)||(min_EP<=min_test && max_EP<=max_test))
              GR=CEP.EP(j).EP(k).GrowthRate;
              if isinf(GR)
                  scor=CEP.EP(j).EP(k).support;
                  med_score=[med_score scor];
                  score(j)=score(j)+scor;
              else
                  scor=(GR/(GR+1))*(CEP.EP(j).EP(k).support);
                  med_score=[med_score scor];
                  score(j)=score(j)+scor;
              end
          end
%         end
    end
    med=median(med_score);
    if(NumEP>2)
     score(j)=score(j)/ med;
    end
end

[~,index]=max(score);
labeltest(w)=class(index);
score=[];
end


end
%% End Of Function