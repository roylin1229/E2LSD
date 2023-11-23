clc; clearvars; close all; addpath('./utils/'); warning('off')

%% related parameters
param.G_th                          = 0.25;                 % T^m_g                          
param.line_angle_error_th           = 20;                   % T^theta_v    
param.line_dis_error_th             = 7;                    % T^d_v    
param.inlier_ratio                  = 0.5;                  % T_{ir}    

img = imread('test_img.jpg');
if numel(size(img)) == 3
    img = rgb2gray(img);
end

%% E2LSD algorithm
[lines] = E2LSD(img, param);

% visualization 
figure
imshow(img)
line([lines(:, 1) lines(:, 3)]', [lines(:, 2) lines(:, 4)]', 'Color', 'g', 'LineWidth', 1)
for i = 1:size(lines, 1)
    hold on
    text((lines(i, 1)+lines(i, 3))/2, (lines(i, 2)+lines(i, 4))/2, num2str(i), 'Color', 'r')
end
title('line segments detected by the E2LSD algorithm')
