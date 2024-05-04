fid = fopen('MareeBis', 'r');
[Tab,count]=fread(fid,'double');
fclose(fid);
figure(1)
plot(Tab)
y=abs(fftshift(fft(Tab-mean(Tab))));
figure(2)
plot(y)