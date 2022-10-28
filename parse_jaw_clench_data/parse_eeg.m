function data = parse_eeg(file_name, type)
%PARSE_EEG Takes a .csv from an eeg file and returns a matrix of the data
%   Only records data, no artifacts or other data

rand_clench_struct = dir(fullfile(file_name, type));

filenames = struct2cell(rand_clench_struct);
filenames = append(filenames(2,:), '\', filenames(1,:));

data = {length(filenames)};

for index = 1:length(filenames)
    data{index} = readmatrix(filenames{index});

    data{index}(:,9:end) = [];

    data{index}(:,1) = [];
end

% output = cat(1, data{:});

end

