function [spec3d_Welch, spec3d_Welch_avg, freqswelch] = FFT_spectrum3D_singtrialWelch(Data3d, timewinSP, SampRate);
   
   for trial = 1: size(Data3d,3)
        
        [Pxx,freqswelch] = pwelch(squeeze(Data3d(:, timewinSP, trial)'),750,250,750,SampRate);
        spec3d_Welch(:, :, trial) = Pxx'; 
        
    end  % loop over trials
    
    spec3d_Welch_avg = mean(spec3d_Welch,3);
  
 	


	