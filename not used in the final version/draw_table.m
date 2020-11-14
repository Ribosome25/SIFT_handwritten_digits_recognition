%Generate tables for drawing
cell_sz = [400 300];
spl_amount = 15;
canvas_sz = [cell_sz(1)*10+11+19, spl_amount*cell_sz(2)+spl_amount+1+20];
canvas = ones(canvas_sz);
for i = 0:spl_amount
    canvas(:,i*(cell_sz(2)+1)+2)=0;
end

for i = 0:10
    canvas(i*(cell_sz(1)+1)+2,:)=0;
end

imwrite(canvas,'canvas.bmp');