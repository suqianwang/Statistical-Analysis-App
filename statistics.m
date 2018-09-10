function data = statistics(input_data)
% calculate statistics quantities of input data, specify different types of
% standard deviation used in calculating the statistic

data.mean = mean(input_data);
data.median = median(input_data);
data.mode = mode(input_data);
data.var = var(input_data);
data.min = min(input_data);
data.max = max(input_data);
data.count = length(input_data);

if data.count > 30
    data.stdev = std(input_data,1);
    data.stdType = 'population standard deviatioin';
else
    data.stdev = std(input_data,0);
    data.stdType = 'sample standard deviation';
end