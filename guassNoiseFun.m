function [ output_args ] = guassNoiseFun( input_args )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
output_args = imnoise(input_args,'gaussian')
end

