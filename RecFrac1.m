function [k,a] = RecFrac1(p,q)
% Recfrac1 uses Algorithm 1 and returns the recurring digits in the
% decimal expansion of p/q, among all pairs of positive integers
% (p, q) such that p<q and the last digit of q is a 9.

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
    
    % Store initial remainder for stopping condition
    p0 = p;
    a = []; 

    while true

        digit = floor(10*p/q);
        a(end+1) = digit;
        p = 10*p - digit*q;

        % Stopping condition
        if p == p0
            break
        end

    end

    k = length(a);
end

