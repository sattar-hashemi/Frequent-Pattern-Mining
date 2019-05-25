%% In The Name Of God
%% Weakly Relevant Function
function out=WeaklyRelevant(data,label,fi)
Numclass=length( unique(label));
class=unique(label);
feature=unique( data(:,fi));

for j=1:Numclass
    [row,col]=find(label== class(j));
    [row1,col1]=find(label~= class(j));
    out=0;
   for k=1:length(feature) 
     if GrowthRate(data(row,fi),feature(k),data(row1,fi),feature(k))~=1
         out=1;
         break;
     end
   end
   if out==1
       break;
   end
end
end
%% End Of Function