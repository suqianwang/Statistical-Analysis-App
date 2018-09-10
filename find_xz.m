function find_xz(fileID, alreadyLoaded, outputSetted, data)
% given the probability of x or z, under the condition of normal distribution, using z-table to calculate it?s correspond value

fprintf('In your judgment, is the data normally distributed?(please enter Y(Yes) or N(No))\nyour answer: ');
answer = input('','s');
fprintf(fileID, 'In your judgment, is the data normally distributed?\nyour answer: %s\n\n', answer);
if answer == 'N'
    fprintf('ERROR:\t Data is not normally distributed, can not calculate probability using z table\n');
else
    % checking to see if input file has already been loaded, if it
    % has, prompt user for input to choose x or z, if not, output
    % error message and return to menu
    if alreadyLoaded == 0
        fprintf('ERROR:\t No input file\n');
    else
        fprintf('input ''x'' or ''z'': ');
        xz_input = input('','s');
            switch xz_input
                case 'x'
                    % prompt user for input the probability of x,
                    % check if it is valid
                    fprintf('Enter probability of x: ');
                    prob_x = input('');
                      
                    if ~isnumeric(prob_x)
                        fprintf('ERROR:\t x is invalid\n');
                    else
                        if (prob_x < 0) || (prob_x > 1)
                        fprintf('ERROR:\t invalid probability\n');
                        else
                            x = norminv(prob_x, data.mean, data.stdev);
                            % check to see if output file has been setted
                            if outputSetted == 1
                                fprintf('outputting to file...\n')
                                fprintf(fileID, 'given probability of x: %f, x = %f \n\n', prob_x, x);
                                fprintf('finish output\n');
                            else
                                fprintf('ERROR:\t output file has not been setted yet');
                            end
                        end
                    end
                    fprintf('Press any key to continue...');
                    pause;
                    
                case 'z'
                    % similar to the case 'x'
                    fprintf('Enter probability of z ');
                    prob_z = input ('');
                    if ~isnumeric(prob_z)
                        fprintf('ERROR:\t z is invalid\n');
                    else
                        if (prob_z < 0) || (prob_z > 1)
                        fprintf('ERROR:\t invalid probability\n');
                        else
                            z = norminv(prob_z,0,1);
                            if outputSetted == 1
                                fprintf('outputting to file...\n')
                                fprintf(fileID, 'given probability of z: %f, z = %f \n\n', prob_z, z);
                                fprintf('finish output\n');
                            else
                                fprintf('ERROR:\t output file has not been setted yet');
                            end
                        end
                    end
                    fprintf('Press any key to continue...');
                    pause;
            end
    end
    fprintf('Press any key to continue...');
    pause;
end
