%% In The Name Of God
%% Emerging Pattern Function
function [Set_EP,efficient_feature1]=EmergingPatternnCategorical(data,label,min_support,min_GR,class,feature,j,fi,efficient_feature)
 counter=1;   
 EP=[];
 efficient_feature1=[];
for q=1:numel(feature) 
    [row,~]=find(label== class);
    [row1,~]=find(label~= class);
    datain=data(row);
    dataother=data(row1);
    [GR,sup_in]=GrowthRate(datain,feature(q),dataother,feature(q));
    if sup_in >= min_support        
         if GR>=min_GR
             EP(counter).interval=feature(q);
             EP(counter).GrowthRate=GR;
             EP(counter).support=sup_in;
             EP(counter).feature=fi;
             counter=counter+1;
         end
     end
end
Set_EP(j).EP=EP;
Set_EP(j).class=class;
if(~isempty(EP)&& ~ismember(fi,efficient_feature))
    efficient_feature1=[efficient_feature fi];
end
end