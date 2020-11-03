function stop = myplotx(x, optimValues, state)
     persistent d1 d2 d3
     if ~nargin % example reset mechanism
       d1=[];
       d2=[];
       d3=[];
     end
     if strcmp(state,'iter')
      d1=[d1,x(1)];
      d2=[d2,x(2)];
      d3=[d3,x(3)];
      subplot(3,1,1)
      plot(d1.','-');
      grid on
      hold on
      title('parameter 1')
      xlabel('Iterations')
      ylabel('Paramater value')
      subplot(3,1,2)
      plot(d2.','-');
      grid on
      hold on
      title('parameter 2')
      xlabel('Iterations')
      ylabel('Paramater value')   
      subplot(3,1,3)
      plot(d3.','-');
      grid on
      title('parameter 3')
      xlabel('Iterations')
      ylabel('Paramater value')  
     end
     stop = 0;
   end