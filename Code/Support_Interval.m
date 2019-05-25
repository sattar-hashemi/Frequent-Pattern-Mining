%% In The Name Of Allah
%% Support Function
function [sup]=Support_Interval(Itemset,X)
min_rang=min(X);
max_rang=max(X);
num_Item=find(Itemset>=min_rang & Itemset<=max_rang);
num=numel(num_Item);
sup=num/numel(Itemset);
end
%% End Of Function