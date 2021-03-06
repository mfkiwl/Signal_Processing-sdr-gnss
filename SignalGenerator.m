


function [signal,fs,number_period,npt] = SignalGenerator(signal_type, frequency, amplitude, amp_offset, phase_offset, npp, duration )

    % Signal Generator function
    %   Generate any periodic signal you want
    %   Input:
    % -signal_type: 'sinus','cosinus','rectangular','triangular' [char]
    % -frequency: [Hz]
    % -amplitude
    % -amp_offset
    % -phase_offset: in degree
    % -npp: number of point per period
    % -duration: [second]
    %   Output:
    % -signal: nx1 vector
    % -fs: "sample frequency" equivalent [Hz]
    % -number_period: number of period
    % -npt: total number of point

    % Phase Radian conversion
    phase_offset = (phase_offset*pi)/180;                 

    %%%%%%%%%%%%%%%%%%%%%%
    % Connexe parameters %
    %%%%%%%%%%%%%%%%%%%%%%
    fs = frequency*npp;                             % "sample frequency" equivalent
    number_period = duration * frequency;           % number of period
    npt = npp * number_period + 1;                  % total number of point

    %%%%%%%%%%%%%%%%%
    % Abscisse Axes %
    %%%%%%%%%%%%%%%%%

    x = linspace(0,duration,npt); %(return npt point)
    % Spacing between points = duration/(npt-1)
    %%%%%%%%%%%%%%%%%%%%%%
    % Signal Calculation %
    %%%%%%%%%%%%%%%%%%%%%%

    signal = zeros(1,npt);

    if strcmp(signal_type,'sinus')
        for t = 1:npt
            signal(t) = amp_offset + amplitude*sin(2*pi*frequency*x(t) - phase_offset);
        end
    elseif strcmp(signal_type,'cosinus')
        for t = 1:npt
            signal(t) = amp_offset + amplitude*cos(2*pi*frequency*x(t) - phase_offset);
        end
    elseif strcmp(signal_type,'rectangular')
% use square function
    else
        disp('Signal type incorrect');
    end
end

