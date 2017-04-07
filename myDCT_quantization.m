function[quan] = myDCT_quantization(imDCT,qm,c)
d = qm * c;
quan = round(imDCT ./ d) ;