function out = findWaldo(im_input, filter_input)

% convert image (and filter) to grayscale
im = rgb2gray(im_input);
im = double(im);
filter = rgb2gray(filter_input);
filter = double(filter);

% normalizing filter
filter = filter/sqrt(sum(sum(filter.^2)));

% filter size
filterSize = size(filter);

% normalized cross-correlation
out = normxcorr2(computeGradient(filter, 0.044), computeGradient(im, 0.044));

% find the peak in response
[y,x] = find(out == max(out(:)));
yOffset = y(1) - filterSize(1) + 1;
xOffset = x(1) - filterSize(2) + 1;

% plot the cross-correlation results
figure('position', [100,100,size(out,2),size(out,1)]);
subplot('position',[0,0,1,1]);
imagesc(out);
axis off;
axis equal;

% plot the detection's bounding box
figure('position', [100,100,size(im,2),size(im,1)]);
subplot('position',[0,0,1,1]);
imshow(im_input);
axis off;
axis equal;
imrect(gca, [xOffset,yOffset,filterSize(2),filterSize(1)]);

end