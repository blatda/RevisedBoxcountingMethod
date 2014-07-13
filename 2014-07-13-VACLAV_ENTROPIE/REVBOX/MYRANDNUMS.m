function [ RN ] = MYRANDNUMS( L )
% MYRANDNUMS 

RN = rand(L,3);

fid = fopen('myrandom.txt','w');

 fprintf(fid,'RN = [  \n');
for i = 1:L
    fprintf(fid,'%0.4f  %0.4f  %0.4f;  \n',RN(i,1), RN(i,2), RN(i,3));
end;
fprintf(fid,'];  \n');

fclose(fid);

end

