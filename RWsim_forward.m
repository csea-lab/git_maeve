%% RW model to find sweet spot of reinforcement rates for scanner fom

function [w] = RWsim_forward(reinRate, plotflag, param)
% reinRate = which reinforcement rate of intermittent reinforcement
% param = parameters learing rate, saliency, intercept
% ============================================================ MB, Apr 2021
w = zeros(120,16,30);
if nargin < 3
    param = [.5 .5 .1];
end
for fauxsub = 1:30
    for r_idx = 1:size(reinRate,2) % step through the various reinforcement rates
        rein = reinRate(r_idx); % get the current rate for this loop
        [contingencies] = getconti4RWsim(rein); % get your contingencies for each faux subj
        temp = rescorlaWagnerLearnOrigIntcpt(param, contingencies);
        temp(1)= 0.5;
        w(:,r_idx,fauxsub) = temp;
        if plotflag == 1
            figure(2468)
            subplot(4,4,r_idx)
            plot(temp(5:end))
            title({['learn (' num2str(param(1)) '); u (' num2str(param(2)) '); intcpt (' num2str(param(3)) ')'];...
                [num2str(rein*100) ' percent, ' num2str(round(rein*17)+3) ' USs per CS+']},'FontSize', 20,'FontWeight', 'normal')
            box off
        end
    end % reinforcement rate index
    pause(.4)
end % faux subj