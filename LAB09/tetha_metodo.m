function y = tetha_metodo(f, tetha, y0, t)
 
  h = diff(t);
  y (:,1)= y0;
  
  optimopt = optimset('Display','off');
  
  for n = 1:length(t)-1
    g = @(x) x - y(:,n) - h(n) .* (tetha .* f(t(n),y(:,n)) + (1-tetha).*f(t(n+1),x)); 
    y(:,n+1) = fsolve (g, y(:,n) , optimopt);
  end

end
