function [exp1to10] = exp2analog(EXPinmat)
% to get 1 - 10 expectancy values from the horizontal pixel coordinate
% EXPinmat should be a matrix with subjects as rows and EXP responses as columns
% =========================================================== MB, Feb 2022

for sub = 1:size(EXPinmat, 1) % indexes and loops through subj
    EXPdata = EXPinmat(sub,:);
    for resp = 1:size(EXPdata,2) % indexes and loops through number of responses
        if EXPdata(resp) < 390, exp1to10(sub,resp) = 1;
        elseif EXPdata(resp) >= 480 && EXPdata(resp) < 540, exp1to10(sub,resp) = 2;
        elseif EXPdata(resp) >= 630 && EXPdata(resp) < 690, exp1to10(sub,resp) = 3;
        elseif EXPdata(resp) >= 780 && EXPdata(resp) < 840, exp1to10(sub,resp) = 4;
        elseif EXPdata(resp) >= 930 && EXPdata(resp) < 990, exp1to10(sub,resp) = 5;
        elseif EXPdata(resp) >= 1070 && EXPdata(resp) < 1130, exp1to10(sub,resp) = 6;
        elseif EXPdata(resp) >= 1230 && EXPdata(resp) < 1290, exp1to10(sub,resp) = 7;
        elseif EXPdata(resp) >= 1380 && EXPdata(resp) < 1440, exp1to10(sub,resp) = 8;
        elseif EXPdata(resp) >= 1530 && EXPdata(resp) < 1590, exp1to10(sub,resp) = 9;
        elseif EXPdata(resp) >= 1680, exp1to10(sub,resp) = 10;
        end
    end
end