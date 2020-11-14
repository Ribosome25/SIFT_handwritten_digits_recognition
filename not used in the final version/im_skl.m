% skeleton
function img3 = im_skl(img)
%im1 = imread('numbers.jpg');
%input is a BW img with balck bg

%extract skeleton, Gaussian blur
BW2 = bwmorph(img,'skel',Inf);
skel= BW2;%bwmorph(BW2,'skel',Inf);
B = bwmorph(skel, 'branchpoints');
E = bwmorph(skel, 'endpoints');
[y,x] = find(E);
B_loc = find(B);


Dmask = false(size(skel));
    for k = 1:numel(x)
        D = bwdistgeodesic(skel,x(k),y(k));%????k???????????????mapping
        distanceToBranchPt = min(D(B_loc));%?????branch????
        Dmask(D < distanceToBranchPt) =true;%update mask
    end

skelD = skel - Dmask;
skelD = imdilate(skelD,ones(3));
img3 = skelD;%single(imgaussfilt((skelD.*255),2));

end