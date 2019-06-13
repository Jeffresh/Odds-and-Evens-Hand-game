
for i =1:5
    nums{i} = imread( sprintf('numero%d.png', i));
end

vs = imread('Vs.png');



% jugador humano 1, jugador pc 2
msgbox('Dí tú o yo','quíen empieza?');
pause(1);
pl = whostart() ;

if pl == 1
 msgbox('Vale, empiezo yo');
pause(2);
else
  msgbox('Vale, empiezas tú');
    pause(2);
end


while io ~=0
    
    if pl == 2
        
         msgbox('Dí Pares o nones');
         pause(2)
        jhv = capturar_voz(3);
        
        if jhv == 1
            msgbox('Has elegido pares, yo nones.');
                pause(2);

        else
            
            msgbox('Has elegido nones, yo pares');
                pause(2);

        end
        
        pause(3);
        jhm = captura_mano();
            
        jpc = randi(5,1);
        pl= whoswin(jhm,jhv,jpc,nums,vs,pl);
        
        
    else
        
        
        jhv = randi(2,1);
        
        if jhv == 1
            msgbox('Yo nones, tú pares');
            pause(2);
            
        else
            
            msgbox(' Yo pares, tú nones');
            pause(2);
            
        end
        
        
        
        jhm = captura_mano();
        
        jpc = randi(5,1);
        pl= whoswin(jhm,jhv,jpc,nums,vs,1);
        pause(3);
    end
    
    msgbox('Dí sí para acabar o no para seguir','Quieres acabar?');
    pause(2);
    close all;
    io = isover();
    if io == 1
        msgbox('Cerrando');
        io=0;
        pause(2);
        close all;
    else
        msgbox('Vale, Seguimos!');
        pause(2);
    end
    
    % y para acabar, cualquier cosa para seguir
end

close all;