function [dataName,attributeName, attributeType, data]= arffRead(fileName)
% ARFFREAD  Reads arff formatted file.
%          
% USAGE:
%       [dataName,attributeName, attributeType, data] = arffRead(fileName)
%
% INPUT:    
%       fileName:       file name to be read
%       
% OUTPUT: 
%       dataName:       relation name of the arff file
%       attributeName:       attribute name of attribute as cell array
%                       { nAttr by 1}
%       attributeType:       attribute type of attribute as cell array
%                       { nAttr by 1}
%       data:           data (nInstan by nAttr)
% 
% See also ARFFWRITE     

% Copyright 2004-2004 by Durga Lal Shrestha.
% eMail: durgals@hotmail.com
% $Date: 2004/06/23 
% $Revision: 3.2.0 $ $Date: 2004/08/16 $  
% 

% ***********************************************************************
if nargin < 1,
	error('No input arguments!');
end
if nargin > 1,
	error('Too many input arguments!');
end
% read whole string
wholeData = textread(fileName,'%s','delimiter','\n','whitespace','');
atRelation = '@relation';
atAttribute = '@attribute';
atData = '@data';
noOfLines = size(wholeData,1);
k=0;
%************************************************************************
% Finding data name
for i=1:noOfLines
	k = findstr(wholeData{i},atRelation);
	if k ~= 0;
		lineAtRelation = i;
		[token,dataName] = strtok(wholeData{lineAtRelation});
		break
	end
end
% Check whether dataName has whitespaces
tf = isspace(dataName);
tf = find(tf ==1);
if size(tf,2)>1
	dataName = dataName(2:tf(2)-1);
else
	dataName = dataName(2:size(dataName,2));
end
	

%************************************************************************
% Finding attribute name
lineAtAttribute =[];
k=0;
l=0;
j = 0;
for i=lineAtRelation+1:noOfLines
	k = findstr(wholeData{i},atAttribute);
	if k ~= 0;
		lineAtAttribute =[lineAtAttribute i];
		[chopped,remainder] = strtok(wholeData{i});
		[attrName,remAttrType] = strtok(remainder);
		[attrType,rem] = strtok(remAttrType);
		j=j+1;
		attrVector{j} = attrName;
    	attrTypeVector{j} = attrType;
	end
	l = findstr(wholeData{i},atData);
	if l ~= 0;
		lineAtData = i;
		break
	end
end

%************************************************************************
% Finding whether data is tab formatted or csv and the position of data
k = [];
Counter=1;
attributeName = attrVector ;
attributeType = attrTypeVector;
for i=lineAtData+1:noOfLines
	str = wholeData{i};
    data(Counter,:)=str2num(str);
	Counter=Counter+1;
end

end
