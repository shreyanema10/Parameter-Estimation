function u = objfun(p)
x0 = [90 10 280 10 10 280 10 10 90 10 280 10 10 280 10 10];
C = kinetics(c,p,B(:,1))
u = sum(sum((B-C).^2, 'omitnan'),'omitnan');
end