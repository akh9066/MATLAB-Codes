f=dir('/Users/shettyakhil/Desktop/MATLAB/Convex Envelope/SurfPlots/Ackley*.jpg');
fil={f.name};  
for k=1:numel(fil)
  file=fil{k}
  new_file=strrep(file,'.fig','.png')
  im=imread(file)
  imwrite(im,new_file)
end