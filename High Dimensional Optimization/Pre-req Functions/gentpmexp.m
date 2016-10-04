function [tpm] = gentpmexp(type, n, T, F)

m = sqrt(n);

tpm = gentpm(type, n);

for i = 1:n
    for j = 1:n
        if ((tpm(i,j)~=0) && (F(j)>F(i)))
            tpm(i,j) = tpm(i,j)*exp(-(F(j)-F(i))/T);           
        end
    end
    tpm(i,i) = 1 - sum(tpm(i,:));
end

            
