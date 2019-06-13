function pl = whoswin(jhm,jhv,jpc,nums,vs,pl)

subplot(1,3,1);
imshow(nums{jhm});

if jhv ==1
title("jugador humano - Pares")
else
title("jugador humano - Nones")
end
subplot(1,3,2);
imshow(vs);
subplot(1,3,3);
imshow(nums{jpc});

if jhv ==1
title("jugador Computador - Nones")
else
title("jugador Computador - Pares")

end


if (jhv==1 && mod(jhm+jpc,2)==0)|| jhv==2 && mod(jhm+jpc,2)~=0
    suptitle("Ganador jugador humano!");
    pl = 2;
else
    suptitle("Ganador jugador computador!");
    
    pl =1;
end
    
end