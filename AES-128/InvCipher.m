% DECRYPT
function [out] = InvCipher(in, K, Nk, Nb, Nr)

    w = KeyExpansion(K, Nk, Nb, Nr);
    
    in = reshape(in, Nb, 4);
    state = int32(in);
    state = AddRoundKey(state, w(Nr*Nb+1:(Nr+1)*Nb, :)', Nb);
   
    for round = (Nr-1):-1:1
       state = InvShiftRows(state);
       state = InvSubBytes(state);
       state = AddRoundKey(state, w(round*Nb+1:(round+1)*Nb, :)', Nb);
       state = InvMixColumns(state);
    end
    
    
    state = InvShiftRows(state);
    state = InvSubBytes(state);
    state = AddRoundKey(state, w(1:Nb, :)', Nb);
    out = state;
end