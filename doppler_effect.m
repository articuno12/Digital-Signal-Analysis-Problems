distance = 100 ;
time = 6 ;
speed = distance / time ;
samples = 8000 ;

t = [1/samples : 1/samples : time] ;

d = -50 + speed * t ;
for i = 1:samples * time 
    d(1,i) = 1 / d(1,i) ;
end

w = ones(1,samples * time) ;
fsource = 400 ;
c = 340 ;
f1 = fsource * (1 / (1 - (speed/c))) ;
f2 = fsource * (1 / (1 + (speed/c))) ;
w(1,1:(samples * time)/2) = 2 * pi * f1 ;
w(1,(samples * time)/2 + 1 : samples * time ) = 2 * pi * f2 ;

y = cos(w .* t) ;
y = d .* y ;
audiowrite('sol2.wav',y,samples) ;