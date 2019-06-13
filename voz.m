function nrmcdc = voz()
Fs = 8000;
canales = 1;
num_bits = 16;
tiempo = 2;
a = 0.95;
ventana = "hann";
load('config.mat');

recObj = audiorecorder(Fs,num_bits,canales);
disp('Start speakin')
recordblocking(recObj, tiempo);
disp('End of Recording');

senal = getaudiodata(recObj);

% Preénfasis

y = preenfasis(senal,a);

% Segmentación

long_ventana_tiempo = 0.03; % segundos N
num_muestras = long_ventana_tiempo * Fs; % Numero de tramas
despl = round(0.3 * num_muestras); % M no se porque ha puesto 


segmentos = segmentacion( y,num_muestras,despl);

num_segmentos_ruido = 10 ;
palabra = inicio_fin(segmentos,ventana,num_segmentos_ruido);

palabra_enventanada = enventanado(palabra,ventana);

% Cálculo de ceps

p = 3 ; % Grado de vecindad
nceps = 12;

cepsdceps = ceps_deltacps(nceps,p, palabra_enventanada);

medias = mean( cepsdceps);

medias = repmat(medias, size(cepsdceps,1),1);

dtips = std( cepsdceps);
dtips = repmat(dtips, size(cepsdceps,1),1);
nrmcdc = (cepsdceps-medias)./dtips;

end