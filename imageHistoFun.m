function [ output_args ] = imageHistoFun( input_args)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Image = input_args;
if size(Image, 3) == 3
Image = rgb2gray(input_args);
imhist(Image)
title('After Converting from RGB to Gray');
else
imhist(Image)
title('Without Converting From RGB to Gray ,Already Gray');
end
end

