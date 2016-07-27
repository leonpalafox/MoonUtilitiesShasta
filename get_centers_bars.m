function [new_cen, bar_cen] = get_centers_bars(new_im)
%v.02: Here the function is fed not a black and white image, but a full
%image that is segmented
div_im = 0.77;
[rows, columns] = size(new_im);
dot_im_cols = floor(columns*div_im);
dot_im = new_im(:,1:dot_im_cols);
bar_im = new_im(:,dot_im_cols:end);
thresh = 400;
min_thresh = 50;
min_bar_thresh = 600;
bar_thresh = 5000;
new_cen = process_centers(dot_im, thresh, min_thresh, 0.55);
bar_cen = process_centers(bar_im, bar_thresh, min_bar_thresh, 0.46);