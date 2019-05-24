function r = MyConv(image, kernel)
kernel = rot90(kernel);
kernel = rot90(kernel);
[a b] = size(image);
r = zeros(a,b);
[c d] = size(kernel);
mid = (size(kernel)+1)/2;
down = c - mid(1);
up = mid(1) - 1;
right = d - mid(2);
left = mid(2) - 1;
x = up+1;
pi = zeros(down+up+a, right+left+b);
while x < up+a
    x = x+1;
    y = left+1;
while y < left+b
pi(x,y) = image(x-up, y -left);
y = y+1;
end
end
x =1;
while x < a
x = x+1;
y = 1;
while y < b
y = y+1;
j = 1;
while j < c
j = j+1;
i=1;
while i < d
r(x, y) = kernel(i,j)*pi(i + x - 1, j + y - 1) + r(x, y);
i = i+1;
end
end
end
end
end

