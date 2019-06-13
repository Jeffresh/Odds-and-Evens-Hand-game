function salida = magnitud(segmentos,ventana)

segmentos_enventanados = enventanado( segmentos, ventana);
salida = sum(abs(segmentos_enventanados));

end