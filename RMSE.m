function[error] = RMSE(im1,im2)
e_mat = double(im1) - double(im2) ;
error = sqrt(sum(sum(e_mat.^ 2)) / prod(size(e_mat))) ;