%% In The Name Of God
%% Emerging Pattern Function
function [Set_EP,efficient_feature1]=EmergingPattern(data,label,map,min_support,min_GR,class,fi,j,efficient_feature)
efficient_feature1=[];
 counter=1;   
 EP=[];
for q=1:numel(map) 

    [row,~]=find(label== class);
    [row1,~]=find(label~= class);
    datain=data(row);
    dataother=data(row1);
    itemset=map(q).interval;
    [GR,sup_in]=GrowthRate_Interval(datain,itemset,dataother,itemset);
    if sup_in >= min_support        
         if GR>=min_GR
             EP(counter).interval=map(q).interval;
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