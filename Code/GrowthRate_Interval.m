%% In The Name Of Allah
%% Growth Rate
function [rate,Supp_Inclass]=GrowthRate_Interval(ItemsetM,M,ItemsetL,L)
Supp_Inclass=Support_Interval(ItemsetM,M);
if Supp_Inclass==0
    rate=0;
    return;
end
Supp_other=Support_Interval(ItemsetL,L);
rate=Supp_Inclass/Supp_other;
end
%% End Of Function