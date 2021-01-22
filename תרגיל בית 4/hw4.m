close all;
clear;
clc;


%% Part 1
frames = im2double(imread("seq.gif","gif","Frames","all"));
N = 16;
t = 1;
flow = get_flow(frames, N, t);

%% Part 2
[x,y] = meshgrid(N/2:N:512);
filename = ['result_N_' , num2str(N) , '_t_' , num2str(t) , '.gif'];
h = figure;
axis tight manual
for i=1:size(frames,4)-1
    imshow(frames(:,:,:,i), []);
    hold on
    quiver(x,y, flow(:,:,1,i), flow(:,:,2,i));
    hold off
    title(['N=' , num2str(N) , ', t=' , num2str(t)]);

    frame = getframe(h); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256);
    % Write to the GIF File 
    if i == 1 
      imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
    else 
      imwrite(imind,cm,filename,'gif','WriteMode','append'); 
    end 
end


%% Part 3
N = 16;
t = 0.1;
filename = ['result_N_' , num2str(N) , '_t_' , num2str(t) , '.gif'];
flow = get_flow(frames, N, t);
[x,y] = meshgrid(N/2:N:512);
h = figure;
axis tight manual
for i=1:size(frames,4)-1
    imshow(frames(:,:,:,i), []);
    hold on
    quiver(x,y, flow(:,:,1,i), flow(:,:,2,i));
    hold off
    title(['N=' , num2str(N) , ', t=' , num2str(t)]);
    
    frame = getframe(h); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256);
    % Write to the GIF File 
    if i == 1 
      imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
    else 
      imwrite(imind,cm,filename,'gif','WriteMode','append'); 
    end 
end


%% Part 4
N = 8;
t = 1;
filename = ['result_N_' , num2str(N) , '_t_' , num2str(t) , '.gif'];
flow = get_flow(frames, N, t);
[x,y] = meshgrid(N/2:N:512);
h = figure;
axis tight manual
for i=1:size(frames,4)-1
    imshow(frames(:,:,:,i), []);
    hold on
    quiver(x,y, flow(:,:,1,i), flow(:,:,2,i));
    hold off
    title(['N=' , num2str(N) , ', t=' , num2str(t)]);
    
    frame = getframe(h); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256);
    % Write to the GIF File 
    if i == 1 
      imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
    else 
      imwrite(imind,cm,filename,'gif','WriteMode','append'); 
    end 
end

N = 8;
t = 0.1;
filename = ['result_N_' , num2str(N) , '_t_' , num2str(t) , '.gif'];
flow = get_flow(frames, N, t);
[x,y] = meshgrid(N/2:N:512);
h = figure;
axis tight manual
for i=1:size(frames,4)-1
    imshow(frames(:,:,:,i), []);
    hold on
    quiver(x,y, flow(:,:,1,i), flow(:,:,2,i));
    hold off
    title(['N=' , num2str(N) , ', t=' , num2str(t)]);
    
    frame = getframe(h); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256);
    % Write to the GIF File 
    if i == 1 
      imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
    else 
      imwrite(imind,cm,filename,'gif','WriteMode','append'); 
    end 
end
