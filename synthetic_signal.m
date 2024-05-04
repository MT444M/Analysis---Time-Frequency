%% Analyse avancée de signaux non-stationnaires
%Construction de signaux synthétiques puis analyse par méthode
%fréquentielle puis temps-fréquence

clc;
close all;
clear;

%% 1.                    signal synthétique

% Paramètres du signal 1
Te = 1;          % Période d'échantillonnage
fe = 1/Te;       % Fréquence d'échantillonnage
N1 = 512;         % Nombre d'échantillons
t1 = (0:N1-1)*Te;  % Vecteur temps

% Composantes du signal 1
sinusoid1 = sin(2*pi*0.2*(t1(N1/2:N1)));      % Sinusoïde à fréquence réduite \v 0.2
sinusoid1 =  [zeros(1,N1/2-1)  sinusoid1];
sinusoid2 = sin(2*pi*0.4*t1(1:N1));          % Sinusoïde à fréquence réduite \v 0.4
pulse = 10 * (t1 == N1/2);                     % Dirac à l'instant t1 = 256
signal_modul = fmlin(N1,0,0.5,N1/2);                   % Modulation linéaire de fréquence

%--------------------------- Signal synthétique 1
signal_synthetique_1 = sinusoid1 + sinusoid2 + pulse + signal_modul';

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% Paramètres du deuxième signal
N2 = 8192;                  % Nombre d'échantillons
t2 = (0:N2-1)*(1/1500);      % Vecteur temps (échantillonnage à 1500 Hz)

%--------------------------- Signal synthétique 2
signal_synthetique_2 = fmsin(N2, 0.1, 0.4, 1500);


