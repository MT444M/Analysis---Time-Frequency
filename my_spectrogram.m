function out = my_spectrogram(x, T,noverlap, nfft)
%exemple de code de Matlab adapté
    x = x(:); %signal
    n = length(x);
    M = 2*T + 1; % Taille de la fenêtre de Hamming
    nUnique = ceil((1+nfft)/2); % Nombre de points uniques
    L = fix((n-noverlap)/(M-noverlap)); % Nombre de trames du signal
    out = zeros(L, nUnique);
    index = 1:M;
    for i = 0:L-1
        xw = hamming(M).*x(index);
        X = fft(xw, nfft);
        out(i+1, :) = abs(X(1:nUnique)).^2;
        index = index + (M - noverlap);
    end
end
 


