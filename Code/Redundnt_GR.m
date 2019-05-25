%% In The Name Of God
%% Identify and Remove Features of Redundant
function out=Redundnt_GR(data,label,fi,CMB)
Numclass=length( unique(label));
class=unique(label);
if(isempty(CMB))
    out=0;
else
    
    for a=1:length(CMB)        
        subset=combntns(CMB,a);
        out=1;
        for z=1:size(subset,1)
           feature=unique( data(:,subset(z,:)));
           for j=1:Numclass
                [row,col]=find(label== class(j));
                [row1,col1]=find(label~= class(j));
                
               for k=1:length(feature) 
                 if GrowthRate([data(row,subset(z,:)) data(row,fi)],feature(k),[data(row1,subset(z,:)) data(row1,fi)],feature(k))~= GrowthRate(data(row,subset(z,:)),feature(k),data(row1,subset(z,:)),feature(k))
                     out=0;
                     break;
                 end
               end
               if out==0
                   break;
               end
           end
           if out==1
               break;
           end
        end
        if out==1
            break;
        end
    end
end
end