%% In The Name Of Allah
%% Support Function
function [sup]=Support(Itemset,X)
numf=numel(find(Itemset==X));
num=numel(Itemset);
sup=numf/num;
end
%% End Of Function