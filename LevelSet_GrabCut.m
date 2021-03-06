function[]=LevelSet_GrabCut()

%addpath('C:\mexopencv-master')

%{0:bg, 1:fg, 2:probably-bg, 3:probably-fg}

global M N P  %RGBͼ��(M*N*P)=(512*512*3)

originImage=imread('1.jpg');
[M,N,P]=size(originImage);
originImage=originImage(:,:,1);  %�Ҷ�ͼ
filledImage=FillOutOfCircle(originImage);
mountainImage=LevelSet(filledImage);

bandTrimap=ExpandBand(mountainImage);

resultImage=GrayGrabCut(filledImage, bandTrimap);

figure;
imshow(resultImage);
end