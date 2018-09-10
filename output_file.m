function fileID = output_file(data, outputFilename, dataFilename, userName)
% create an output file with user defined filename

fileID = fopen(outputFilename, 'w');

% write data filename, date, user name to the output file
fprintf(fileID, '%s\n\n %s\n %s\n\n', dataFilename, datestr(now, 'mm/dd/yy'), userName);


% write statistic of input data and whatever probabilities user calculated
% into output file
fprintf(fileID, 'Mean \t= %06.2f \n', data.mean);
fprintf(fileID, 'Median \t= %06.2f \n', data.median);
fprintf(fileID, 'Mode \t= %06.2f \n', data.mode);
fprintf(fileID, 'Var \t= %06.2f \n', data.var);
fprintf(fileID, 'Stdev \t= %06.2f \n', data.stdev);
fprintf(fileID, 'Min \t= %06.2f \n', data.min);
fprintf(fileID, 'Max \t= %06.2f \n', data.max);
fprintf(fileID, 'Count \t= %06d \n\n', data.count);

fprintf(fileID, 'the type of standard deviation we use is:  %s\n\n', data.stdType);
