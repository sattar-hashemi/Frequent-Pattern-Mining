%% In The Name Of Allah
%% Support Function
function [sup]=SupportRedundant(Itemset,X,Itemseti,fi)
numfi=numel(find(Itemseti==fi));
numf=numel(find(Itemset==X));
numi=numel(Itemseti);
num=numel(Itemset);
sup=(numfi+numf)/(numi+num);
end
%% End Of Function