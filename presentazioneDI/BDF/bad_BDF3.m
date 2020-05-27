function y = bad_BDF3(f,t,y0)
%BDF1 Summary of this function goes here
%   Detailed explanation goes here

h = diff(t);
y = zeros(numel(y0),numel(t));

y(:,1:3) = bad_BDF2(f,t(1:3),y0);

for ii = 3:numel(t)-1
    BDF3 = @(x) (18/11).*y(:, ii) - (9/11).*y(:,ii-1) + ...
    (2/11).*y(:,ii-2)  + (6/11 ).* h(ii).*f(t(ii+1),x) - x;
    y(:,ii+1) = fsolve(BDF3, y(:,ii),optimset('Display','off'));
end

end

