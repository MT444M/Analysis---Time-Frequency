
clc 
close all
clear

%% Programmation de méthodes temps-fréquence simples
% Paramètres

% Paramètres du signal 
fs = 1000; % Fréquence d'échantillonnage
t = 0:1/fs:0.5; % Vecteur de temps


% Signal chirp (changement de fréquence dans le temps)
f0 = 1; % Fréquence de départ
f1 = 300; % Fréquence de fin
signal_chirp = chirp(t, f0, 2, f1);

% Signal sinusoïdal
f_sin = 300; % Fréquence du sinusoïde
signal_sin = sin(2*pi*f_sin*t);

% Création de la figure
figure;

% Affichage du signal chirp
subplot(2,1,1);
plot(t, signal_chirp);
title('Signal Chirp: f_{début}=1 f_{fin}=300Hz');
xlabel('Temps (s)');
ylabel('Amplitude');

% Affichage du signal sinusoïdal
subplot(2,1,2);
plot(t, signal_sin);
title('Signal Sinusoïdal f=300Hz');
xlabel('Temps (s)');
ylabel('Amplitude');

%%

% Paramètres pour le spectrogramme
window = 63; % Taille de la fenêtre de Hamming
overlap = 120; % Recouvrement
nfft = fs; % Longueur de la FFT

% Calcul du spectrogramme pour le signal chirp
spectrogram_chirp = my_spectrogram(signal_chirp, window,overlap, nfft);

% Calcul du spectrogramme pour le signal sin
spectrogram_sin = my_spectrogram(signal_sin, window,overlap, nfft);

% Définir les échelles de temps et de fréquence
tp = linspace(0, max(t)-window/fs, size(spectrogram_chirp, 1)); % Échelle de temps
fp = linspace(0, fs/2, size(spectrogram_chirp, 2)); % Échelle de fréquence

% Tracer spectrogramme chirp
figure;
mesh(tp, fp, spectrogram_chirp');
title('My Spectrogramme - Signal chirp');
xlabel('Temps (s)');
ylabel('Fréquence (Hz)');
view(2);

% Tracer spectrogramme sin
figure;
mesh(tp, fp, spectrogram_sin');
title('My Spectrogramme - Signal Sinusoïdal');
xlabel('Temps (s)');
ylabel('Fréquence (Hz)');
view(2);
%%
% Paramètres pour le spectrogramme de MATLAB
window_length = 128; % Taille de la fenêtre de Hamming
overlap = 120; % Recouvrement (pour gérer les effects de bord)
nfft = fs; % Longueur de la FFT

% spectrogram Chirp de MATLAB
[s_chirp, ~, ~] = spectrogram(signal_chirp, hamming(window_length), overlap, nfft, fs);

% spectrogram Chirp de MATLAB
[s_sin, f, t] = spectrogram(signal_sin, hamming(window_length), overlap, nfft, fs);

% Affichage du spectrogramme de MATLAB
figure;
mesh(t, f, abs(s_chirp).^2);
title('spectrogram de MATLAB - Signal chirp');
xlabel('Temps (s)');
ylabel('Fréquence (Hz)');
view(2);

figure;
mesh(t, f, abs(s_sin).^2);
title('spectrogram de MATLAB - Signal Sinusoïdal');
xlabel('Temps (s)');
ylabel('Fréquence (Hz)');
view(2);
%%

% Génération du signal analytique
analytic_signal_chirp = hilbert(signal_chirp.');
analytic_signal_sin = hilbert(signal_sin.');

% Paramètres pour tfrsp
N1 = length(analytic_signal_chirp); % Longueur du signal
h_Hamming = tftb_window(163,'Hamming');% Fenêtre de Hamming

% Appel de tfrsp
tfrsp(analytic_signal_chirp, 1:N1, N1, h_Hamming, fs);
%tfrsp(analytic_signal_sin, 1:N1, N1, h_Hamming, 1);


%% la Transformée de Wigner-Ville

% Génération du signal analytique
analytic_signal_chirp = hilbert(signal_chirp.');
TW_chirp = TWV(analytic_signal_chirp);
N = length(signal_chirp);
t = linspace(0, N/2-1, N) / fs;
f = linspace(0, fs/2-1, N);

% Visualisation de la TWV
figure;
imagesc(t,f,abs(TW_chirp));
axis xy;
title('Transformée de Wigner-Ville');
xlabel('Temps (s)');
ylabel('Fréquence (Hz)');

%MAtlab TW
figure;
wvd(analytic_signal_chirp);


%tfrwv(analytic_signal_chirp',1:N,N,fs);  %Distribution de Wigner-Ville

