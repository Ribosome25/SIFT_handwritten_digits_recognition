function [train_imgs] = generate_tr_set()
%generate a cell containing digits
%rows indicates the digit numbers 1-10
%cols indicates the sample #

%output: black ground, binary, 349*249 images in a cell, diag 429 pxl
%input: white bg, with table boundaries of 1 px width

train_imgs = {};
img0 = imread('Ref-2.jpg');
img = not(im2bw(img0,graythresh(img0)));
irow = 0;
icol = 0;
row_sepa = find(sum(img,2)==max(sum(img,2)));
col_sepa = find(sum(img)==max(sum(img)))';
for irow = 1:10
    img_row = img0(row_sepa(irow)+1:row_sepa(irow+1)-1,:);
    for icol = 1:15
        img_single = img_row(:,col_sepa(icol)+1:col_sepa(icol+1)-1);
        %img_single = imresize(img_single,2);
        img_single = not(im2bw(img_single,graythresh(img_single)));
        train_imgs{irow,icol} = img_single;
        end
    end
end