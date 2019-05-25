%% In The Name Of Allah
%% calculate Of CutPoint
function [set,label_out] = CutPoint(data,label)
point=[];
sizes=size(data,1);
[~,index]=sort(data);
label_out=[];
for k=1:sizes-1
    if(label(index(k))~=label(index(k+1)))
       point=[point (data(index(k))+data(index(k+1)))/2]; 
    end
end
[uniq_point] = unique(point);
min_data=min(data);
max_data=max(data);
if(length(uniq_point)>=1)
if(min_data==uniq_point(1))
    uniq_point(1)=[];
end
end
if(length(uniq_point)>=1)
 if(max_data==uniq_point(end))
      uniq_point(end)=[];
 end
end
for i=1:length(uniq_point)
   set(i).interval=[min_data uniq_point(i)];
   [row1,~]=find(data>=min_data & data<=uniq_point(i),1,'first');
   label_o=unique(label(row1));
   label_out=[label_out label_o(1)];    
   min_data=uniq_point(i);
end
set(length(uniq_point)+1).interval=[min_data max_data];
[row1,~] = find(data>=min_data & data<=max_data,1,'first');
   label_o=unique(label(row1));
   label_out=[label_out label_o(1)]; 
end
%% End of Function