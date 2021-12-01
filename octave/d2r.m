%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author      : LPGG
% Date        : 01/12/2020
% Description : Converts decimal to race logic (events)
% Notes       :
%     - Inputs:
%          n: Number of bits
%          a: Decimal number to convert
%     - Outputs:
%          Y: Vector with the time of event occurrence
%     - Notice that this function returns the time of pulse occurrence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%- FIXME: This function is not necessary. We can do this more efficiently.
function Y=d2r(a,n)
  Y1=d2b(a,n);            %- Convert decimal to binary
  Y=bin2dec(int2str(Y1)); %- Then bin 2 decimal 
endfunction
