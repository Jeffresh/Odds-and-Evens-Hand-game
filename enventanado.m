function segmentos_enventanados = enventanado(senal, ventana)

num_muestras= size(senal,1);
vent = rectwin(num_muestras);

if ventana == "hamm"
    vent = hamming(num_muestras);
elseif ventana == "hann"
    vent = hanning(num_muestras);
end
ventana = repmat(vent,1,size(senal,2));
segmentos_enventanados = senal .* ventana;

end