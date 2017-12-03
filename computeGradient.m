function [imgGrad] = computeGradient(img, sigma)

%Converting input image to grayscale
imgSzDim = size((size(img)));
if imgSzDim(2) == 3
    img = double(rgb2gray(img));
end

%Setting filter size
fltRadius = 15*sigma;

%Calculating partial derivative of gaussian in x direction
x = (-fltRadius:fltRadius);
gaussianExpPower = exp(-(x.^2)/(2*sigma^2));
gaussian = gaussianExpPower/(sqrt(2*pi)*sigma);
gaussianDerX = (-x/(sigma^2)).*gaussian;

%Calculating partial derivative of gaussian in y direction
y = (-fltRadius:fltRadius);
gaussianExpPower = exp(-(y.^2)/(2*sigma^2));
gaussian = gaussianExpPower/(sqrt(2*pi)*sigma);
gaussianDerY = (-y/(sigma^2)).*gaussian;

%Computing horizontal and vertical image gradients
imgGradX = conv2(img, gaussianDerX);
imgGradY = conv2(img, gaussianDerY);

%Computing magnitude of gradients
imgGrad = sqrt(imgGradX.^2 + imgGradY.^2);

end