%% In The Name Of God
%% Emerging Pattern Function
function [Set_EP,efficient_feature1]=EmergingPatternWeka(data,label,stringVal,min_support,min_GR,class,fi,j,efficient_feature)
efficient_feature1=[];
 counter=1;   
 EP=[];
for q=1:numel(stringVal{1}) 

    [row,~]=find(label== class);
    [row1,~]=find(label~= class);
    datain=data(row);
    dataother=data(row1);
    all='All';
    all=strcat(all,char(39));
    all=strcat(char(39),all);  
    val=stringVal{1}{q};
    if strcmp(all,val)
        itemset=[min(data) max(data)];
    else
        z=stringVal{1}{q};
        z(1:2)=[];
        z(end)=[];
        z(end)=[];
        [x,y]=ismember('-',z);
        itemset=[str2num(z(x,1:y-1)) str2num(z(x,y+1:end))];
    end
    [GR,sup_in]=GrowthRate_Interval(datain,itemset,dataother,itemset);
    if sup_in >= min_support        
         if GR>=min_GR
             EP(counter).interval=itemset;
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