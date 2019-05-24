%1.1
fprintf("name");
pause;
a = [0,-5,0,0,0,0,0,0,0,0;
     0,0,0,0,0,0,0,0,0,0;
     0,7,-2,-8,1,-2,1,3,0,0;
     0,0,-1,-1,0,0,1,1,0,0;
     0,0,-3,-1,2,-4,1,5,0,0;
     0,0,1,1,0,0,-1,-1,0,0;
     0,0,-1,-2,-2,-2,3,4,0,0;
     0,0,0,0,0,0,0,0,0,0;
     0,0,0,0,0,0,0,0,0,0
     ];
fprintf('1.1\n');
fprintf('%d %d %d %d %d %d %d %d %d %d\n',a);
fprintf('\n');
pause;

%1.2
g1 = 1*0 + 0*0 -1*-7 + 1*0 + 0*0 - 1*0;
g2 = 1*-7 + 0*2 -1*1 + 1*0 + 0*2 - 1*1;
g3 = 1*0 + 0*-1 -1*-1 + 1*3 + 0*-1 -1*-1;
fprintf('1.2\n');
fprintf('%d ', g1,g2,g3);
fprintf('\n\n');
pause;

%1.4
img = imread('4.1.06.tiff');
img = rgb2gray(img);
img = im2double(img);
k = fspecial('gaussian', 13, 2);
r1 = imfilter(img, k);
r2 = MyConv(img, k);
r3 = imsubtract(r1,r2);
r3 = abs(r3);
figure, imshow(r3);
fprintf('1.4\n');
fprintf("No there isn't a difference and neither is there supposed to be one\n\n");
pause;

%1.5
g_filt_2d = fspecial('gaussian', 3, 8);
g_filt_v = fspecial('gaussian', [3 1], 8);
g_filt_h = fspecial('gaussian', [1 3], 8);
%tic;
r1 = imfilter(img, g_filt_2d);
%toc;
%tic;
r2 = imfilter(img, g_filt_v);
r2 = imfilter(r2, g_filt_h);
%toc;
fprintf('1.5\n');
fprintf("It takes longer to seperably convolve with two different filters instead of just using one\n\n");
pause;

%2.1
g1 = fspecial('gaussian', 3, 8);
tic;
conv2(img, g1);
t1 = toc;
g1 = fspecial('gaussian', 5, 8);
tic;
conv2(img, g1);
t2 = toc;
g1 = fspecial('gaussian', 7, 8);
tic;
conv2(img, g1);
t3 = toc;
g1 = fspecial('gaussian', 13, 8);
tic;
conv2(img, g1);
t4 = toc;
g1 = fspecial('gaussian', 21, 8);
tic;
conv2(img, g1);
t5 = toc;
g1 = fspecial('gaussian', 31, 8);
tic;
conv2(img, g1);
t6 = toc;
g1 = fspecial('gaussian', 41, 8);
tic;
conv2(img, g1);
t7 = toc;
g1 = fspecial('gaussian', 51, 8);
tic;
conv2(img, g1);
t8 = toc;
g1 = fspecial('gaussian', 71, 8);
tic
conv2(img, g1);
t9 = toc;
A = [t1 t2 t3 t4 t5 t6 t7 t8 t9];
B = [3 5 7 13 21 31 41 51 71];
figure, plot(B,A);
pause;

%2.2
img_f = fft(img);
g1 = fft(fspecial('gaussian', 3, 8));
tic
conv2(img_f, g1);
t1 = toc;
g1 = fft(fspecial('gaussian', 5, 8));
tic;
conv2(img_f, g1);
t2 = toc;
g1 = fft(fspecial('gaussian', 7, 8));
tic;
conv2(img_f, g1);
t3 = toc;
g1 = fft(fspecial('gaussian', 11, 8));
tic;
conv2(img_f, g1);
t4 = toc;
g1 = fft(fspecial('gaussian', 21, 8));
tic;
conv2(img_f, g1);
t5 = toc;
g1 = fft(fspecial('gaussian', 31, 8));
tic;
conv2(img_f, g1);
t6 = toc;
g1 = fft(fspecial('gaussian', 41, 8));
tic;
conv2(img_f, g1);
t7 = toc;
g1 = fft(fspecial('gaussian', 51, 8));
tic;
conv2(img_f, g1);
t8 = toc;
g1 = fft(fspecial('gaussian', 71, 8));
tic;
conv2(img_f, g1);
t9 = toc;
A = [t1 t2 t3 t4 t5 t6 t7 t8 t9];
hold on;
plot(B,A);
hold off;
pause;

%2.3
fprintf("2.3\n");
fprintf("For each plot the time increases as the size of the kernel increases to do the convolution.\n");
fprintf("The conclusion I can draw is that as the size of the kernel increases the time increases more \n");
fprintf("for the convolution in the frequency domain than in the spatial domain.\n\n");
pause;

%3
img1 = imread('4.1.06.tiff');
img1 = rgb2gray(img1);
img1 = imgaussfilt(img1, 5);
img2 = imread('4.1.07.tiff');
img2 = rgb2gray(img2);
img2 = locallapfilt(img2, 20, 1.01);
figure, imshow(img2+img1);
pause;

%4.1
img1 = imread("City.jpeg");
img1 = img1(1:333,1:333,:);
img1 = rgb2gray(img1);
img1 = im2double(img1);
img1 = fft2(img1);
amp1 = abs(img1);
phase1 = angle(img1);
img2 = imread("Face.jpeg");
img2 = img2(1:333,1:333,:);
img2 = rgb2gray(img2);
img2 = im2double(img2);
img2 = fft2(img2);
amp2 = abs(img2);
phase2 = angle(img2);
img1 = amp1 .* exp(1j*phase2);
img2 = amp2 .* exp(1j*phase1);
img1 = real(ifft2(img1));
img2 = real(ifft2(img2));
figure, imshow(img1);
figure, imshow(img2);
pause;

%4.2
fprintf('4.2\n');
fprintf("The two images exchanged their patterns. \n\n");
pause;

%5.1
a = MyCanny("bowl-of-fruit.jpg", 5, 7);
figure, imshow(a);
pause;

%5.2
img = imread("bowl-of-fruit.jpg");
img = rgb2gray(img);
img = im2double(img);
g_filt_v = fspecial('gaussian', [7 1], 10);
g_filt_h = fspecial('gaussian', [1 7], 10);
img = conv2(img, g_filt_v);
img = conv2(img, g_filt_h);
figure, imshow(img);
  