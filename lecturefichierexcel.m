clear all
[NUMERIC,TXT,RAW]=xlsread('Maregraphe_TOULON_VR_20090601_20090831.xls');
tab=RAW(12:end);
[taille]=length(tab);
for i=1:taille
   matches = strfind(tab{i}, ';');
   newtab(i,1)=str2num(tab{i}(matches(1)+1:matches(2)-1));
end
figure(1)
plot(newtab)
% %sound(newtab)
% y=abs(fftshift(fft((newtab-mean(newtab))/std(newtab))));
% figure(2)
% plot(y)