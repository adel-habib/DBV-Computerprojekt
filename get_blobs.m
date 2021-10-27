function [blobs] = get_blobs(binary_image,n)
%GET_BLOBS returns the the largest n blobs from a binary image 
%   Detailed explanation goes here

[labeled_img n_components] = bwlabel(binary_image);
cc_meas = regionprops(labeled_img, 'area');
allAreas = [cc_meas.Area];
[sortedAreas, sortIndexes] = sort(allAreas, 'descend');
biggestBlob = ismember(labeled_img, sortIndexes(1:n));
blobs = biggestBlob > 0;

end

