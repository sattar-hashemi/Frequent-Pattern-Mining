%% In The Name Of Allah
%% Growth Rate
function [rate]=GrowthRate_fi(ItemsetP,P,ItemsetN,N,Itemseti_P,fi_P,Itemseti_N,fi_N)
sup1=SupportRedundant(ItemsetP,P,Itemseti_P,fi_P);
if sup1==0
    rate=0;
    return;
end
sup2=SupportRedundant(ItemsetN,N,Itemseti_N,fi_N);
rate=sup1/sup2;
end
%% End Of Function