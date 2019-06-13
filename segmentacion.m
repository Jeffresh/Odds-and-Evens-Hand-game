function segm = segmentacion(senal,num_muestras,despl)

segm = buffer(senal,num_muestras,despl,'nodelay');

end