function[F] = create_mat_dct()
N = 8 ;
r1 = sqrt(1/N) ;
r2 = sqrt(2/N) ;
for i = 1:N
    for j=1:N
        if(i-1==0)
            F(i,j)=r1 * cos((pi * (2*(j-1)+1) * (i-1))/(2*N));
        else
            F(i,j)=r2 * cos((pi * (2*(j-1)+1) * (i-1))/(2*N));
        end
    end
end

            
