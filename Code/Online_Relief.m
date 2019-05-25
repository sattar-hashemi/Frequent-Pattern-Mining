%% In The Name Of Allah
function w=Online_Relief(data,label,Number_Nearest,weight_old,Continuous)

idx = randperm(length(label));
idx = idx(1:Number_Nearest);

for t = 1:Number_Nearest
    
    x = data(idx(t));
    y = label(idx(t));
    
    %copy the x
    protos = repmat(x, length(label), 1);
    %measure the distance from x to every other example
    distances = [sqrt(sum((data-protos).^2,2)) label];
    %sort them according to distances (find nearest neighbours)
    [distances originalidx] = sortrows(distances,1);
    
    foundhit = false;  hitidx=0;
    foundmiss = false; missidx=0;
    i=2; %start from the second one
    while (~foundhit || ~foundmiss)

        if distances(i,2) == y
            hitidx = originalidx(i);
            foundhit = true;
        end
        if distances(i,2) ~= y
            missidx = originalidx(i);
            foundmiss = true;
        end
        
        i=i+1;

    end    
    
    
    alpha = 1/Number_Nearest;
%     for f = 1:size(data_feature,2)%each feature
if(Continuous)
        hitpenalty  = (x-data(hitidx))  / (max(data)-min(data));
        misspenalty = (x-data(missidx)) / (max(data)-min(data));
else
    if(x==data(hitidx))
    hitpenalty=0;
    else
     hitpenalty=1;   
    end
    
    if (x==data(missidx))
        misspenalty=0;
    else
       hitpenalty=1; 
    end
end
        
        w = weight_old - alpha*hitpenalty^2 + alpha*misspenalty^2;
%     end
    
end

end