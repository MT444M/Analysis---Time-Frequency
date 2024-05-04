close all
clear 
clc

 %% 4.1 Calcul numérique de la fréquence instantanée
 
% Paramètres
fs = 1000; % Fréquence d'échantillonnage
t = 0:1/fs:1; % Vecteur de temps
f1 = 1; % Fréquence de la première sinusoïde
f2 = 100; % Fréquence de la deuxième sinusoïde
N = length(t); % Nombre d'échantillons
v1 = 100; % Fréquence de la première cisoïde
v2 = 10; % Fréquence de la deuxième cisoïde


% Signaux synthétiques
x1 = sin(2*pi*f2*t); % Sinusoïde
x2 = fmlin(N, f1/fs, (f2-f1)/fs); % Variation linéaire de fréquence
x3 = sin(2*pi*f1*t) + sin(2*pi*f2*t); % Somme de 2 cosinus
x4 = exp(2*pi*1i*v1*t) + exp(2*pi*1i*v2*t); % somme de 2 cisoïdes 

% Calcul de la fréquence instantanée pour chaque signal
[inst_freq_x1,inst_freq_unwrap_x1] = calc_inst_freq(x1);
[inst_freq_x2,inst_freq_unwrap_x2] = calc_inst_freq(x2);
[inst_freq_x3,inst_freq_unwrap_x3] = calc_inst_freq(x3);
[inst_freq_x4,inst_freq_unwrap_x4] = calc_inst_freq(x4);
% Affichage des résultats
figure;

subplot(3,1,1);
plot(t, x3);
title('Signal Somme de 2 sunisoïdes');
xlabel('Temps (s)');
ylabel('Amplitude');

subplot(3,1,2);
plot(t, x2);
title('Signal avec Variation Linéaire de Fréquence');
xlabel('Temps (s)');
ylabel('Amplitude');

subplot(3,1,3);
plot(t, x4);
title('Signal Somme de 2 Cisoïdes');
xlabel('Temps (s)');
ylabel('Amplitude');

% Affichage des fréquences instantanées avec et sans unwrap, et avec instfreq MATLAB
figure;

subplot(4,3,1);
plot(t(2:end), inst_freq_x1);
title('Fréquence Instantanée - sin (sans unwrap)');
xlabel('Temps (s)');
ylabel('Fréquence (Hz)');

subplot(4,3,2);
plot(t(2:end), inst_freq_unwrap_x1);
title('Fréquence Instantanée - sin (avec unwrap)');
xlabel('Temps (s)');
ylabel('Fréquence (Hz)');

subplot(4,3,3);
plot(instfreq(hilbert(x1')));
title('Fréquence Instantanée - sin (instfreq MATLAB)');
xlabel('Temps (s)');
ylabel('Fréquence (Hz)');

subplot(4,3,4);
plot(t(2:end), inst_freq_x2);
title('Fréquence Instantanée - fmlin (sans unwrap)');
xlabel('Temps (s)');
ylabel('Fréquence (Hz)');

subplot(4,3,5);
plot(t(2:end), inst_freq_unwrap_x2);
title('Fréquence Instantanée - fmlin (avec unwrap)');
xlabel('Temps (s)');
ylabel('Fréquence (Hz)');

subplot(4,3,6);
plot(instfreq(hilbert(x2)));
title('Fréquence Instantanée - fmlin (instfreq MATLAB)');
xlabel('Temps (s)');
ylabel('Fréquence (Hz)');

subplot(4,3,7);
plot(t(2:end), inst_freq_x3);
title('Fréquence Instantanée - 2 cosinus (sans unwrap)');
xlabel('Temps (s)');
ylabel('Fréquence (Hz)');

subplot(4,3,8);
plot(t(2:end),inst_freq_unwrap_x3);
title('Fréquence Instantanée - 2 cosinus (avec unwrap)');
xlabel('Temps (s)');
ylabel('Fréquence (Hz)');

subplot(4,3,9);
plot(instfreq(hilbert(x3')));
title('Fréquence Instantanée - 2 cosinus (instfreq MATLAB)');
xlabel('Temps (s)');
ylabel('Fréquence (Hz)');

subplot(4,3,10);
plot(t(2:end), inst_freq_x4);
title('Fréquence Instantanée - 2 cisoides (sans unwrap)');
xlabel('Temps (s)');
ylabel('Fréquence (Hz)');

subplot(4,3,11);
plot(t(2:end), inst_freq_unwrap_x4);
title('Fréquence Instantanée - 2 cisoides (avec unwrap)');
xlabel('Temps (s)');
ylabel('Fréquence (Hz)');

subplot(4,3,12);
plot(instfreq(hilbert(x4')));
title('Fréquence Instantanée - 2 cisoides (instfreq MATLAB)');
xlabel('Temps (s)');
ylabel('Fréquence (Hz)');


% Fonction pour calculer la fréquence instantanée
function [inst_freq, inst_freq_unwrap] = calc_inst_freq(x)
    analytic_signal = hilbert(x); % Calcul du signal analytique
    arg_signal =(atan2(imag(analytic_signal), real(analytic_signal))); % Argument
    arg_signal_unwrap = unwrap(atan2(imag(analytic_signal), real(analytic_signal))); % Argument 
    
    darg_dt = diff(arg_signal); % Dérivée de l'argument par rapport au temps
    inst_freq_unwrap = diff(arg_signal_unwrap)/(2*pi); % Fréquence instantanée avec unwrap
    inst_freq = darg_dt/(2*pi); % Fréquence instantanée
end




