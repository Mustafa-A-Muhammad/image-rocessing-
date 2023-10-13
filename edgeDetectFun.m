function [ output_args ] = edgeDetectFun( B )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

HSV=zeros(size(B));
F1=[-1 0 1; -2 0 2; -1 0 1];
F2=[-1 -2 -1; 0 0 0; 1 2 1];
B=double(B);
% Gx=[-1+0+1]-[-1+0+1];
% Gy=[-1+0+1]-[-1+0+1];
for i=1:size(B,1)-2
    for j=1:size(B,2)-2
        S1=sum(sum(F1.*B(i:i+2,j:j+2)));
			S2=sum(sum(F2.*B(i:i+2,j:j+2)));

			HSV(i+1,j+1)=sqrt(S1.^2+S2.^2);
      end
  end
  %Define a threshold value
  Thresh=130;
  B=max(HSV,Thresh);
  B(B==round(Thresh))=0;
  output_args = B;
end


