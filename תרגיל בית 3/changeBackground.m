function new_image = changeBackground(image, mask, bg)

new_image = image .* mask + bg .* (1 - mask);

end

