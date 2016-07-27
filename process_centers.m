function centers = process_centers(image, upper_thresh, lower_thresh, bw_cutoff)
new_im = im2bw(image, bw_cutoff); %this is for roll 4 
imshow(new_im)
hold on
[B,L] = bwboundaries(~new_im);
props = regionprops(L, 'Area','Centroid');
centers=cat(1, props.Centroid);
sel_idx = find([props.Area] < upper_thresh & [props.Area] > lower_thresh);
%imshow(new_im)
for n = 1:length(sel_idx)
    plot(B{sel_idx(n)}(:,2), B{sel_idx(n)}(:,1), 'r')
    plot(centers(sel_idx(n), 1),centers(sel_idx(n), 2), 'b+')
    new_cen(n,1) = centers(sel_idx(n), 1); %this holds the x
    new_cen(n,2) = centers(sel_idx(n), 2); %this holds the y
end
h=helpdlg('Push OK to continue');
uiwait(h);
close all
centers = new_cen;

