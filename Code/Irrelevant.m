%% In The Name Of God
%% Identify and Remove Features of irrelevant
function [out] = Irrelevant(data,label,Numclass,class,feature)
out=1;
for j=1:Numclass
    [row,~]=find(label== class(j));
    [row1,~]=find(label~= class(j));    
    datafi=data(row);
    datafi1=data(row1);
   for k=1:length(feature) 
       [GR,~]=GrowthRate(datafi,feature(k),datafi1,feature(k));
     if GR~=1
         out=0;
         return;
     end
     if Numclass==2
         return;
     end
   end
end
 
end
%% End Of Function