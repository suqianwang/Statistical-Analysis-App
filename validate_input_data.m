function [input_data, alreadyLoaded] = validate_input_data(dataFilename, alreadyLoaded)
% checking to see if input file does not exists or if input file was already
% loaded, if it was, print error message and return to menu

if exist(dataFilename, 'file') && ~alreadyLoaded
    fprintf('Loading...\n');
    k = strfind(dataFilename, '.xlsx');
    
    % checking to see is input file is of excel type, change method of
    % loading it
    if isempty(k)
        input_data = load(dataFilename);
    else 
        input_data = xlsread(dataFilename);
    end
    
    alreadyLoaded = 1;
    fprintf('Finish loading\n')
    fprintf('Press any key to continue...');
    pause;
else
    fprintf('The file does not exists');
    fprintf('Press any key to continue...');
    pause;
end