function [state] = MixColumns(state)
    mx = hex2dec('11B');
    row = [2 3 1 1];
    A = gf(gallery('circul', row), 8, mx);
    state = A * state;
    state = state.x;
end