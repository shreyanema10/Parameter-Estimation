A1=importdata("dataset1.dat");
B1 = A1.data;
B1 = B1(2:75,:);
A2=importdata("dataset2.dat");
B2 = A2.data;
B2 = B2(2:75,:);
c1 = [9; 1; 2.5; 0.5; 0.5; 10; 8; 15; 15; 15; 15; 15; 15; 15; 15];
c2 = [18; 2; 2.5; 1.25; 1.25; 50; 40; 100; 100; 100; 100; 100; 100; 100; 100];
% D1 C1
fprintf("dataset1; set1\n")
X = zeros(3,10);
x = zeros(10,1);
for i = 1:10
    p0 = rand(3,1);
    [X(:,i),FVAL] = hw3(B1,c1,p0);
    x(i) = FVAL;
    
end
[y,i] = min(x,[],1);
disp(y);
X(:,i)



% D2 c1
fprintf("dataset2; set1\n")
X = zeros(3,10);
x = zeros(10,1);
for i = 1:10
    p0 = rand(3,1);
    [X(:,i),FVAL] = hw3(B2,c1,p0);
    x(i) = FVAL;
    
end
[y,i] = min(x,[],1);
disp(y);
X(:,i)


% D1 c2
fprintf("dataset1; set2\n")
X = zeros(3,10);
x = zeros(10,1);
for i = 1:10
    p0 = rand(3,1);
    [X(:,i),FVAL] = hw3(B1,c2,p0);
    x(i) = FVAL;
    
end
[y,i] = min(x,[],1);
disp(y);
X(:,i)







% D2 C2
fprintf("dataset2; set2\n")
X = zeros(3,10);
x = zeros(10,1);
for i = 1:10
    p0 = rand(3,1);
    [X(:,i),FVAL] = hw3(B2,c2,p0);
    x(i) = FVAL;
    
end
[y,i] = min(x,[],1);
disp(y);
X(:,i)



