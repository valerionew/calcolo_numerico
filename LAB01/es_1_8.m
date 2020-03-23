format long

k = 100;

p = zeros(1,k);
q = zeros(1,k);

p(1) = 1;
p(2) = 1/3;
q(1) = 1;
q(2) = 1/3;

for i = 1:(k-2)
   p(i+2) = 10/3 .* p(i+1) - p(i)
   q(i+2) = 1/3 .* p(i+1);
end

p
q

hold on
plot(1:k, p, 'r')
plot(1:k, q, 'g')
