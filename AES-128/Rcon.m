function [out] = Rcon(i)
    mx = hex2dec('11B');
    temp = gf([0x02, 0x00, 0x00, 0x00], 8, mx);
    out = gf([0x01, 0x00, 0x00, 0x00], 8, mx);
    for j = 1:(i-1)
        out = out .* temp;
    end
    out = out.x;
end