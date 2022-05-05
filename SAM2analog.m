function [sam1to9] = sam2analog(SAMinmat)
% to get 1 - 9 SAM values from the horizontal pixel coordinate
% SAMinmat should be a matrix with subjects as rows and SAM responses as columns
% =========================================================== MB, Feb 2022

for sub = 1:size(SAMinmat, 1) % indexes and loops through subj
    SAMdata = SAMinmat(sub,:);
    for resp = 1:size(SAMdata,2) % indexes and loops through number of responses
        if SAMdata(resp) < 515, sam1to9(sub,resp) = 1;
        elseif SAMdata(resp) >= 515 && SAMdata(resp) < 630, sam1to9(sub,resp) = 2;
        elseif SAMdata(resp) >= 630 && SAMdata(resp) < 775, sam1to9(sub,resp) = 3;
        elseif SAMdata(resp) >= 775 && SAMdata(resp) < 890, sam1to9(sub,resp) = 4;
        elseif SAMdata(resp) >= 890 && SAMdata(resp) < 1035, sam1to9(sub,resp) = 5;
        elseif SAMdata(resp) >= 1035 && SAMdata(resp) < 1150, sam1to9(sub,resp) = 6;
        elseif SAMdata(resp) >= 1150 && SAMdata(resp) < 1280, sam1to9(sub,resp) = 7;
        elseif SAMdata(resp) >= 1280 && SAMdata(resp) < 1410, sam1to9(sub,resp) = 8;
        elseif SAMdata(resp) >= 1410, sam1to9(sub,resp) = 9;
        end
    end
end