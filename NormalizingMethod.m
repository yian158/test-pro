function [ data, label, K ] = NormalizingMethod( dataSet, dataGroup )
%UNTITLED2 此处显示有关此函数的摘要
% NormalizingMethod Summary of this function goes here
% input_args:
%       dataSet   : Data sets to be normalized
%       dataGroup : The clusters' label of Data sets
%
% output_args:
%       data      : The normalized Data sets
%       label     : The final clusters' label of Data sets
%       K         : The number of clusters in Data sets
%
% Demo for UCI data sets : 
%       path(path,'data_sets');
%       dataSet = importdata('Iris.mat');   
%       dataGroup = importdata('IrisGroup.mat');  
%       [ data, label, K ] = NormalizingMethod( dataSet, dataGroup );


%% Normalizing data sets

    [r, c] = size(dataSet);
    data = zeros(r, c);

    for i = 1:c 
        if numel(unique(dataSet(:,i)))==1 
            data(:,i) = 0.5*ones(r,1)';
            continue;
        end

        minq = min(min(dataSet(:,i)));
        maxq = max(max(dataSet(:,i)));

        data(:,i) = (dataSet(:,i)-minq) / (maxq-minq);    
    end

%% Determinethe final clusters' label of Data sets

    label = dataGroup;
    [r, c] = size(dataGroup);

    if r<c 
        label = dataGroup';
    end
    if ismember(0,dataGroup) 
        label = label + 1;
    end
    if numel(unique(label))~=max(max(label))
        for i = 1:numel(unique(label))
            if ~ismember(i,label)
                j = i+1;
                while ~ismember(j,label)
                    j = j+1;
                end
                [r,c]=find(label==j);
                label(r)=i;
            end
        end
    end 
    
    
          

%% Determine the number of clusters in Data sets

    K = numel(unique(label));



end

