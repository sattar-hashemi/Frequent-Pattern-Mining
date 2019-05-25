%% In The Name Of Allah
%% Growth Rate
function [rate,sup]=GrowthRate(ItemsetM,M,ItemsetL,L)
sup=Support(ItemsetM,M);
if sup==0
    rate=0;
    return;
end
rate=sup/Support(ItemsetL,L);
end
%% End Of Function