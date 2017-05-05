function[s] =specgram(x,window,step)
x = double(x);
n = min(length(x),256);
w = hann(window)
if (length(w) > n)
    n = length(w)
end
r = uint8((n+1)/2);
offset = [ 1 :step :length(x)-length(w)]
S = zeros(n,length(offset));
for i=1:length(offset)
    S(1: length(w), i) = x(offset(i):offset(i) + length(w)-1,1) .* w;
end
S=fft(S);

S = S(1:r, :);

surf(20*log10(abs(S)),'EdgeColor','none');
colormap('default'); view(0,90);
colorbar