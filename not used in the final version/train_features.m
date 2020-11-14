function [frames,descrs] = train_features(train_imgs)
sz = size(train_imgs);
frames = cell(sz);
descrs = cell(sz);
for idig = 1:10
    for ispl = 1:sz(2)
        pic = single(255.*(train_imgs{idig,ispl}));
        imshow(pic)
        [frames{idig,ispl},descrs{idig,ispl}] = ...
            vl_sift(pic,'PeakThresh',0,'edgethresh',10);
        h1 = vl_plotframe(frames{idig,ispl});
    end
end
