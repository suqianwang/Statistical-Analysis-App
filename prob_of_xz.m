function prob_of_xz(fileID, alreadyLoaded, outputSetted, data)
% given value of x or z, under the condition of normal distribution, using z-table to calculate it?s correspond probability

fprintf('In your judgment, is the data normally distributed?(please enter Y(Yes) or N(No))\nyour answer: ');
answer = input('','s');
fprintf(fileID, 'In your judgment, is the data normally distributed?\nyour answer: %s\n\n', answer);
if answer == 'N'
    fprintf('ERROR:\t Data is not normally distributed, can not calculate probability using z table\n');
else
    % checking to see if input file was loaded
    if alreadyLoaded == 0
        fprintf('ERROR:\t No input file\n');
    else
        % prompt user for x or z and it's value
        fprintf('Enter ''x'' or ''z'': ');
        xz_input = input('','s');
        
        switch xz_input
            case 'x'
                fprintf('Enter value of x: ');
                x = input('');

                % input validation: input has to be a number
                if ~isnumeric(x)
                    fprintf('ERROR:\t x is invalid\n');
                else
                    % calculate probability of given value
                    prob = normcdf(x, data.mean, data.stdev);

                    % checking to see if output file has been
                    % setted, if is has, output the probability 
                    % calculated to output file, if not, output 
                    % error message and return to menu
                    if outputSetted == 1
                        fprintf('outputting to file...\n');
                        fprintf(fileID, 'given x = %f, probability of x = %f \n\n', x, prob);
                        fprintf('finish output\n');
                    else 
                        fprintf('ERROR:\t output file has not been setted yet');
                    end
                    fprintf('Press any key to continue...');
                    pause;
                end
            case 'z'
                % this case is similar to the case 'x'
                fprintf('Enter value of z: ');
                z = input ('');
                if ~isnumeric(z)
                    fprintf('ERROR:\t z is invalid\n');
                else
                    prob = normcdf(z);
                    if outputSetted == 1
                        fprintf('outputting to file...\n')
                        fprintf(fileID, 'given z = %f, probability of z = %f \n\n', z, prob);
                        fprintf('finish output\n');
                    else 
                        fprintf('ERROR:\t output file has not been setted yet');
                    end
                end
        end
    end
    fprintf('Press any key to continue...');
    pause;
end