%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author      : LPGG
% Date        : 02/02/2021
% Description : Generate stimulus 4 Spice simulations
% Notes       :
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%- Clean the workspace
close all;
clear all;
clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%- User Parameters

bitsN = 7;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%- Start the magic

fId = fopen('stimulus.pl','w');

%- Load the filter parameters
b=[rand, rand, rand, rand]*2-1;

%- Convert to unipolar
bu = (b+1)/2;

[sz_r, sz_c] = size(bu); 

fprintf(fId, "my @coeffArray=(");
for i=1:sz_c
  bi = bu(i); 
  Y=d2b(bi,bitsN);
  fprintf(fId, "\'");
  for j=1:bitsN
    fprintf(fId, "%s",num2str(Y(j)));
    if j==bitsN 
      fprintf(fId, "\'");
      if i!=sz_c
        fprintf(fId, ", ");
      end
    end
  end
end
fprintf(fId, ");\n");

%- Load the data

s=[rand, rand, rand, rand]*2-1;

%- Convert each input to race logic
su=(s+1)/2;
fprintf(fId, "my @xArray=(");
for i=1:sz_c
  Y = d2r(su(i),bitsN);
  fprintf(fId, "($clk_per*%d)-$init_del-$clk_per/2",Y);
  if i!=sz_c
    fprintf(fId, ", ");
  end
end

fprintf(fId, ");\n");

fclose(fId);

result=sum(b.*s)

str_data = num2str([b,s,result result/4 round((result/4+1)*2^(bitsN-1))]);

fId = fopen('stimulus.txt','a');
fputs (fId, str_data);
fputs (fId, "\n");
fclose(fId);





