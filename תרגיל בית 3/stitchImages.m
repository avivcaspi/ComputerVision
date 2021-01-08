function stitchedImage = stitchImages(img1,img2_warped)
pad_r = 200;
stitchedImage = padarray(img1, [0, pad_r, 0], 'post'); % Red channel
img2_warped(stitchedImage > 0) = 0;

stitchedImage = stitchedImage + img2_warped;
end

