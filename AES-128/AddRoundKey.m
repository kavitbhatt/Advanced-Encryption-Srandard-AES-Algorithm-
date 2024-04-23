% Add Round Key
% In the AddRoundKey() transformation, a Round Key is added to the State 
% by a simple bitwise XOR operation. 
    function [state] = AddRoundKey(state, w, Nb)
        mx = hex2dec('11B');
        w = gf(w, 8, mx);
        state = gf(state, 8, mx);
        for c = 1:Nb
            state(c, :) = state(c, :) + w(c, :);
        end
        state = int16(state.x);
    end