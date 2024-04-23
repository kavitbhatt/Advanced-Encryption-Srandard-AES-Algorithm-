function [state] = InvMixColumns(state)
    mx = hex2dec('11B'); 
    row = [14 11 13 9];
    A = gf(gallery('circul', row), 8, mx);
    state = A * state;
    state = state.x;
end