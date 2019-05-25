%% In The Name of Allah
function [data,label,Continuous]=Nominal(DataSet)
switch DataSet
    case 'vote'
        [data,label,Continuous]=vote();
    case 'mushroom'
        [data,label,Continuous]=Mushroom();
    case 'tictactao'
        [data,label,Continuous]=tictactao();
    case 'spect'
        [data,label,Continuous]=SPECT();
    case 'krvskp'
        [data,label,Continuous]=krvskp();
end
end

function [data,label,Continuous]=vote()
%% Read Data of Vote
data=dlmread('Matt\vote.txt');
label=data(:,end);
data=data(:,1:end-1);
Continuous(:,1:size(data,2))=0;
end

function [data,label,Continuous]=Mushroom()
%% Read Data of Mushroom
data=dlmread('Matt\mushroomnonmissing101.all');
label=data(:,end);
data=data(:,1:end-1);
Continuous(1:size(data,2))=0;
end

function [data,label,Continuous]=tictactao() 
%% Read Data of tic-tac-tao
data=dlmread('Matt\tic-tac-toenew.all');
label=data(:,end);
data=data(:,1:end-1);
Continuous(1:size(data,2))=0;
end

function [data,label,Continuous]=SPECT()
%% Read data of SPECT.train
data=dlmread('Matt\SPECT.train');
label=data(:,1);
data(:,1)=[];
Continuous(1:size(data,2))=0;
end

function [data,label,Continuous]=krvskp()
%% read Data of kr-vs-kp.data
data=dlmread('Matt\kr-vs-kp.data');
label=data(:,end);
data(:,end)=[];
Continuous(1:size(data,2))=0;
end