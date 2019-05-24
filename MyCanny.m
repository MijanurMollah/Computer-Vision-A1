function m = MyCanny(image, sigma, thresh)
img = imread(image);
img = rgb2gray(img);
img = im2double(img);
g = fspecial('gaussian', 3, sigma);
img = conv2(img, g);
[gx,gy] = gradient(img);
m = sqrt(gx.^2 + gy.^2);
o = atan2(gy, gx);
m = m * 255;
m = m >= thresh;
end