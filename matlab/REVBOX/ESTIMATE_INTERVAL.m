%ESTIMATE_INTERVAL

clear all

load Init 
load Init2
p_precision = 0.001;
Size = Base.^Depth;
TableAgreg = [];

for k=2:3
    Table = [];
    sA = A >= Dist(k)*Size(k)^(1/3) & A <= Dist(k)*Size(k)^(2/3); 
    %udelat tabulku, seøadit podle alpha
    H = load(['H' num2str(k) '.mat']); 
    H = H.H;
    HMean = mean(H,3);
    Alpha = load(['Alpha' num2str(k) '.mat']);
    Alpha = Alpha.Alpha(1:nAlpha)';
    for a=1:nAlpha
        nextAlpha = Alpha(a);
        if(a>1 && nextAlpha == 0)
            continue
        end
        TableRow = ESTIMATE_01_TABLEROW(nextAlpha, A(sA), HMean(a,sA), Dim(k));
        Table = [Table; TableRow];
    end

    cellNvec = load(['cellNvec' num2str(k) '.mat']);
    cellNvec = cellNvec.cellNvec;
    
    %najít spodní Alpha
    [AlphaNew, diff, bestAlpha] = ESTIMATE_02_ALPHA_INT(Table, -1);
    it = 0;
    while(abs(diff) > p_precision && 10 >= it)        
        [HMeanRow, Hnew] = ESTIMATE_03_H(cellNvec, nA, A, nR, AlphaNew);
        H = cat(1, H, reshape(Hnew, [1 size(Hnew)]));
        Alpha = [Alpha; AlphaNew];
        TableRow = ESTIMATE_01_TABLEROW(AlphaNew, A(sA), HMeanRow(sA), Dim(k));
        Table = [Table; TableRow];        
        [AlphaNew, diff, bestAlpha] = ESTIMATE_02_ALPHA_INT(Table, -1);        
        it = it+1;
    end
    
    TableAgregRow = zeros(1,5);
    TableAgregRow(1) = Dim(k);
    TableAgregRow(2) = Table(1,4);
    TableAgregRow(3) = bestAlpha;
    if(it==11)
        TableAgregRow(4) = NaN;
    else
        TableAgregRow(4) = TableRow(end,1);
    end
    
    %najít horní Alpha
    [AlphaNew, diff, bestAlpha] = ESTIMATE_02_ALPHA_INT(Table, 1);
    it = 0;
    while(abs(diff) > p_precision && 10 >= it)        
        [HMeanRow, Hnew] = ESTIMATE_03_H(cellNvec, nA, A, nR, AlphaNew);
        H = cat(1, H, reshape(Hnew, [1 size(Hnew)]));
        Alpha = [Alpha; AlphaNew];
        TableRow = ESTIMATE_01_TABLEROW(AlphaNew, A(sA), HMeanRow(sA), Dim(k));
        Table = [Table; TableRow];        
        [AlphaNew, diff, bestAlpha] = ESTIMATE_02_ALPHA_INT(Table, 1);        
        it = it+1;
    end
   
    if(it==11)
        TableAgregRow(5) = NaN;
    else
        TableAgregRow(5) = TableRow(end,1);
    end
    
    TableAgreg = [TableAgreg; TableAgregRow];            
    
    save(['Table' num2str(k) '.mat'], 'Table');
    save(['TableAgreg' num2str(k) '.mat'], 'TableAgreg');
    save(['HH' num2str(k) '.mat'], 'H');
    save(['AlphaH' num2str(k) '.mat'], 'Alpha');
end

%save Init2 nAlpha