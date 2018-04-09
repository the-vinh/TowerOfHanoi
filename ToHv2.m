    n = 7;
    L = [strings(n,1); "L"];
    for i = 1:n
        for j = 1:i
            L(i) = strcat(L(i), "_");
        end
    end
    M = [strings(n,1); "M"];
    R = [strings(n,1); "R"];
    show(L, M, R);
    [L, M, R] = ToH(n, L, M, R);
    
    
    function [p1, p2, p3] = ToH(n, p1, p2, p3)
        if n == 1
            [p1, p2] = mvdsk(p1, p2);
            show(p1, p2, p3);
        else
            [p1, p3, p2] = ToH(n-1, p1, p3, p2);
            [p1, p2, p3] = ToH(1, p1, p2, p3);
            [p3, p2, p1] = ToH(n-1, p3, p2, p1);
        end
    end
    
    function [Ld, La] = mvdsk(Ld, La)
        i = 1;
        while Ld(i) == ""
            i = i + 1;
        end
        dsk = Ld(i);
        Ld(i) = "";
        i = 1;
        while i <= length(La)
            if La(i) ~= ""
                break;
            else
                i = i + 1;
            end
        end
        La(i-1) = dsk;  
    end
    
    function [] = show(i, j, k)
        n = length(i);
        switch i(n)
            case "L"
                if j(n)=="M"
                    disp([i j k]);
                else
                    disp([i k j]);
                end
            case "M"
                if j(n)=="R"
                    disp([k i j]);
                else
                    disp([j i k]);
                end
            case "R"
                if j(n)=="L"
                    disp([j k i]);
                else
                    disp([k j i]);
                end
        end
    end