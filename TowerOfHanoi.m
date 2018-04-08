function [] = TowerOfHanoi()
%ask user for number of disks
prompt = 'How manu disks do you want to play?';
n = input(prompt);
%define legs (towers) as vertical vectors
%the bigger the number, the bigger the disk
%where there is no disk there is 0
global L M R;
L = 1:n;
L = L(:);
M = zeros(n, 1);
R = zeros(n, 1);   
%solve the puzzle with n disks in leg 1 and move all to leg 2
ToH_12(n);
%function defined recursively and mutually
%ToH_mn is to move all disks from leg m to leg n
function [] = ToH_12(n)
    if n > 1
        ToH_13(n-1);
        ToH_12(1);
        ToH_32(n-1);
    else
        [L, M] = mvdsk(L, M);
        %display the status of the disks
        disp([L M R]);
    end
end
function [] = ToH_13(n)
    if n > 1
        ToH_12(n-1);
        ToH_13(1);
        ToH_23(n-1);
    else
        [L, R] = mvdsk(L, R);
        disp([L M R]);
    end
end
function [] = ToH_23(n)
    if n > 1
        ToH_21(n-1);
        ToH_23(1);
        ToH_13(n-1);
    else
        [M, R] = mvdsk(M, R);
        disp([L M R]);
    end
end
function [] = ToH_21(n)
    if n > 1
        ToH_23(n-1);
        ToH_21(1);
        ToH_31(n-1);
    else
        [M, L] = mvdsk(M, L);
        disp([L M R]);
    end
end
function [] = ToH_32(n)
    if n > 1
        ToH_31(n-1);
        ToH_32(1);
        ToH_12(n-1);
    else
        [R, M] = mvdsk(R, M);
        disp([L M R]);
    end
end
function [] = ToH_31(n)
    if n > 1
        ToH_32(n-1);
        ToH_31(1);
        ToH_21(n-1);
    else
        [R, L] = mvdsk(R, L);
        disp([L M R]);
    end
end
%mvdsk to move disk from leg to leg
function [Ld, La] = mvdsk(Ld, La)
    i = 1;
    while Ld(i) == 0
        i = i + 1;
    end
    dsk = Ld(i);
    Ld(i) = 0;
    i = 1;
    while i <= length(La)
        if La(i) ~= 0
            break;
        else
            i = i + 1;
        end
    end
    La(i-1) = dsk;  
end
end


    