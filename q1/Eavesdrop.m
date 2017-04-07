function[number] = Eavesdrop(audiofilename)
[a,fs]=audioread(audiofilename);
s1=audioread('1.ogg');

t=length(a)/length(s1);
a_chunks=reshape(a,length(s1),t);
ans=-1000;
for i=1:t
    for j=0:9
        s=strcat(int2str(j) ,'.ogg') ;
        temp=corr(audioread(s),a_chunks(:,i));
        if( temp > ans)
            result(i)= j;
            ans=temp;
        end
    end
    ans=-1000;
end
number='';
for i=1:t
    number= strcat(number , int2str(result(i))) ;
end
    
