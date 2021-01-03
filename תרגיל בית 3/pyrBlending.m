function [combined] = pyrBlending(I, styledI, n)

I_r = I(:,:,1); % Red channel
I_g = I(:,:,2); % Green channel
I_b = I(:,:,3); % Blue channel

style_r = styledI(:,:,1); % Red channel
style_g = styledI(:,:,2); % Green channel
style_b = styledI(:,:,3); % Blue channel

[~, I_r_L] = pyrGen(I_r, n);
[~, I_g_L] = pyrGen(I_g, n);
[~, I_b_L] = pyrGen(I_b, n);
[~, styled_r_L] = pyrGen(style_r, n);
[~, styled_g_L] = pyrGen(style_g, n);
[~, styled_b_L] = pyrGen(style_b, n);

mask = ones(size(I_r));
mask(:,501:1000) = 0;

[mask_G,~] = pyrGen(mask, n);

combined_L_r = {};
combined_L_g = {};
combined_L_b = {};
for i=1:n
    combined_L_r = [combined_L_r; mask_G{i} .* I_r_L{i} + (ones(size(mask)) - mask_G{i}) .* styled_r_L{i}];
    combined_L_g = [combined_L_g; mask_G{i} .* I_g_L{i} + (ones(size(mask)) - mask_G{i}) .* styled_g_L{i}];
    combined_L_b = [combined_L_b; mask_G{i} .* I_b_L{i} + (ones(size(mask)) - mask_G{i}) .* styled_b_L{i}];
end
recon_r = imRecon(combined_L_r);
recon_g = imRecon(combined_L_g);
recon_b = imRecon(combined_L_b);

combined = cat(3, recon_r, recon_g, recon_b);
end

