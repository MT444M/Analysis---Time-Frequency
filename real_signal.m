%% Analyse de signaux réels (non stationnaires)
close all
clear
clc

%% 3.1 Lecture & Affichage : analyse temporelle
%Q3.1.1

% Charger les signaux réels
[robin_signal,robin_fe] = audioread('Robin.wav');
[whale_signal, whale_fe] = audioread('Whale3.wav');
fid = fopen('MareeBis', 'r');  
[maree_signal,count]=fread(fid,'double');
% Calcul de la fréquence d'échantillonnage en Hz du signal marée
Te_maree = 10 * 60;
maree_fe = 1 / Te_maree;

%Ecouter des signaux
%sound(robin_signal)
%sound(whale_signal)
%sound(maree_signal)

%Q3.1.2
%centrer et normaliser les 3 signaux
robin_signal_norm=(robin_signal-mean(robin_signal))/std(robin_signal);
whale_signal_norm=(whale_signal-mean(whale_signal))/std(whale_signal);
maree_signal_norm=(maree_signal-mean(maree_signal))/std(maree_signal);


% %verifier que le std des signals normalisés = 1
% std_robin_signal=std(robin_signal)
% std_whale_signal=std(whale_signal)
% std_maree_signal=std(maree_signal)
% % valider


% Affichage des signaux et des signaux normalisés
figure;

subplot(3,2,1);
plot(robin_signal);
title('Signal - Robin');
xlabel('Échantillons');
ylabel('Amplitude');

subplot(3,2,2);
plot((1:length(robin_signal))/robin_fe, robin_signal_norm);
title('Signal Normalisé - Robin');
xlabel('Temps (s)');
xticks(0:0.4:max((1:length(robin_signal))/robin_fe)); %graduations
ylabel('Amplitude');

subplot(3,2,3);
plot(whale_signal);
title('Signal - Whale3');
xlabel('Échantillons');
ylabel('Amplitude');

subplot(3,2,4);
plot((1:length(whale_signal))/whale_fe, whale_signal_norm);
title('Signal Normalisé - Whale3');
xlabel('Temps (s)');
xticks(0:0.2:max((1:length(whale_signal))/whale_fe));
ylabel('Amplitude');

subplot(3,2,5);
plot(maree_signal);
title('Signal - Marée');
xlabel('Échantillons');
ylabel('Amplitude');

subplot(3,2,6);
plot((1:length(maree_signal))/maree_fe, maree_signal_norm);
title('Signal Normalisé - Marée');
xlabel('Temps (s)');
ylabel('Amplitude');


%%Q3.1.3
% Extraire la portion du signal robin sur l'intervalle [2000-10191]
portion_robin_signal = robin_signal_norm(2000:10191);
%Nous avons tronqué les 2000 premiers points car c'est des valeurs nulles

% Extraire la portion du signal whale sur [13-16396] 
portion_whale_signal = whale_signal_norm(13:16396);
%Nous avons tronqué les 13 premières valeurs car l'enregistrement 
% ne s'est toujours pas stabilisé, les fluctuations de valeurs sont absurdes

% Affichage du signal de départ et de la portion du signal
figure;
subplot(2,2,1);
plot(robin_signal_norm);
hold("on")
plot(portion_robin_signal)
title('Signal de Départ et portion - Robin.wav');
xlabel('Échantillons');
ylabel('Amplitude');

subplot(2,2,2);
plot(portion_robin_signal);
title('Portion du Signal - Robin.wav');
xlabel('Échantillons');
ylabel('Amplitude');

subplot(2,2,3);
plot(whale_signal_norm);
hold("on")
plot(portion_whale_signal)
title('Signal de Départ et portion - Whale3.wav');
xlabel('Échantillons');
ylabel('Amplitude');

subplot(2,2,4);
plot(portion_whale_signal);
title('Portion du Signal - Whale3.wav');
xlabel('Échantillons');
ylabel('Amplitude');

%% 3.2 La TFD de signaux réels typiques : analyse fréquentielle

%Q.3.2.1
% Calcul de la transformée de Fourier discrète (FFT) des portions de signaux


% Calcul des fréquences associées à la FFT des portions de signaux
N_whale_portion = length(portion_whale_signal);
freq_whale_portion = linspace(-whale_fe/2,whale_fe/2, N_whale_portion);

% FFT de la portion du signal de Whale3.wav
fft_whale_portion_signal = fftshift(fft(portion_whale_signal));

% Affichage de la FFT de la portion du signal de Whale3.wav
figure;
subplot(2,1,1);
plot(freq_whale_portion, abs(fft_whale_portion_signal));
title('FFT - de Whale3.wav');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([-whale_fe/2, whale_fe/2]);

% Calcul des fréquences associées à la FFT de la portion du signal de Robin.wav
N_robin_portion = length(portion_robin_signal);
freq_robin_portion = linspace(-robin_fe/2, robin_fe/2, N_robin_portion);

% FFT de la portion du signal de Robin.wav
fft_robin_portion_signal = fftshift(fft(portion_robin_signal));

% Affichage de la FFT de la portion du signal de Robin.wav
subplot(2,1,2);
plot(freq_robin_portion, abs(fft_robin_portion_signal));
title('FFT - de Robin.wav');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([-robin_fe/2, robin_fe/2]);



%% Q.3.2.2
% FFT signal marée

% Calcul (FFT) du signal de marée
fft_maree_signal = fftshift(fft(maree_signal_norm));

