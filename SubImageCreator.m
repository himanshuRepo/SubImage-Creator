clc;
clear all;
close all;

filePath = 'ImagesData/';
directories = dir(filePath);

for dirIndex=1:length(directories)
    
    currentdir = directories(dirIndex).name;
    disp(currentdir);
    if (length(currentdir)>3)
        currentpath=[filePath currentdir];
        currentdir = dir(currentpath);
        for fileIndex=1:length(currentdir)
            currentFilename = currentdir(fileIndex).name;
            disp(currentFilename);
            if (length(currentFilename)>4) && strcmp(currentFilename(end-3:end),'.jpg')
                imageFullPath = [currentpath '/' currentFilename];
                I = imread(imageFullPath);
                % I=imread('hist_cnt_002_00.jpg');
                I1 = rgb2gray(I);
                [m,n]=size(I1);
                if mod(m,2) ==0
                    a=m/2;
                    b=n/2;
                else
                    a=ceil(m/2);
                    b=ceil(n/2);
                end
                part1=I1(1:a,1:b);
                part2=I1(1:a,b+1:n);
                part3=I1(a+1:m,1:b);
                part4=I1(a+1:m,b+1:n);
                for i =1:4                   
                    sname=strcat(imageFullPath(1:end-4),'_',num2str(i),'.jpg');
                    partname=strcat('part',num2str(i));
%                     varname = genvarname(partname);
                    imwrite(eval(partname),sname);
                end
            end
        end
    end
end
