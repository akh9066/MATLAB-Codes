files = dir('/Users/shettyakhil/Desktop/MATLAB/My Codes/model1/Crarray/*.mat');
filarr = {files.name};

for i = 1:length(filarr)
    fname = char(filarr(i))
    [pathstr, name, ext] = fileparts(fname);
    importfile(fname);
    plot(crarray(:,1), crarray(:,2));
    fname = strcat('/Users/shettyakhil/Desktop/MATLAB/My Codes/model1/Crarray/Plots/', name, '.fig');
    savefig(fname);
end

