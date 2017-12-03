clear all;close all;

tmpNoise = imread('templateNoise.png');
wldNoise = imread('waldoNoise.png');

findWaldo(wldNoise, tmpNoise);