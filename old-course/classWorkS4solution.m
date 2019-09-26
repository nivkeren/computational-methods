% class work 3 
% write to a file

% variables for the table
angleVec=0:89; % angleVec
sinVal=sind(angleVec); % sinVal
cosVal=cosd(angleVec); % cosVal
tanVal=tand(angleVec); % tanVal
Table=[sinVal;cosVal;tanVal];

% write to the file
fid=fopen('trigtable.txt','w'); % open a file
fprintf(fid,'%6s %12s %12s\n','sin','cos','tan'); % print the title to the file
fprintf(fid,'%6.6f %12.6f %12.6f\n',Table); % print the table to the file
fclose(fid); % close the file 


