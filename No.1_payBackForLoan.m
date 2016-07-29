function [ amount ] = payBackForLoan( P, i, n )
% Calculate the amount of repay for loan
% input:
%   P: The amount of money you loan
%   i: Interest rate of loan
%   n: Years you have to pay back
% output:
%   amount: the amount of money you pay each year

amount = zeros(1,n);
for j = 1:n
    amount(j) = (P*i*(1+i).^j)/((1+i).^j-1);
end
end

