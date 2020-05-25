function y = BDF4(f,t,y0)
%BDF1 Summary of this function goes here
%   Detailed explanation goes here

h = diff(t);
y = zeros(numel(y0),numel(t));

y(:,1:4) = BDF3(f,t(1:4),y0);

for ii = 4:numel(t)-1
    BDF4 = @(x) (48/25).*y(:, ii) - (36/25).*y(:,ii-1) + ...
    (16/25).*y(:,ii-2) - (3/25).*y(:,ii-3) + ...
    (12/25).* h(ii).*f(t(ii+1),x) - x ;
    y(:,ii+1) = fsolve(BDF4, y(:,ii),optimset('Display','off'));
end

end

