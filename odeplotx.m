function stop = odeplotx(x, optimValues, state)
     persistent d1 d2 d3 d4 d5 d6 d7 d8
     if ~nargin % example reset mechanism
       d1=[];
       d2=[];
       d3=[];
       d4=[];
       d5=[];
       d6=[];
       d7=[];
       d8=[];
     end
     if strcmp(state,'iter')
      d1=[d1,x(1)];
      d2=[d2,x(2)];
      d3=[d3,x(3)];
      plot(d1.','-');
      hold on
      plot(d2.','-');
      hold on
      plot(d3.','-');
      hold on
      title('parameter 3')
      xlabel('Iterations')
      ylabel('Paramater value')  
     end
     stop = 0;
   end