img = imread('C:/Users/User/Downloads/result.png');
[coords, res] = func1(img);
imshow(res);
f = fopen("C:/Users/User/Downloads/coords.txt", "w");
for i = 1:size(coords, 1)
    fprintf(f, "%d %d\n", coords(i, 1), coords(i, 2));
endfor
fclose(f);
