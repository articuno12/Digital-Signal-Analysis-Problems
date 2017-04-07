function[my_entropy] = My_entropy(im)
h = imhist(im);
n = sum(h) ;
h = double(h);
n = double(n);
Prob = h / n;
l = size(find(Prob)) ;
ln = l(1);
f = find(Prob) ;
Valid_prob = zeros(1,ln) ;
for i=1:ln
    Valid_prob(i) = Prob(f(i)) ; 
end
my_entropy = sum(Valid_prob .* log2(Valid_prob)) ;
my_entropy = -my_entropy ;