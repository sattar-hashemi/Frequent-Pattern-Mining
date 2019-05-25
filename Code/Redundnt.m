%% In The Name Of God
%% Identify and Remove Features of Redundant
function out=Redundnt(data,label,Numclass,class,mb,feature_fi,fi)
num=numel(mb);
T=1;
   for a=1:numel(mb)
        subset=combntns(mb,a);
        out=1;
        for z=1:size(subset,1)            
            out=1;
           feature=unique( data(:,subset(z,:)));
           if(numel(find(ismember(feature_fi,feature)))<numel(feature_fi))&& T==num
               out=0;
               return;
           end
           
           for j=1:Numclass
                [row,~]=find(label == class(j));
                [row1,~]=find(label ~= class(j));
                datasub = data(row,subset(z,:));
                datasub1=data(row1,subset(z,:));
                datasub_fi= data(row,fi);
                datasub_fi1=data(row1,fi);
               for k=1:length(feature_fi)     
                   [GR1,~]=GrowthRate(datasub,feature_fi(k),datasub1,feature_fi(k));
                   [GR2]=GrowthRate_fi(datasub,feature_fi(k),datasub1,feature_fi(k),datasub_fi,feature_fi(k),datasub_fi1,feature_fi(k));
                   if GR1 ~= GR2                  
                     out=0;
                     if T==num
                         return;
                     end
                     break;
                   end
                  
               end
             if Numclass==2 && out==1
             end
           end
           T=T+1;
           if z>1 && out==1
                return;
            end
        end
   end
end