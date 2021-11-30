%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author      : LPGG
% Date        : 02/02/2021
% Description : Count pulses
% Notes       :
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pkg load signal

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%- Clean the workspace
close all;
clear all;
clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%- User Parameters
data = dlmread('file.txt',',', 2, 0);
%[r,c]=find(data);
%data1=data(r,:);

x=data(:,2)';
y=data(:,3)';
id=find(y>0);
y=y(id);
x=x(id);

id=find(x<17e-9);
y=y(id);
x=x(id);

thr=max(y);
if (thr>0.001)
  thr=0.001;
else
   thr=thr*0.88;
end

[pks, loc] = findpeaks (y);
id=find(pks>thr);
pks=pks(id);
loc=loc(id);

pks_sz=length(pks)


figure
plot(x/1e-9,y/1e-6)
hold on
plot(x(loc)/1e-9,pks/1e-6,'*')
xlabel('Time (ns)')
ylabel('Amplitude (uV)')

tapsN = 4;
bitsN = 7;
if (tapsN>4)
  mmax = (2^bitsN-1)*2;
else
  mmax = (2^bitsN-1);
end

result=pks_sz/mmax*2-1


A1=importdata('stimulus.txt');
[r,c]=size(A1);
exp_peaks=A1(r,(tapsN*2)+2+1)

err_peaks=abs(exp_peaks-pks_sz);

str_data = num2str([pks_sz result err_peaks])


fId = fopen('result.txt','a');
fputs (fId, str_data);
fputs (fId, "\n");
fclose(fId);


