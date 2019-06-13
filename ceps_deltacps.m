function cdc = ceps_deltacps(nceps, p,palabra_enventanada)


% calc ceps
Fourier = fft(palabra_enventanada);
rcepstrum = real(ifft(log(abs(fft(palabra_enventanada)))));
ceps = rcepstrum(2:nceps+1,:);


% calc numer delta ceps

numb =numdceps(ceps,p);

% calc deno
deno = repmat(denodceps(ceps,p)',size(numb,1),1);

dc = numb./deno;

cdc = [ ceps; dc];


end
