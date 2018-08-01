%    Matrix Multiplication 
%    
%    C = mmxtimes(A, B, mod) 
%    where mod is a modifier string, will
%    transpose one or both of A and B. Possible values for mod are
%    'tn', 'nt' and  'tt' where 't' stands for 'transposed' and 'n' for
%    'not-transposed'. 
%   
%    For example 
%           >> size(mmx('mult',randn(4,2),randn(4,2),'tn'))
            %    ans =   2     2
function result = mmxtimes(A, B)
    
    if isreal(A) && isreal(B)
        result = mmx('mult', A, B);
    else
        Ar = real(A);   Ai = imag(A);
        Br = real(B);   Bi = imag(B);

        Cr = mmx('mult', Ar, Br) - mmx('mult', Ai, Bi);
        Ci = mmx('mult', Ar, Bi) + mmx('mult', Ai, Br);

        C = complex(Cr, Ci);

        result = C;
    end
end

