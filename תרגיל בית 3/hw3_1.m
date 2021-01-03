close all;
clear;
clc;



building1 = imread("building\building1.JPG");
building2 = imread("building\building2.JPG");

figure();
subplot(1,2,1);
imshow(building1, []);
title("Image 1");

subplot(1,2,2);
imshow(building2, []);
title("Image 2");



addpath('sift');

building1_gray = im2double(rgb2gray(building1));
building2_gray = im2double(rgb2gray(building2));

[frames,descriptors] = sift(building1_gray);
