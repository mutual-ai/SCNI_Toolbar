function EventCodes = SCNI_LoadEventCodes()

%========================== SCNI_LoadEventCodes.m =========================
% This function loads a standardized set of event codes for use in SCNI
% neurophysiology experiments involving visual stimulus presentations. How
% the returned event code structure is used in your code will depend on the
% neural recording software and hardware used:
%
% 	- TDT OpenEX:   since we send event codes to OpenEX over the digital
%                   input to the RZ2, we are limited to specifying events 
%                   using numbers in the range 0-(2^13)-1. The first 8000 
%                   values are reserved for stimulus number, so event codes 
%                   begin from 8001. Use the EventCodes.TDTnumber field to 
%                   send.
%   - TDT Synapes:  Synapse can receive event codes via digital input (as
%                   with OpenEX) and via ethernet (as with Open Ephys). You
%                   can chose which to use.
%   - Open Ephys:   since communication with Open Ephys occurs via TCP
%                   connection (using ZeroMQ) we are able to send strings
%                   as well as numbers. You can chose which to send.
% 
% EXAMPLE:
% The following example shows the order that different events should be
% sent in for a typical visual selectivity experiment (e.g. 'fingerprinting').
% The letters correspond to stimulus conditions:
%
% 7   5   1 3 A 4 1   3 B 4 1   3 C 4 1   2 6 9         5   1 3 D 4   ...
% | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | ...
%
% HISTORY:
%   31/07/2017 - Proposed by murphyap@nih.gov
%   
% =========================================================================

Strings         = { 'Fix_On',...
                    'Fix_Off',...
                    'Stim_On',...
                    'Stim_Off',...
                    'Trial_Start',...
                    'Trial_End',...
                    'Block_Start',...
                    'Block_End',...
                    'Reward_Auto',...
                    'Reward_Manual',...
                    'Trial_Aborted',...
                    'ExpAborted'};
Descriptions    = {'Fixation marker appeared','Fixation marker disappeared','Stimulus appeared','Stimulus disappeared','Trial began','Trial completed','Block began','Block completed','Automated reward delivery','Manual reward delivery','Aborted trial','Experimenter aborted the block'};
Numbers         = num2cell(1:numel(Strings));
TDTnumbers      = num2cell((1:numel(Strings))+8000);
EventCodes      = struct('String',Strings,'Description',Descriptions,'Number',Numbers, 'TDTnumber',TDTnumbers);
