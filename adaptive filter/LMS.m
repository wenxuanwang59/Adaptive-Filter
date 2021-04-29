
function [e, y, w] = LMS(d, x, mu, M)

Ns = length(d);

x = x; 
xx = zeros(M,1);
w1 = zeros(M,1);
y = zeros(Ns,1);
e = zeros(Ns,1);

for n = 1:Ns
    xx = [xx(2:M);x(n)];
    y(n) = w1' * xx;
    e(n) = d(n) - y(n);
    w1 = w1 +  mu * e(n) * xx;
    w(:,n) = w1;
end

end