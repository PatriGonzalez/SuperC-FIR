%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author      : LPGG
% Date        : 01/12/2020
% Description : Converts decimal to binary
% Notes       :
%     - Inputs:
%          n: Number of bits
%          a: Decimal number to convert
%     - Outputs:
%          Y: Vector in binary
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%- FIXME: This function is not necessary. We can do this more efficiently.

function Y=d2b(a,n)
  
  i=0;
  Y=[];
  
  while i<n
    b=a*2;
    if b>=1
      Y=[Y 1]; 
      a=b-1;
    else
      Y=[Y 0];
      a=b;
    endif
    i=i+1;  
  endwhile
  
  
endfunction
