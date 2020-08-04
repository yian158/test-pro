clc;
clear;
close all;


path(path,'data_sets');             % the path of data sets

dataSet = importdata('Iris.mat');   
dataGroup = importdata('IrisGroup.mat');  
[ data, label, K ] = NormalizingMethod( dataSet, dataGroup );