% ENCRYPT
function [out] =  Cipher(in, K, Nk, Nb, Nr)
    
    in = reshape(in, Nb, 4);
    state = int32(in);
    w = KeyExpansion(K, Nk, Nb, Nr);
    state = AddRoundKey(state, w(1:Nb, :)', Nb);
    
    for round = 1:(Nr-1)
        state = SubBytes(state);
        state = ShiftRows(state);
        state = MixColumns(state);
        state = AddRoundKey(state, w(round*Nb+1:(round+1)*Nb, :)', Nb);
    end

    state = SubBytes(state);
    state = ShiftRows(state);
    state = AddRoundKey(state, w(Nr*Nb+1:(Nr+1)*Nb, :)', Nb);
    out = state;
end