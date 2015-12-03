function [AlphaNew, diff, bestAlpha] = ESTIMATE_02_ALPHA_INT(Table, WHICH)
%UNTITLED vrátí horní a dolní odhad Alpha mezi nimiž leží kýžená hodnota
%p-value
%   WHICH - pro WHICH < 0 se vrátí odhady menšího Alpha
%         - pro WHICH > 0 se vrátí odhady vìtšího Alpha
%         - pro WHICH == 0 se vrátí odhady Alpha pro nejlepší Alpha
%   LOWER - spodní odhad Alpha
%   UPPER - horní odhad Alpha

    p_target = 1;
    p_target_int = 0.05;

    %seøadit Table podle Alpha
    [~, order] = sort(Table(:,1));
    Table = Table(order,:);
    %najít p-value nejblíže p_target
    [~, Alpha_bestIndex] = min(abs(Table(:,7)- p_target));
    bestAlpha = Table(Alpha_bestIndex,1);
    if(WHICH == 0)
        diff = Table(1:Alpha_bestIndex, 7) - p_target_int;
        [~, AlphaPIndex] = min(abs(diff));
        diff = diff(AlphaPIndex);
    else
        if(WHICH < 0)
            %vektor rozdílù p-values od p_target pro do dolní Alpha
            diff = Table(2:Alpha_bestIndex, 7) - p_target_int;            
            [~, AlphaPIndex] = min(abs(diff));            
            diff = diff(AlphaPIndex);
            AlphaPIndex = AlphaPIndex + 1;
        else
            %vektor rozdílù p-values od p_target pro do horní Alpha
            diff = Table(Alpha_bestIndex:end, 7) - p_target_int;         
            [~, AlphaPIndex] = min(abs(diff));
            diff = diff(AlphaPIndex);
            AlphaPIndex = Alpha_bestIndex - 1 + AlphaPIndex;
        end
    end

    if(WHICH < 0)
        if(diff < 0)            
                LOWER = Table(AlphaPIndex, 1);
                UPPER = Table(AlphaPIndex+1, 1);
        else
            if(AlphaPIndex == 2)
                LOWER = 0;
                UPPER = Table(2, 1);
            else
                LOWER = Table(AlphaPIndex-1, 1);
                UPPER = Table(AlphaPIndex, 1);
            end
        end
    else
        if(diff > 0)
            if(AlphaPIndex == size(Table, 1));
                LOWER = Table(AlphaPIndex, 1);
                UPPER = Table(AlphaPIndex, 1) + 10;
            else
                LOWER = Table(AlphaPIndex, 1);
                UPPER = Table(AlphaPIndex+1, 1);
            end
        else
                LOWER = Table(AlphaPIndex-1, 1);
                UPPER = Table(AlphaPIndex, 1);
        end
    end

    AlphaNew = (LOWER+UPPER)/2;
end

