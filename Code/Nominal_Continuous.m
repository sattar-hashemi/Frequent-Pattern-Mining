%% In The Name Of Allah
%% Continuous Data
function [data,label,Continuous]= Nominal_Continuous(DataSet)

switch DataSet
    case 'australian'
        [data,label,Continuous]=australian();
    case 'crx'
        [data,label,Continuous]=Crx();
    case 'cleve'
        [data,label,Continuous]=Cleve();
    case 'german'
        [data,label,Continuous]=German();
    case 'hepatitis'
        [data,label,Continuous]=Hepatitis();
    case 'horse_colic'
         [data,label,Continuous]=horse_colic();
    case 'hypothyroid'
        [data,label,Continuous]=Hypothyroid();
    case 'labor'
        [data,label,Continuous]=Labor();
end

end

function [data,label,Continuous]=australian()
%% Read Data of australian
data=dlmread('Matt\australian.all');
size_data=size(data);
label=data(:,size_data(2));
data=data(:,1:size_data(2)-1);

Continuous(1)=0;
Continuous(2:3)=1;
Continuous(4:6)=0;
Continuous(7)=1;
Continuous(8:9)=0;
Continuous(10)=1;
Continuous(11:12)=0;
Continuous(13:14)=1;

end

function [data,label,Continuous]=Crx()
 %% Read Data of Crx.txt
% %% Missing value
% [x,y]=find(data==-1);
% for i=1:numel(unique(y))
%     if Continuous(i)
%         data(x,i)=mean(data(data(:,i)~=-1));
%     else
%         data(x,i)=median(data(data(:,i)~=-1));
%     end
% end
% A1:	b,a.
% A2:	continuous.
% A3:	continuous.
% A4:	u, y, l, t.
% A5:	g, p, gg.
% A6:	c, d, cc, i, j, k, m, r, q, W, x, e, aa, ff.
% A7:	v, h, bb, j, n, z, dd, ff, o.
% A8:	continuous.
% A9:	t,f.
% A10:	t,f.
% A11:	continuous.
% A12:	t,f.
% A13:	g, p, s.
% A14:	continuous.
% A15:	continuous.
data=dlmread('Matt\crxnew.all');
size_data=size(data);
label=data(:,size_data(2));
data=data(:,1:size_data(2)-1);
Continuous(1)=0;
Continuous(2:3)=1;
Continuous(4:7)=0;
Continuous(8)=1;
Continuous(9:10)=0;
Continuous(11)=1;
Continuous(12:13)=0;
Continuous(14:15)=1;
end

function [data,label,Continuous]=Cleve()
%% Read Data of Cleve
data=dlmread('Matt\clevenew.all');
size_data=size(data);
label=data(:,size_data(2));
data=data(:,1:size_data(2)-1);
Continuous(1)=1;
Continuous(2:3)=0;
Continuous(4:5)=1;
Continuous(6:7)=0;
Continuous(8)=1;
Continuous(9)=0;
Continuous(10)=1;
Continuous(11:13)=0;
% 
% %% Missing value
% [x,y]=find(data==-1);
% for i=1:numel(unique(y))
%     if Continuous(i)
%         data(x,i)=mean(data(data(:,i)~=-1));
%     else
%         data(x,i)=median(data(data(:,i)~=-1));
%     end
% end

% buff, sick
% 
%1 Age: continuous
%2 Sex: male, fem
%3 Chest pain type: angina, abnang, notang, asympt
%4 Trestbps: continuous
%5 Cholesterol: continuous
%6 Fasting blood sugar < 120: true, fal
%7 Resting ecg: norm, abn, hyp
%8 Max heart rate: continuous
%9 Exercise induced angina: true, fal
%10 Oldpeak: continuous
%11 Slope: up, flat, down
%12 Number of vessels colored: continuous
%13 Thal: norm, fix, rev
end

function [data,label,Continuous]=German()
%% Read Data of Cleve
data=dlmread('Matt\german.all');
size_data=size(data);
label=data(:,size_data(2));
data=data(:,1:size_data(2)-1);
Continuous(1)=0;
Continuous(2)=1;
Continuous(3:4)=0;
Continuous(5)=1;
Continuous(6:7)=0;
Continuous(8)=1;
Continuous(9:10)=0;
Continuous(11)=1;
Continuous(12)=0;
Continuous(13)=1;
Continuous(14:15)=0;
Continuous(16)=1;
Continuous(17)=0;
Continuous(18)=1;
Continuous(19:20)=0;
end

function [data,label,Continuous]=Hepatitis()
%% Read Data of Cleve
data=dlmread('Matt\hepatitis.all');
size_data=size(data);
label=data(:,size_data(2));
data=data(:,1:size_data(2)-1);
Continuous(1)=1;
Continuous(2:13)=0;
Continuous(14:18)=1;
Continuous(19)=0;
for i=1:size(data,2)
    if data(:,i)==-1
        med=median(data(data(:,i)~=-1),i);
        data(data(:,i)==-1)=med;
    end
end
end

function [data,label,Continuous]=horse_colic()
%% Read Data of Cleve
data=dlmread('Matt\horse-colic.all');
size_data=size(data);
label=data(:,size_data(2));
data=data(:,1:size_data(2)-1);
Continuous(1:2)=0;
Continuous(3:5)=1;
Continuous(6:14)=0;
Continuous(15)=1;
Continuous(16:17)=0;
Continuous(18:19)=1;
Continuous(20)=0;
Continuous(21)=1;
Continuous(22)=0;
for i=1:size(data,2)
    if data(:,i)==-1
        med=median(data(data(:,i)~=-1),i);
        data(data(:,i)==-1)=med;
    end
end
end

function [data,label,Continuous]=Hypothyroid()
%% Read Data of Cleve
data=dlmread('Matt\hypothyroid.all');
size_data=size(data);
label=data(:,size_data(2));
data=data(:,1:size_data(2)-1);
Continuous(1)=1;
Continuous(2:14)=0;
Continuous(15)=1;
Continuous(16)=0;
Continuous(17)=1;
Continuous(18)=0;
Continuous(19)=1;
Continuous(20)=0;
Continuous(21)=1;
Continuous(22)=0;
Continuous(23)=1;
Continuous(24)=0;
Continuous(25)=1;
for i=1:size(data,2)
    if data(:,i)==-1
        med=median(data(data(:,i)~=-1),i);
        data(data(:,i)==-1)=med;
    end
end
end


function [data,label,Continuous]=Labor()
%% Read Data of Cleve
data=dlmread('Matt\labor-neg.all');
size_data=size(data);
label=data(:,size_data(2));
data=data(:,1:size_data(2)-1);
Continuous(1:4)=1;
Continuous(5)=0;
Continuous(6)=1;
Continuous(7)=0;
Continuous(8:9)=1;
Continuous(10)=0;
Continuous(11)=1;
Continuous(12:16)=0;

for i=1:size(data,2)
    if data(:,i)==-1
        med=median(data(data(:,i)~=-1),i);
        data(data(:,i)==-1)=med;
    end
end

end

