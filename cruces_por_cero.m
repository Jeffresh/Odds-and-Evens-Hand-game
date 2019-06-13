function salida = cruces_por_cero(segmentos,ventana)

segmentos_enventanados = enventanado( segmentos, ventana);
signos = sign(segmentos_enventanados);
salida = sum(abs(signos(2:end,:) - signos(1:end-1,:)))/ 2*size(segmentos_enventanados,1);

end