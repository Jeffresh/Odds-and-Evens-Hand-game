function jh = captura_mano()
% cam = webcam(1);
% set(gcf,'currentchar',' ');
% while get(gcf,'currentchar')==' '
%     img = snapshot(cam);
% 
%     imshow(img,[]);
% 
% end
% 



cam=webcam(1);

figure(1),
m3=imread('numero3.png');
imshow(m3),hold on;
pause(1)
m2=imread('numero2.png');
imshow(m2),hold on;
pause(1)
m1=imread('numero1.png');
imshow(m1),hold on;
pause(1)
m0=imread('ya.png');
imshow(m0),hold on;
pause(1)
preview(cam), hold off;

pause(5)


img = snapshot(cam);
pause(1)
close;
clear cam;
imagen = imsubtract(img(:,:,1), rgb2gray(img));
imagen = medfilt2(imagen, [10 10]);
imb = im2bw(imagen,0.05);
ele = strel('square',10);
imagenaria = imopen(imb, ele);

%figure,imshow(imagenaria);

%centrado de la imagen
imagenaria=bwlabel(imagenaria);
centro = regionprops(imagenaria,'Centroid');
giro = regionprops(imagenaria,'Orientation');

if giro.Orientation < 0
    angulo = -(giro.Orientation + 90);
else
    angulo = 90 - giro.Orientation;
end

centroids = cat(1, centro.Centroid);
imagen = imrotate(imagen,angulo);
imagenaria=imrotate(imagenaria,angulo);
%figure, imshow(imagenaria);

pos = size(imagenaria,1);
max_n = 0;
centro = regionprops(imagenaria,'Centroid');
centroids = cat(1, centro.Centroid);
pos = centroids(2);
imagenaria2=imagenaria;
while pos >=1
    imagenaria2(pos:size(imagenaria,1),:)=0;
    [~,n] = bwlabel(imagenaria2);
    if n > max_n
        max_n = n
    end
    pos = pos - 100;
end
max_n2=max_n;
max_n = 0;
pos = centroids(2);
imagenaria(1:pos,:)=0;
pos = size(imagenaria,1);
while pos >= 1
    imagenaria(pos:size(imagenaria,1),:)=0;
    [~,n] = bwlabel(imagenaria);
    if n > max_n
        max_n = n;
    end
    pos = pos - 100;
end
if(max_n==2)
    max_n2=max_n2+1;
end
jh=max_n2;
%jh=inputdlg({'Introduzca número del 1 al 5'},"Tú turno?",1);
 %       jh = str2num(cell2mat(jh));
end

