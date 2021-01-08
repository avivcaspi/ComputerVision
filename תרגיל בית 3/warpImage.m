function I_warped = warpImage(I,H)
pad_r = 200;
I = padarray(I, [0, pad_r,0], 'post');
I_r =I(:,:,1); % Red channel
I_g = I(:,:,2); % Green channel
I_b = I(:,:,3); % Blue channel
[rows, cols] = size(I_r);

[mesh_x, mesh_y] = meshgrid(1:cols, 1:rows);
indices = [mesh_x(:) mesh_y(:) ones(cols*rows,1)]';
inv_H = inv(H);
translated_indices = inv_H * indices;
translated_indices = translated_indices ./ translated_indices(3,:);
Xq = reshape(translated_indices(1,:), [rows, cols]);
Yq = reshape(translated_indices(2,:), [rows, cols]);

I_r_warped = interp2(mesh_x, mesh_y, I_r, Xq, Yq);
I_g_warped = interp2(mesh_x, mesh_y, I_g, Xq, Yq);
I_b_warped = interp2(mesh_x, mesh_y, I_b, Xq, Yq);

I_warped = cat(3, I_r_warped, I_g_warped, I_b_warped);
end