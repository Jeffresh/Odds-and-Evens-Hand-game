Fs = 8000;
canales = 1;
num_bits = 16;
tiempo = 2;

recObj = audiorecorder(Fs,num_bits,canales);
disp('Start speakin')
recordblocking(recObj, tiempo);
disp('End of Recording');
%Play back the recording. 
%play(recObj);

senal = getaudiodata(recObj);
 

% Preénfasis
a = 0.95;
y = filter([1 -a], 1, senal);

% Segmentacion
long_ventana_tiempo = 0.03; % segundos N
num_muestras = long_ventana_tiempo * Fs; % Numero de tramas
despl = round(0.5 * num_muestras); % M


segmentos = segmentacion( y,num_muestras,despl);

ventana = "hann";


num_segmentos_ruido = 10;

palabra_envent = inicio_fin(segmentos,ventana,num_segmentos_ruido);

itr = recons_senal(palabra_envent,despl);

sound(itr)