images = loadMNISTImages('train-images.idx3-ubyte');
labels = loadMNISTLabels('train-labels.idx1-ubyte');
etiqueta = 59999; % A posi��o da imagem
imagem_etiqueta = images(1:end,labels(etiqueta)); % vetor de 784 posi��es

% Colocando as dimens�es de 28x28 px
images_t = reshape(imagem_etiqueta, 28, 28);
% Mostarndo a imagem n�mero 59999
imshow(images_t)