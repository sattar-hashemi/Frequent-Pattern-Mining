%% In The Name Of God
%% Identify and Remove Features of irrelevant
function [out,weak,weakclass] = Irrelevant1(data,label,fi,Numclass,class,feature)
weak = 0;
out=1;
weakclass=0;
for j=1:Numclass
    prob_class=length(find(label== class(j)))/(length(label));    
    for k=1:length(feature)
        labelfi=label(data(:,fi)== feature(k));
        prob_cond_fi=length(find(labelfi== class(j)))/(length(labelfi));
        if prob_class~=prob_cond_fi
            out=0;
            return;
        end
    end
end 
end
%% End Of Function