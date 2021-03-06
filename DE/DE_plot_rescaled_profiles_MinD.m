%% this function plots 4 profiles of time-superposed MinD.
% used only 4 best cells, all the rest give crappy profiles and crappy MinD
% distributions. Difficult experiment.
%
% Note MW: data is saved like 
% A(i).x        x coordinates line
% A(i).y        y coordinates line
% A(i).folder   folder
% A(i).bin      binning (influences micron per pixel)
%
% The data currently shown in the manuscript is
% A(1):     6.027 um
% A(3):     19.296 um
% A(5):     26.814 um
% Not used: A(2), 19.6800um; A(4), 17.9580um.

% BASEDIR = 'F:\Experiments\Microscopy-Single Cell\rutgers\MinD_MG1655\'; % DE original
BASEDIR = '\\storage01\data\AMOLF\groups\tans-group\Biophysics\Experiments_Dmitry\rutgers\MinD_MG1655\'; % server location

pix_to_micro = 0.041;
% ithink I didnt use the l.5 lens, so they would be 1.5 longer (otherwise
% use 1)
lens_mag = 1.5;



A = [];

load([BASEDIR '2014-09-05\M9_maltose_IPTG_6p7uM\10_profile.mat'])
j = size(A,2);
A(j+1).x = a(:,1);
A(j+1).y = a(:,2);
A(j+1).folder = [BASEDIR '2014-09-05\M9_maltose_IPTG_6p7uM'];
A(j+1).bin = 2;%check!!!;

load([BASEDIR '2014-09-10\M9-maltose-centrif-IPTG_20uM_newstock\13_profile.mat'])
j = size(A,2);
A(j+1).x = a(:,1);
A(j+1).y = a(:,2);
A(j+1).folder = [BASEDIR '2014-09-10\M9-maltose-centrif-IPTG_20uM_newstock'];
A(j+1).bin = 4;%check!!!;


load([BASEDIR '2014-09-10\M9-maltose-centrif-IPTG_20uM_newstock\16_profile.mat'])
j = size(A,2);
A(j+1).x = a(:,1);
A(j+1).y = a(:,2);
A(j+1).folder = [BASEDIR '2014-09-10\M9-maltose-centrif-IPTG_20uM_newstock\'];
A(j+1).bin = 4;%check!!!;


load([BASEDIR '2014-09-10\M9-maltose-centrif-IPTG_20uM_newstock\16_2_profile.mat'])
j = size(A,2);
A(j+1).x = a(:,1);
A(j+1).y = a(:,2);
A(j+1).folder = [BASEDIR '2014-09-10\M9-maltose-centrif-IPTG_20uM_newstock\'];
A(j+1).bin = 4;%check!!!;


load([BASEDIR '2014-09-09\M9-maltose-IPTG_20uM\7_profile.mat'])
j = size(A,2);
A(j+1).x = a(:,1);
A(j+1).y = a(:,2);
A(j+1).folder = [BASEDIR '2014-09-09\M9-maltose-IPTG_20uM'];
A(j+1).bin = 4;%check!!!;


for i=1:size(A,2)
    A(i).length_range = (lens_mag *  max(A(i).x)) *...
        (A(i).bin * pix_to_micro);
end

% plotting
if ~exist('NOPLOTTINGPLEASE','var')
    
    figure('position',[560   151   553   797]);
    
    for i=1:size(A,2)
        subplot(size(A,2), 1, i);
        hold on;

        x = A(i).x;
        y = A(i).y;

        %length_range = (lens_mag *  max(x)) *...
            %(A(i).bin * pix_to_micro);
        
        % rescale length to [0 1]
        x = x/max(x);

        % rescale y to [0 1];
        y = y-min(y);
        y = y/max(y);

        plot(x, y, '-')
        title({['Folder: ' ],...
            A(i).folder,...
            ['Length range ' num2str(A(i).length_range) ' um']}, 'interpreter','none')
    end
    
end

