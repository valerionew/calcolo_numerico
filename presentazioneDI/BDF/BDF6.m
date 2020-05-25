function y = BDF6(f,t,y0)
%BDF1 Summary of this function goes here
%   Detailed explanation goes here

h = diff(t);
y = zeros(numel(y0),numel(t));

y(:,1:6) = BDF5(f,t(1:6),y0);

for ii = 6:numel(t)-1
    BDF6 = @(x) (360/147).*y(:, ii) - (450/147).*y(:,ii-1) + ...
    (400/147).*y(:,ii-2) - (225/147).*y(:,ii-3) + (72/147).*y(:,ii-4) ...
    - (10/147).*y(:,ii-5) + (60/147).* h(ii).*f(t(ii+1),x) - x ;
    y(:,ii+1) = fsolve(BDF6, y(:,ii),optimset('Display','off'));
end

end
