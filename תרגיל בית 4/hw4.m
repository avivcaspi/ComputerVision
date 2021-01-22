close all;
clear;
clc;


%% Part 1
frames = im2double(imread("seq.gif","gif","Frames","all"));
N = 16;
t = 1;
flow = get_flow(frames, N, t);

%% Part 2
show_flow(frames, flow, N, t);

%% Part 3
N = 16;
t = 0.1;
flow = get_flow(frames, N, t);
show_flow(frames, flow, N, t);


%% Part 4
N = 8;
t = 1;
flow = get_flow(frames, N, t);
show_flow(frames, flow, N, t);

N = 8;
t = 0.1;
flow = get_flow(frames, N, t);
show_flow(frames, flow, N, t);