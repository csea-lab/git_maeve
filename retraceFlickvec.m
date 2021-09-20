function retraceFlickvec(drivingFreqHz, msTrialLength, refreshRateHz, plotflag)
% Use this code to determine the following parameters for a ssVEP flicker:
    % (1) how many retraces/cycle your stimulus should be on & off 
    % (2) how many total retraces your trial should be given your trial length
    % (3) how many cycle repeats are needed for desired trial length
% This function returns an error if:
    % (1) your driving frequency cannot be achieved within the limits of
        % the monitor's refresh rate
    % (2) your desired trial length does not accommodate a whole number's
        % worth of cycle repeats 
% Input variables:
    % drivingFreqHz = desired frequency (in Hz) of your stimulus 
    % msTrialLength = desired length of trial (in ms)
    % refreshRateHz = refresh rate (in Hz) of presentation monitor 
    % plotflag = input anything if you want to plot 1s of desired flicker 
    
% ==> retraceFlickvec(6,4000,120,1);
% =========================================================== MB, Sept 2021

% Determine duration of one retrace in ms 
    refresh_ms = 1000./refreshRateHz;
% Determine the length (in ms) of one cycle of the driving frequency
    % e.g., one cycle of 10 Hz -> 100 ms
    cycleLength = 1000./drivingFreqHz;
% Get one cycle's stimulus on/off pattern by retrace
    % e.g., one cycle of 10 Hz = 100 ms -> 50 ms/8.333 ms retraces on, 50 ms/8.333 ms retraces off  
    half_cycle = cycleLength./2;
    retracesOnOff = round(half_cycle./refresh_ms,2)
% Return an error if driving freq is incompatible with monitor's refresh rate & suggest alternates
    if isint(round(retracesOnOff,2)) == 0
        error(['Given a 50% duty cycle, your desired driving frequency is incompatible with your monitor''s refresh rate. retracesOnOff must be an integer. Try a driving frequency of '...
        num2str(1000/(round(retracesOnOff).*refresh_ms.*2)) ' Hz or ' num2str(1000/((round(retracesOnOff)-1).*refresh_ms.*2)) ' Hz instead.'])
    end
% Get number of total retraces for trial duration
    totalRetraces = round(msTrialLength./refresh_ms,2)
% Get how many cycles are needed for trial duration
    cycleRepeats = round(totalRetraces./(round(retracesOnOff).*2),2)
% Given input variables, is the trial length viable for desired driving freq?? If not, suggest alternates & end function 
if isint(cycleRepeats) == 0, error(['Given your driving frequency, trial length is not viable. cycleRepeats must be an integer. Try a trial length of '...
    num2str((round(cycleRepeats)*cycleLength)) ' ms or ' num2str(((round(cycleRepeats)-1)*cycleLength)) ' ms instead.'])
else
% Display code for psychtoolbox in command window 
    fprintf(['For psychtoolbox code:\nflickVec = repmat([ones(' ...
      num2str(round(retracesOnOff)) ',1); zeros(' num2str(round(retracesOnOff))...
      ',1)],' num2str(cycleRepeats) ',1)'';\n\n']) 
% Visualize cycle on/off pattern for 1 s
    if nargin > 3
        flickVec = repmat([ones(round(retracesOnOff),1); zeros(round(retracesOnOff),1)],cycleRepeats,1)';
        taxis = 0:refresh_ms:1000-1; % get retraces in ms
        figure('Name','Retrace-based flicker')
            plot(taxis,flickVec(1:refreshRateHz)) % plot 1s
            box off, ylim([-.05 1.05])
            yticks([0 1]), yticklabels({'Stimulus Off','Stimulus On'})
            xlabel('Time (ms)')
            title([num2str(drivingFreqHz) ' Hz retrace-based flicker'])
    end % plotflag
end % viability of trial length, given driving frequency
end % function