function itr = recons_senal(palabra_envent, despl)

invsenal = palabra_envent(despl:end,:);
invsenal = invsenal';

itr = invsenal(1,:);
j = despl;

st= despl;

for i =2: size(invsenal,1)
    
    itr(j:st+j) = invsenal(i,:);
    
    j = j+st+1;
    
end



end