function[inverse_dct] = myIDCT(im,F)
inverse_dct = F' * double(im) * F;