% % Affichage du signal dans le domaine temporel
% figure;
% subplot(2,1,1)
% plot(t1, (signal_synthetique_1));
% title('Signal Synthétique 1 en Temps');
% xlabel('Temps (s)');
% ylabel('Amplitude');
% subplot(2,1,2)
% plot(t2, (signal_synthetique_2));
% title('Signal Synthétique 2 en Temps');
% xlabel('Temps (s)');
% ylabel('Amplitude');
% 
% 
% %Signal analytique associé
analytic_signal_1 = hilbert(signal_synthetique_1.');
analytic_signal_2 = hilbert(signal_synthetique_2);
% 
% % Affichage des signaux analytique en temps
% figure;
% subplot(2,1,1);
% plot(t1, real(analytic_signal_1));
% title('Signal Analytique 1 en Temps (Transformée de Hilbert)');
% xlabel('Temps (s)');
% ylabel('Amplitude');
% 
% subplot(2,1,2);
% plot(t2, real(analytic_signal_2));
% title('Signal Analytique 2 en Temps (Transformée de Hilbert)');
% xlabel('Temps (s)');
% ylabel('Amplitude');


%% 2.2
% ----------------- Calcul de la transformée de Fourier discrète (FFT) _1
fft_signal_1 = ((fft(signal_synthetique_1)));
fft_analytic_signal_1 = ((fft(analytic_signal_1)));
freq = linspace(0, fe, N1);
% % Affichage de la partie réelle et imaginaire
% figure;
% % Transformée de Fourier discrète du signal de départ
% subplot(2,2,1);
% plot(freq, real(abs(fft_signal_1)));
% title('FFT du Signal 1 (Partie Réelle)');
% xlabel('Fréquence (Hz)');
% ylabel('Amplitude');
% 
% subplot(2,2,2);
% plot(freq, imag(fft_signal_1));
% title('FFT du Signal 1 (Partie Imaginaire)');
% xlabel('Fréquence (Hz)');
% ylabel('Amplitude');
% 
% % Transformée de Fourier discrète du signal analytique associé
% subplot(2,2,3);
% plot(freq, real(abs(fft_analytic_signal_1)));
% title('FFT du Signal Analytique (Partie Réelle)');
% xlabel('Fréquence (Hz)');
% ylabel('Amplitude');
% 
% subplot(2,2,4);
% plot(freq, imag((fft_analytic_signal_1)));
% title('FFT du Signal Analytique (Partie Imaginaire)');
% xlabel('Fréquence (Hz)');
% ylabel('Amplitude');

% ----------------- Calcul de la transformée de Fourier discrète (FFT) _2
fft_signal_2 = ((fft(signal_synthetique_2)));
fft_analytic_signal_2 = ((fft(analytic_signal_2)));
freq = linspace(0, fe, N2);
% % Affichage de la partie réelle et imaginaire
% figure;
% % Transformée de Fourier discrète du signal de départ
% subplot(2,2,1);
% plot(freq, real(abs(fft_signal_2)));
% title('FFT du Signal 2 (Partie Réelle)');
% xlabel('Fréquence (Hz)');
% ylabel('Amplitude');
% 
% subplot(2,2,2);
% plot(freq, imag(fft_signal_2));
% title('FFT du Signal 2 (Partie Imaginaire)');
% xlabel('Fréquence (Hz)');
% ylabel('Amplitude');
% 
% % Transformée de Fourier discrète du signal analytique associé
% subplot(2,2,3);
% plot(freq, real(abs(fft_analytic_signal_2)));
% title('FFT du Signal Analytique (Partie Réelle)');
% xlabel('Fréquence (Hz)');
% ylabel('Amplitude');
% 
% subplot(2,2,4);
% plot(freq, imag((fft_analytic_signal_2)));
% title('FFT du Signal Analytique (Partie Imaginaire)');
% xlabel('Fréquence (Hz)');
% ylabel('Amplitude');

%% 2.3
% modification de l'axe des fréq
% Calcul de la transformée de Fourier discrète (FFT) _1
fft_signal_1 = (fftshift(fft(signal_synthetique_1)));
fft_analytic_signal_1 = (fftshift(fft(analytic_signal_1)));
freq_modif = linspace(-fe/2, fe/2, N1);
% % Affichage de la partie réelle et imaginaire
% figure;
% % Transformée de Fourier discrète du signal de départ
% subplot(2,2,1);
% plot(freq_modif, real(abs(fft_signal_1)));
% title('FFT du Signal 1 (Partie Réelle)');
% xlabel('Fréquence (Hz)');
% xticks(-0.5:0.1:0.5); %graduations
% ylabel('Amplitude');
% grid("on")
% 
% 
% subplot(2,2,2);
% plot(freq_modif, imag(fft_signal_1));
% title('FFT du Signal 1 (Partie Imaginaire)');
% xlabel('Fréquence (Hz)');
% xticks(-0.5:0.1:0.5); %graduations
% ylabel('Amplitude');
% grid("on")
% 
% 
% % Transformée de Fourier discrète du signal analytique associé
% subplot(2,2,3);
% plot(freq_modif, real(abs(fft_analytic_signal_1)));
% title('FFT du Signal Analytique (Partie Réelle)');
% xlabel('Fréquence (Hz)');
% xticks(-0.5:0.1:0.5); %graduations
% ylabel('Amplitude');
% grid("on")
% 
% subplot(2,2,4);
% plot(freq_modif, imag((fft_analytic_signal_1)));
% title('FFT du Signal Analytique (Partie Imaginaire)');
% xlabel('Fréquence (Hz)');
% xticks(-0.5:0.1:0.5); %graduations
% ylabel('Amplitude');
% grid("on")

% 
% 
% %% 2.4
% % théorique 
% 
% %% 2.5
%transformée de Fourier à Court-Terme (TFCT, tfrstft)

h1_KB = tftb_window(23,'Kaiser');
h2_KB = tftb_window(63,'Kaiser'); % La Fênetre la plus adaptée
h3_KB = tftb_window(103,'Kaiser');% elle aussi
h4_KB = tftb_window(193,'Kaiser');
h5_KB = tftb_window(253,'Kaiser');
% 
tfrsp(analytic_signal_2,1:N1,N1,h2_KB,1);
% 
% 
% %% 2.6 
% % TFCT, plusieurs types de fênêtres 

h_Kaiser = tftb_window(63,'Kaiser');
h_Haris = tftb_window(63,'Harris'); 
h_Hamming = tftb_window(63,'Hamming');
h_Rectangulaire = rectwin(63);%Moins adaptée
h_Gaussien = gausswin(63);%Plus adaptée
% 

%tfrsp(analytic_signal_1,1:N1,N1,h_Hamming,1);

%% 2.7
%RTF (quadratiques)
%tfrwv(analytic_signal_1);  %Distribution de Wigner-Ville
%tfrpwv(analytic_signal_1,1:N1,N1,tftb_window(63,'Kaiser'),1); %Distribution de pseudo Wigner-Ville
%tfrspwv(analytic_signal_1,1:N1,N1,tftb_window(63,'hamming'),1);%Distribution de pseudo Wigner-Ville lissée
%tfrcw(analytic_signal_1);  %Distribution de  Choi-Williams
% 
%tfrscalo(analytic_signal_1,1:N1,sqrt(N1),0.01,0.5,N1);  %Scalogramme
tfrsp(analytic_signal_1,1:N1,N1,h2_KB,1);   %Spectrogramme

