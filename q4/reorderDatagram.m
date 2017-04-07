function[result] = reorderDatagram(a,b,c,d,e)

fnames = [a; b; c; d; e];

l = 5;

for s=1:5
     t=int2str(s);
     ans=strcat(t,'.wav');
[x, fs]= audioread(ans);

len=length(x);

% Apply simple averaging which help to reduce the intensity of the high frequency
% noise if contains

for i=1:2
for j=2:len-1
x(j,i) = (x(j-1,i) + x(j,i) + x(j+1,i))/3 ;
end
end

% Creating Gaussian window of size 20

g = gausswin(20);

% Apply convolution using Gaussian filter

g = g/sum(g);

y= conv(x(:,1), g, 'same');

% Apply signal smoothing using Savitzky-Golay smoothing filter.
ans=strcat('result',t);
ans=strcat(ans,'.wav');
result=sgolayfilt(y,1,17);
duration(s)= length(result)/fs;
% resultant signal can be write to the new file

audiowrite(ans,result,fs);
 end




check = zeros(1,5);
count = 1;
start = 3;
order = zeros(1,5);
order(1) = 3 ;

while(count < 5)
    count = count+1;
    check(start) = 1;
    t=int2str(start);
    ans=strcat('result',t);
ans=strcat(ans,'.wav');
    [y,Fs] = audioread(ans);
    y = y(:,1:1);
    z = size(y);
    y = y(z-Fs*5:z,:);
    tmp = fft(y);
    tmp = tmp(1:size(tmp)/2);
    tmp = abs(tmp);
    %check ;
    max = 0;
    for i = 1:5
        if(check(i)~=1)
            t=int2str(i);
    ans=strcat('result',t);
ans=strcat(ans,'.wav');
            [y2,Fs] = audioread(ans);
            y2 = y2(:,1:1);
            y2 = y2(1:Fs*5,:);
            tmp2 = fft(y2);
            tmp2 = tmp2(1:size(tmp2)/2);
            tmp2 = abs(tmp2);
            val = corr2(tmp,tmp2);
            if(val > max )
                max = val;
                next = i;
            end
        end
    end
    start = next;
    order(count) = start ;
end

order

final = zeros(0,2);
for i = 1:4
    [a, Fs] = audioread(fnames(order(i), :));
    final = [final; a(1:end-Fs*l,:)];
end

[a, Fs] = audioread(fnames(order(5), :));
final = [final; a];

%f1 = final(:,1);
%f2 = final(:,2);

%denoise = conv(f1, g, 'same');
x=final;

len=length(x);

% Apply simple averaging which help to reduce the intensity of the high frequency
% noise if contains

for i=1:2
for j=2:len-1
x(j,i) = (x(j-1,i) + x(j,i) + x(j+1,i))/3 ;
end
end

% Creating Gaussian window of size 20

g = gausswin(20);

% Apply convolution using Gaussian filter

g = g/sum(g);

y= conv(x(:,1), g, 'same');

result=sgolayfilt(y,1,17);

sound(result,Fs)
