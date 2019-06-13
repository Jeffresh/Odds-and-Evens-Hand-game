function seg_palabra = inicio_fin(segmentos,ventana, num_segmentos_ruido)

mn = magnitud(segmentos,ventana);
zn = cruces_por_cero (segmentos,ventana) ;

ms = mn(1:10);
zs = zn(1:10);

mmr = mean(ms);
msr = std(ms);
zsmr = mean(zs);

zssr = std(zs);

UmbSupEnrg = 0.5 * max(mn);

UmbInfEnrg = mmr + 2 * msr;

UmbCruCero = zsmr + 2 * zssr;



for i=num_segmentos_ruido+1:length(mn)
    if mn(i) > UmbSupEnrg 
        ln = i;
       break

    end
end
le = ln;

for i= ln:-1:1
    if mn(i) < UmbInfEnrg
        le = i;
        break
    end
    
         
end



if (le -25) > 0
    fin = le - 25;
else
    fin = 11;
end


for i = le:-1:fin
    
    if zn(i) > UmbCruCero
        if (zn(i+1) > UmbCruCero) && (zn(i+2) > UmbCruCero)
            le = i;
                break

        end
       
    end
    
end


%fin palabra
lnf =le;

for i=length(mn)-num_segmentos_ruido-1:-1:le
    if mn(i) > UmbSupEnrg 
        lnf = i;
        break
    end
    
end

for i=lnf:length(mn)-num_segmentos_ruido+1
    if mn(i) < UmbInfEnrg
        lef = i;
        break
    end
         
end

if lef +25 < length(mn)-num_segmentos_ruido+1
    finf = lef + 25;
else
    finf = length(mn)-num_segmentos_ruido+1;
end


for i = lef:finf
    
    if zn(i) > UmbCruCero
        if (zn(i+1) && zn(i+2)) > UmbCruCero
            lef = i;
            break
        end
        
    end
    
    
end


seg_palabra = segmentos(:,le:lef);

end