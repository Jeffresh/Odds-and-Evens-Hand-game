function salida = energia(segmentos, ventana)
segmentos_enventanados = enventanado( segmentos, ventana);
salida = sum(segmentos_enventanados.^2);
end