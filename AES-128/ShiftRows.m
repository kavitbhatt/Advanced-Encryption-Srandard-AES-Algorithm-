% ShiftRows() Transformation
% In the ShiftRows() transformation, the bytes in the last three rows of 
% the State are cyclically shifted over different numbers of bytes 
% (offsets). The first row, r = 0, is not shifted. 
    function [state] = ShiftRows(state)
        for i = 2:4
            state(i, :) = circshift(state(i, :), 1-i);
        end
    end