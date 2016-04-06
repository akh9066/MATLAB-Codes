function x = boundx(lower, upper, x)

[r, c] = size(x);

for i = 1:r
    for j = 1:c
        
        if x(i,j)>upper
            x(i,j) = upper;
        elseif x(i,j)<lower
            x(i,j) = lower;
        end
        
    end
end
