function[dct_im] = myDCT(im,F)
dct_im=F * double(im) * F';
