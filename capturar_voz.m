function msg = capturar_voz(op)

switch op
    
    
    case 1
        
        % Lo suyo ser�a aqu� decir yo o t�
        % si detecta yo -> msg =1, t� -> msg =2.
        
        load('tuyo.mat');
        
        tst{1}= voz();
        
        for i = 1:size(pr,2)
            
            for j = 1:size(tst,2)
                
                rdtwsl(i,j) = dtwl(pr{i},tst{j});
            end
            
            
            
        end
        
        %msg= str2num(cell2mat(inputdlg({'Jugador 1: Humano | Jugador 2:PC'},"Qu�en empieza?",1)));
        
        msg= find(rdtwsl==min(rdtwsl));

        
        
       
        
    case 2
        
        %igual que antes, capturar si -> msg = 0 | msg -> io ~=0

        
       
        
         load('sino.mat');
        
        tst{1}= voz();
        
        for i = 1:size(pr,2)
            
            for j = 1:size(tst,2)
                
                rdtwsl(i,j) = dtwl(pr{i},tst{j});
            end
            
            
            
        end
        
        
        msg= find(rdtwsl==min(rdtwsl));
        
    case 3
        
        %
        
         load('parenone.mat');
        
        tst{1}= voz();
        
        for i = 1:size(pr,2)
            
            for j = 1:size(tst,2)
                
                rdtwsl(i,j) = dtwl(pr{i},tst{j});
            end
            
            
            
        end
        
        
        msg= find(rdtwsl==min(rdtwsl));
        
        
end


end