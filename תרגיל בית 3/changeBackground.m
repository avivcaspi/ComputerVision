function new_image = changeBackground(image, mask, bg)
% uses the mask to remove corrent background and add the new one
new_image = image .* mask + bg .* (1 - mask);

end

