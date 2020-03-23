k = 8;

% matlab consiglia di preallocare vk 
vk_1 = zeros(1,k+1);


for i = 0:k
    vk_1(i+1) = (2.*i + 1) .^ 2;
end

vk_1

vk_2 = (2.*[0:k] +1) .^2