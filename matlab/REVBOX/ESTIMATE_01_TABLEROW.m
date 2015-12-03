function [ TableRow ] = ESTIMATE_01_TABLEROW(alpha, A, HMean, Dim)

    TableRow = zeros(1, 7);
    TableRow(1) = alpha;
    [ b, se, s2 ] = MNCLIN( A, HMean );
    TableRow(2) = se;
    TableRow(3) = s2;
    TableRow(4) = b(2);
    TableRow(5) = abs(b(2)-Dim);
    TableRow(6) = TableRow(5)/TableRow(3);
    TableRow(7) = 2 - 2*tcdf(TableRow(6), sum(A)-2);

end