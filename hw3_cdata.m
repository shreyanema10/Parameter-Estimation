A1=importdata("dataset1.dat");
B1 = A1.data;
B1 = B1(2:75,:);
A2=importdata("dataset2.dat");
B2 = A2.data;
B2 = B2(2:75,:);
c1 = [9; 1; 2.5; 0.5; 0.5; 10; 8; 15; 15; 15; 15; 15; 15; 15; 15];
c2 = [18; 2; 2.5; 1.25; 1.25; 50; 40; 100; 100; 100; 100; 100; 100; 100; 100];
B = [B1 B2(:,2:9)];
global B
global c1
global c2
fprintf("[dataset1 dataset2]; set1\n");
X = zeros(3,10);
x = zeros(10,1);
for i = 1:10
    p0 = rand(3,1);
    fun = @(p) objfun(B,c1,p);
    [X(:,i),FVAL] = fmincon(fun, p0, [], [], [], [], [0; 0; 0], [10; 10; 10], []);
    x(i) = FVAL;
    
end
[y,i] = min(x,[],1);
disp(y);
X(:,i)
% [D1;D2]; set2
fprintf("[dataset1 dataset2]; set2\n");
X = zeros(3,10);
x = zeros(10,1);
for i = 1:10
    p0 = rand(3,1);
    fun = @(p) objfun(B,c2,p);
    [X(:,i),FVAL] = fmincon(fun, p0, [], [], [], [], [0; 0; 0], [10; 10; 10], []);
    x(i) = FVAL;
    
end
[y,i] = min(x,[],1);
disp(y);
X(:,i)

function u = objfun(B,c,p)
C = kinetics(c,p,B(:,1));
u = sum(sum((B(:,2:17)-[C C]).^2, 'omitnan'),'omitnan');
end


function k = kinetics(c, p, t)
x0 = [90 10 280 10 10 280 10 10];
[T, Cv]=ode23s(@reac,t,x0);

    function f = reac(t, x) 

    r1 = c(3)*x(1)/((1+(x(8)/c(1))^c(2))*(c(6)+x(1)));
    r2 = p(3)*x(2)/(c(7) + x(2));
    r3 = p(1)*x(2)*x(3)/(x(3)+c(8));
    r4 = p(1)*x(2)*x(4)/(x(4)+c(9));
    r5 = p(2)*x(5)/(c(10)+x(5));
    r6 = p(2)*x(4)/(c(11)+x(4));
    r7 = p(1)*x(5)*x(6)/(x(6)+c(12));
    r8 = p(1)*x(5)*x(7)/(x(7)+c(13));
    r9 = c(4)*x(8)/(c(14)+x(8));
    r10 = c(5)*x(7)/(c(15)+x(7));



    fun1 = r2-r1;
    fun2 = r1-r2;
    fun3 = r6-r3;
    fun4 = r3+r5-r4-r6;
    fun5 = r4-r5;
    fun6 = r10-r7;
    fun7 = r7+r9-r8-r10;
    fun8 = r8-r9;
    fun = [fun1; fun2; fun3; fun4; fun5; fun6; fun7; fun8];
    f = fun;
    end
k = Cv;
end



