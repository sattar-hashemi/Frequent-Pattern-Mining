%% In The Name Of Allah
%% Continuous Data
function [data,label,Continuous]=ContinuousData(DataSet)

switch DataSet
    case 'Breast_w'
       [data,label,Continuous]=Breast_w();
    case 'diabetes'
        [data,label,Continuous]=diabetes();
    case 'madelon'
        [data,label,Continuous]=madelon();
    case 'Arcene'
        [data,label,Continuous]=Arcene();
    case 'dexter'
        [data,label,Continuous]=dexter();
    case 'dorothea'
        [data,label,Continuous]=dorothea();
    case 'colon'
        [data,label,Continuous]=colon();
    case 'leukemia'
        [data,label,Continuous]=leukemia();
    case 'lungCancer'
        [data,label,Continuous]=lungCancer();
    case 'spectf'
        [data,label,Continuous]=SPECTF();
    case 'pima'
        [data,label,Continuous]=pima();
    case 'liver'
        [data,label,Continuous]=liver();
    case 'heart'
        [data,label,Continuous]=heart();
    case 'ionosphere'
        [data,label,Continuous]=ionosphere();
    case 'Ovarian_Cancer'
        [data,label,Continuous]=Ovarian_Cancer();
    case 'Lymphoma'
        [data,label,Continuous]=Lymphoma();
end

end

function [data,label,Continuous]=Breast_w()
%% Read Data of Breast-w.txt
data=dlmread('Matt\Breast-w.txt');
size_data=size(data);
label=data(:,size_data(2));
data=data(:,1:size_data(2)-1);
Continuous(1:size(data,2))=1;
end

function [data,label,Continuous]=diabetes()
%% Read Data of diabetes

data=dlmread('Matt\diabetes.all');
size_data=size(data);
label=data(:,size_data(2));
data=data(:,1:size_data(2)-1);
Continuous(1:size(data,2))=1;
end

function [data,label,Continuous]=madelon()
%% Read Data of madelon
data=dlmread('Matt\madelon_train.data');
label=dlmread('Matt\madelon_train.labels');
Continuous(1:size(data,2))=1;
end

function [data,label,Continuous]=Arcene()
%% Read Data of Arcene
data=dlmread('Matt\arcene_train.data');
label=dlmread('Matt\arcene_train.labels');
Continuous(1:size(data,2))=1;
end

function [data,label,Continuous]=dexter()
%% Read Data of dexter_train.data 
%% Format Data Not Read
data=dlmread('Matt\dexter_train.data');
label=dlmread('Matt\dexter_train.labels');
Continuous(1:size(data,2))=1;
end

function [data,label,Continuous]=dorothea()
data=dlmread('dorothea_train.data');
label=dlmread('dorothea_train.labels');
Continuous(1:size(data,2))=1;
end

function [data,label,Continuous]=colon()
%% Read data of colon-std.arff
data= dlmread('Matt\colon-std.txt');
label=data(:,end);
data(:,end)=[];
Continuous(1:size(data,2))=1;
end

function [data,label,Continuous]=leukemia()
%% leukemia-std.txt
data=dlmread('Matt\leukemia-std.txt');
label=data(:,end);
data=data(:,1:end-1);
Continuous(1:size(data,2))=1;
end

function [data,label,Continuous]=lungCancer()
%% Read Data lungCancer-std.txt
data=dlmread('Matt\lungCancer-std.txt');
label=data(:,end);
data=data(:,1:end-1);
Continuous(1:size(data,2))=1;
end

function [data,label,Continuous]=SPECTF()
%% Read data of SPECTF.train
data=dlmread('Matt\SPECTF.train');
label=data(:,1);
data(:,1)=[];
Continuous(1:size(data,2))=1;
end

function [data,label,Continuous]=pima()
%% Read data 0f pima.all
data=dlmread('Matt\pima.all');
label=data(:,end);
data(:,end)=[];
Continuous(1:size(data,2))=1;
end

function [data,label,Continuous]=liver()
%% Read Data of liver-disorder.all
data=dlmread('Matt\liver-disorder.all');
label=data(:,end);
data(:,end)=[];
Continuous(1:size(data,2))=1;
end

function [data,label,Continuous]=heart()
%% Read Data of liver-disorder.all
data=dlmread('Matt\heart.all');
label=data(:,end);
data(:,end)=[];
Continuous(1:size(data,2))=1;
end

function [data,label,Continuous]=ionosphere()
%% Read Data of liver-disorder.all
data=dlmread('Matt\ionosphere.all');
label=data(:,end);
data(:,end)=[];
Continuous(1:size(data,2))=1;
end

% function [data,label,Continuous]=Ovarian_Cancer()
% %% Read Data of liver-disorder.all
% data=dlmread('Matt\Ovarian_Cancer.dat');
% label=data(:,end);
% data(:,end)=[];
% Continuous(1:size(data,2))=1;
% end

function [data,label,Continuous]=Lymphoma()
%% Read Data of liver-disorder.all
data1=load('Matt\Lymphoma.mat');
data=data1.data;
label1=load('Matt\Lymphoma_class label.mat');
label=label1.target;
Continuous(1:size(data,2))=1;
end