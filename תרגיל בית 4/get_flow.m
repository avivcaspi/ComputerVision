function [flow] = get_flow(frames,N,t)
% Calculate the derivative dx dy by convoution using [1 -1] filter
dx = [1 -1];
dy = dx';
frame_num = size(frames,4);
frames_dx = convn(frames(:,:,1,:), dx, "same");
frames_dy = convn(frames(:,:,1,:), dy, "same");

% Calculate the derivative dt by substructing the frames 
frames_dt = frames(:,:,1,2:frame_num) - frames(:,:,1,1:frame_num-1);

row_num = size(frames,1);

num_of_regions = row_num / N;

flow = zeros(num_of_regions,num_of_regions,2,frame_num - 1);

for i=1:frame_num-1
    for row=1:num_of_regions
        for col=1:num_of_regions
            % get the pixel that belongs to the region (row,col)
            reg_dx_t = frames_dx((row-1)*N + 1:row*N,(col-1)*N + 1:col*N,:,i)';
            reg_dy_t = frames_dy((row-1)*N + 1:row*N,(col-1)*N + 1:col*N,:,i)';
            % build the A matrix using the derivatives
            A = [reg_dx_t(:)'; reg_dy_t(:)']';
            AtA = A' * A;
            
            % build the vector b
            reg_dt_t = frames_dt((row-1)*N + 1:row*N,(col-1)*N + 1:col*N,:,i)';
            b = -reg_dt_t(:);
            
            % eigen values of AtA
            e = eig(AtA);
            if min(e) > t
                % saving the flow vector of each region
                u = AtA \ (A' * b);
                flow(row,col,:,i) = u;
            end
        end
    end
end

end

