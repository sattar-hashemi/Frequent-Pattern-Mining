%% In The name Of Allah
function [outputTrain]=DiscretizeWeka(data,label)
% Add weka paths
data = [data label];
WEKA_HOME = 'C:\Program Files\Weka-3-7';
javaaddpath([WEKA_HOME '\weka.jar']);

save data.txt data -ascii;
loader = weka.core.converters.MatlabLoader();
loader.setFile( java.io.File('data.txt') );
train1 = loader.getDataSet();
train1.setClassIndex(train1.numAttributes()-1 );

% convert last attribute (class) from numeric to nominal
filter = weka.filters.unsupervised.attribute.NumericToNominal();
filter.setOptions( weka.core.Utils.splitOptions('-R last') );
filter.setInputFormat(train1);   
train1 = filter.useFilter(train1, filter);
discretize=weka.filters.supervised.attribute.Discretize();
discretize.setInputFormat(train1);
outputTrain = discretize.useFilter(train1, discretize);
end