% Calcul de l'axe des fréquences
N_maree = length(maree_signal);
freq_maree = linspace(-maree_fe/2, maree_fe/2, N_maree);

% Calcul du module et de la phase de la FFT du signal de marée
module_maree_signal = abs(fft_maree_signal);
phase_maree_signal = angle(fft_maree_signal);

% Affichage du module de la FFT du signal de marée
figure;
subplot(2,1,1);
plot(freq_maree, module_maree_signal);
title('Module de la FFT - Marée');
xlabel('Fréquence (Hz)');
ylabel('Module');
xlim([-maree_fe/2, maree_fe/2]);

% Affichage de la phase de la FFT du signal de marée
subplot(2,1,2);
plot(freq_maree, phase_maree_signal);
title('Phase de la FFT - Marée');
xlabel('Fréquence (Hz)');
ylabel('Phase (rad)');
xlim([-maree_fe/2, maree_fe/2]);




%% Ré-échantillonnage du signal de marée
%Q.3.2.3
% Facteur de ré-échantillonnage 
Q = 2; %Shannon
maree_signal_resampled = resample(maree_signal, 1, Q);
%sound(maree_signal_resampled)
maree_fe_resampled = maree_fe * Q;

% Calcul de la FFT du signal de marée ré-échantillonné
fft_maree_signal_resampled = fftshift(fft(maree_signal_resampled));
N_maree_resampled = length(maree_signal_resampled);
freq_maree_resampled = linspace(-maree_fe_resampled/2 ,maree_fe_resampled/2, N_maree_resampled);

% Affichage du module de la FFT des deux signaux
figure;
subplot(2,2,1);
plot(freq_maree, abs(fft_maree_signal));
title('Module FFT - Marée (Avant Ré-échant)');
xlabel('Fréquence (Hz)');
ylabel('Module');
xlim([-maree_fe/2, maree_fe/2]);

subplot(2,2,2);
plot(freq_maree_resampled, abs(fft_maree_signal_resampled));
title('Module FFT - Marée (Après Ré-échant)');
xlabel('Fréquence (Hz)');
ylabel('Module');
xlim([-maree_fe_resampled/2, maree_fe_resampled/2]);

% Affichage de la phase de la FFT des deux signaux
subplot(2,2,3);
plot(freq_maree, angle(fft_maree_signal));
title('Phase FFT - Marée (Avant Ré-échant)');
xlabel('Fréquence (Hz)');
ylabel('Phase (radians)');
xlim([-maree_fe/2, maree_fe/2]);

subplot(2,2,4);
plot(freq_maree_resampled, angle(fft_maree_signal_resampled));
title('Phase FFT - Marée (Après Ré-échant)');
xlabel('Fréquence (Hz)');
ylabel('Phase (radians)');
xlim([-maree_fe_resampled/2, maree_fe_resampled/2]);


% Trouver les indices des pics principaux dans la FFT
seuil = 50;
[~, pic_indices] = findpeaks(abs(fft_maree_signal_resampled), 'MinPeakHeight', seuil); 

% Convertir les indices en fréquences
freq_pics = freq_maree_resampled(pic_indices);

% periode d'échantillonnage
Te_resamples = 1 ./ freq_pics;


% Convertir les temps en heures, minutes et secondes
heures = floor(Te_resamples / 3600);
minutes = floor((Te_resamples - heures * 3600) / 60);
seconds = round(Te_resamples - heures * 3600 - minutes * 60);

% Afficher les temps correspondants
disp('Temps des pics principaux en fréquence :');
for i = 1:length(heures)
    fprintf('Pic %d : %02d:%02d:%02d\n', i, heures(i), minutes(i), seconds(i));
end


%% 3.3 Analyse temps-fréquence

%calcul des signaux analytiques des signaux réels
analytic_robin_signal=hilbert(portion_robin_signal);
analytic_whale_signal=hilbert(portion_whale_signal);
analytic_maree_signal=hilbert(maree_signal_norm);

N_analytic_robin = length(analytic_robin_signal);
N_analytic_whale= length(analytic_whale_signal);
N_analytic_maree = length(analytic_maree_signal);

%la TFCT avec fenetre de Kaiser
h1_KB = tftb_window(23,'Kaiser');
h2_KB = tftb_window(63,'Kaiser'); 
h3_KB = tftb_window(103,'Kaiser');
h4_KB = tftb_window(193,'Kaiser');
h5_KB = tftb_window(253,'Kaiser');

%tfrsp(analytic_robin_signal,1:N_analytic_robin,N_analytic_robin,h5_KB,1);
%tfrsp(analytic_whale_signal,1:N_analytic_whale,N_analytic_whale,h5_KB,1);
%tfrsp(analytic_maree_signal,1:N_analytic_maree,N_analytic_maree,h5_KB,1);


% TFCT, plusieurs types de fênêtres 
h_Kaiser = tftb_window(63,'Kaiser');
h_Haris = tftb_window(63,'Harris'); 
h_Hamming = tftb_window(63,'Hamming');
h_Rectangulaire = rectwin(253);
h_Gaussien = gausswin(63);

tfrsp(analytic_robin_signal,1:N_analytic_robin,N_analytic_robin,h_Haris,1);
% tfrsp(analytic_whale_signal,1:N_analytic_whale,N_analytic_whale,h1_KB,1);
% tfrsp(analytic_maree_signal,1:N_analytic_maree,N_analytic_maree,h1_KB,1);














