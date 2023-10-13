function [ output_args ] = smoothFun( input_args,val )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
output_args = imfilter(input_args, [1 1 1 1 1]*val); %filter parameters
end

