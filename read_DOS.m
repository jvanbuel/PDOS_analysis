function [data] = read_DOS(file)
% Read DOS file
if(isempty(file))

    if(~exist('file_loc','var'))
    [input,pathname] = uigetfile('*.txt','Select the data file');
    end

    if isequal(pathname,0)
        disp('User selected Cancel')
    return
    else
        disp(['User selected ', fullfile(input)])
    end
    file_loc = strcat(pathname,input);
    data= importdata(file_loc);

else
   % pathname= pwd;
  %  file_loc = strcat(pathname,'/',file);
   % data= importdata(file_loc);j  
   data = importdata(file);

end

