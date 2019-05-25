%% In The Name Of Allah

function [w] = OnlineRELIEF ( data, label,type,T )
m=numel(label);
idx = randperm(m);
idx = idx(1:T);
min_data=min(data);
max_data=max(data);
    w=0;
for t = 1:T
    
    x = data(idx(t));    
    y = label(idx(t));
    
    
    data1=data;
    data1(idx(t))=[];
    label1=label;
    label1(idx(t))=[];
    
        instance=data1(label1==y);
        protos = repmat(x, numel(instance), 1);
        distance=sqrt((instance-protos).^2);
        [~,ix]=sort(distance);
        
        instance_not=data1(label1~=y);
        protos = repmat(x, numel(instance_not), 1);
        distance_not=sqrt((instance_not-protos).^2);
        [~,ix_not]=sort(distance_not);
        
        hitvalue=instance(ix(1));
        missvalue=instance_not(ix_not(1));
       
    w=UpdateWeight(w,x,hitvalue,missvalue,type,min_data,max_data);
end
w=(1/m)*w;
end

function w=UpdateWeight(w,x,hitvalue,missvalue,type,min_data,max_data)
neighbor=diff(x,hitvalue,type,min_data,max_data);
neighbor_not=diff(x,missvalue,type,min_data,max_data);
w=w-neighbor+neighbor_not;
end

function out=diff(x,near,type,min_data,max_data)
if type==0
    if (isequal(x,near))
        out=0;
    else
        out=1;
    end
else
    out=(x-near)/(max_data-min_data);
end
end