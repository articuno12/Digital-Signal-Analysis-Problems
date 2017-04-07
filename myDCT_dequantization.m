function[quan] = myDCT_dequantization(imqDCT,qm,c)
d = qm * c;
quan = imqDCT.* d;