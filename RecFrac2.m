function [k,a] = RecFrac2(p,q)
% % RecFrac2 uses Algorithm 2 and returns the recurring digits in the
% decimal expansion of p / q , among all pairs of
% positive integers ( p , q ) such that p < q and the last digit of q is a 9.

    % Input validation
    
    % Produces an error if the input of p is not a positive integer
    if ~isnumeric(p) || ~isreal(p) || ~isscalar(p) || ...
            ~isfinite(p) || p <= 0 || fix(p) ~= p
        error('p must be a positive integer.')
    end 
    
    % Similarly for q
    if ~isnumeric(q) || ~isreal(q) || ~isscalar(q) || ...
            ~isfinite(q) || q <= 0 || fix(q) ~= q
        error('q must be a positive integer.')
    end

    % Produces an error if p is larger or equal to q or if the last digit
    % of q is not 9
    if p >= q
        error('p must be smaller than q.')
    end

    if mod(q,10) ~= 9
        error('the last digit of q must be 9.')
    end

    % Calculate the divisor
    d = (q - 9)/10 + 1;

    % Store the starting number and initialise the digits
    n = p;
    seen = [];
    a = [];

    % Continue until the current number has appeared before
    while ~ismember(n, seen)
        seen(end+1) = n;

        digit = floor(n/d);
        remainder = mod(n,d);

        a(end+1) = digit;
        
    % If the remainder is zero, the next number is just the digit
        if remainder == 0
            n = digit;
        else
            n = 10*remainder + digit;
        end
    end

    k = length(a);
end 
