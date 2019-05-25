%% IN The Name Of God
%% Function
function [data,label,Continuous]=ReadData(Type)

switch Type
    case 'N'
        [data,label,Continuous]=Nominal('vote');
        disp('DataSet: vote');
    case 'C'
        [data,label,Continuous]=ContinuousData('heart');
        disp('DataSet: heart');
    case 'N_C'
        [data,label,Continuous]= Nominal_Continuous('labor');
end

end
%% End Of Function