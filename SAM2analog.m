function [sam1to9] = SAM2analog(SAMinmat)
% SAMinmat = from1to9;
for sub = 1:size(SAMinmat, 1)
    SAMdata = SAMinmat(sub,:);
    for x = 1:size(SAMdata,2)
        if SAMdata(x) < 515, sam1to9(sub,x) = 1;
        elseif SAMdata(x) >= 515 && SAMdata(x) < 630, sam1to9(sub,x) = 2;
        elseif SAMdata(x) >= 630 && SAMdata(x) < 775, sam1to9(sub,x) = 3;
        elseif SAMdata(x) >= 775 && SAMdata(x) < 890, sam1to9(sub,x) = 4;
        elseif SAMdata(x) >= 890 && SAMdata(x) < 1035, sam1to9(sub,x) = 5;
        elseif SAMdata(x) >= 1035 && SAMdata(x) < 1150, sam1to9(sub,x) = 6;
        elseif SAMdata(x) >= 1150 && SAMdata(x) < 1280, sam1to9(sub,x) = 7;
        elseif SAMdata(x) >= 1280 && SAMdata(x) < 1410, sam1to9(sub,x) = 8;
        elseif SAMdata(x) >= 1410, sam1to9(sub,x) = 9;
        end
    end
end