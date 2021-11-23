function [] = mat2BRIK(templateBRIK, outname, datamat, brikLabels)
% mat2BRIK(templateBRIK, outname, datamat)
% takes 4D BOLD-related data and writes out an AFNI compatible BRIK
% ==> matlab2BRIK('202.CSPLINz.NEU+tlrc.BRIK', 'GM21', Spearman)
% ==> mat2BRIK('/Volumes/Maeve7TB/Leipzig_Data/0_June_GM25/2_r4s/10.1.stats_IM+tlrc.BRIK','compcorr',squeeze(nanmean(compcorr,4)),'gray vs red~circ vs sq~red vs gray~sq vs circ')
% ============================================================ AK, Jan 2020

[err, V, Info, ErrMessage] = BrikLoad(templateBRIK);
if nargin == 4, Info.BRICK_LABS = brikLabels; end
Opt.Scale = 0;
Opt.Prefix  = outname;
Opt.View  = '+tlrc';
Opt.verbose  = 0;
Opt.AppendHistory  = 0;
Opt.NoCheck = 1;
[err, ErrMessage, Info] = WriteBrik (datamat, Info, Opt);