clc;
A = [1,2,-1;2,2,3;-1,-3,0];
n = size(A,1);

L = zeros(n);
U = zeros(n);

for i = 1:n
    for j = i:n
        sum = 0;
        for k = 1:i-1
            sum = sum + L(i,k)*U(k,j);
        end
        U(i,j) = A(i,j) - sum;
        sum = 0;
        for k = 1:i-1
            sum = sum + L(j,k)*U(k,i);
        end
        L(j,i) = (A(j,i) - sum)/U(i,i);
    end
    sum = 0;
end

L
U

