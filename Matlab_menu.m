clear;
clc;

% Set up the stopping condition: 
%   false if user wants to exit the program
%   true if the user wants to continue running the program

continueProgram = true;

% Flags
%   true if the input file is already loaded
%   true if the ouput file is already setted

alreadyLoaded = 0;
outputSetted = 0;

% This while loop will continue to loop until continueProgram becomes false 
while continueProgram

    clc;
    
    % Display the menu to the user
	% print_menu_options;
    print_menu();
    % Print prompt
    fprintf('Enter your choice: ');
    
    % Get user input
    % For safety, read as a string to prevent MATLAB from evaluating input
	choice = input('','s');
    
    % Determine which action to take based on the user's input
    switch choice
		case '1'
            % do action for option 1
            fprintf('Enter your user name: ');
			userName = input('','s');
		case '2'
            % do action for option 2
            fprintf('Enter your file name: ');
			dataFilename = input('','s');
            % input validation            
            [input_data, alreadyLoaded] = validate_input_data(dataFilename, alreadyLoaded);
            % given statistics quantities of input data
            data = statistics(input_data); 
		case '3'
            % do action for option 3
			clear;
            
            %reset all the global variables
            alreadyLoaded = 0;
            outputSetted = 0;
            continueProgram = true;
        case '4'
            
            % checking to see if input file has been loaded and statistics has
            % been calculated
            if alreadyLoaded == 0
                fprintf('ERROR:\t No input file\n');
            else
                % set up output file 
                % prompt user's input for output filename
                fprintf('Enter your output filename: ');
                outputFilename = input('', 's');
                fprintf('Output filename has been set\n');
                
                % write statistic quantities to output file
                fileID = output_file(data, outputFilename, dataFilename, userName);
                outputSetted = 1;
            end
            fprintf('Press any key to continue...');
            pause;
            
        case '5'
            % checking to see if input file was loaded, if it was, plot a
            % histogram of it
            if alreadyLoaded == 0
                fprintf('ERROR:\t No input file\n');
                fprintf('Press any key to continue...');
                pause;
            else
                figure(1);
                fprintf('Plotting histogram...\n');
                data.histogram = histogram(input_data);
                title('histogram of input data');
                fprintf('Press any key to continue...');
                pause;
            end
            
        case '6'
            % checking to see if input file was loaded, if it was, plot a
            % histogram fit of it
            if alreadyLoaded == 0
                fprintf('ERROR:\t No input file\n');
                fprintf('Press any key to continue...');
                pause;
            else
                rng default;
                figure(2);
                fprintf('Ploting histogram fit...\n');
                data.histfit = histfit(input_data);
                title('histogram fit of input data');
                fprintf('Press any key to continue...');
                pause;
            end
        case '7'
            % checking to see if input file was loaded, if it was, plot a
            % probability plot of it
            if alreadyLoaded == 0
                fprintf('ERROR:\t No input file\n');
                fprintf('Press any key to continue...');
                pause;
            else
                figure(2);
                fprintf('Plotting probability plot...\n');
                probplot(input_data);
                title('probability plot of input data');
                fprintf('Press any key to continue...');
                pause;
            end
        case '8'
            fprintf('\nfind probability given x or z:\n\n');
            % checking to see if output file has been
            % setted, if is has, output the probability 
            % calculated to output file, if not, output 
            % error message and return to menu
            if outputSetted == 1
                fprintf(fileID, '\nFind Probability Given x or z:\n');
                prob_of_xz(fileID, alreadyLoaded, outputSetted, data);
            else 
                fprintf('ERROR:\t output file has not been setted yet');
            end
            fprintf('Press any key to continue...');
            pause;
        case '9'
            fprintf('find x or z given probability:\n\n');
            if outputSetted == 1
                fprintf(fileID, 'Find x or z Given Probability:\n');
                find_xz(fileID, alreadyLoaded, outputSetted, data);
            else
                fprintf('ERROR:\t output file has not been setted yet');
            end
            fprintf('Press any key to continue...');
            pause;
		case '10'
            % exit the program
			continueProgram = false;
        otherwise
            % This case handles invalid input
			fprintf('\nERROR: Please enter an integer between 1 and 10\n\n');
            
            % Wait for user to acknowledge the error message
            fprintf('Press any key to continue...');
            pause;
    end % end of switch
end % end of while
type(outputFilename)

% clean up after ourselves
clc;
clear done choice;
% end of script