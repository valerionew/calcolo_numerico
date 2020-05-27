function y = bad_BDF2(f,t,y0)
%BDF1 Summary of this function goes here
%   Detailed explanation goes here

h = diff(t);
y = zeros(numel(y0),numel(t));

y(:,1:2) = bad_BDF1(f,t(1:2),y0);

for ii = 2:numel(t)-1
    BDF2 = @(x)  (4/3).* y(:,ii) - (1/3).* y(:,ii-1) ...
                    + (2/3) .* h(ii).*f(t(ii+1),x) - x;
                
    y(:,ii+1) = fsolve(BDF2, y(:,ii),optimset('Display','off'));
end


end

