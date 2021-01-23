function  x = show_flow(frames,flow, N, t)
% show the arrows in the middel of each region
[x,y] = meshgrid(N/2:N:512);
filename = ['result_N_' , num2str(N) , '_t_' , num2str(t) , '.gif'];
h = figure;
axis tight manual
for i=1:size(frames,4)-1
    % show the flow on top of the frame
    imshow(frames(:,:,:,i), []);
    hold on
    quiver(x,y, flow(:,:,1,i), flow(:,:,2,i));
    hold off
    title(['N=' , num2str(N) , ', t=' , num2str(t)]);
    
    % Save the frames as gif 
    frame = getframe(h); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256);
    % Write to the GIF File 
    if i == 1 
      imwrite(imind,cm,filename,'gif','DelayTime',0.1, 'Loopcount',inf); 
    else 
      imwrite(imind,cm,filename,'gif','DelayTime',0.1,'WriteMode','append'); 
    end 
end
end

