%% Task 3: Find the maximum period

% Initialise the largest period found so far and list of pairs
maxPeriod = 0;
maxPairs = [];

% Consider denominators ending in 9 up to 749
for s = 9:10:749

    % Consider every positive numerator smaller than s
    for r = 1:s-1

        [k1, a1] = RecFrac1(r,s);

        [k2, a2] = RecFrac2(r,s);

        % Check that both algorithms agree
        if k1 ~= k2 || ~isequal(a1, a2)
            error('The algorithms disagree for r=%d, s=%d.', r, s);
        end
    
        % Update the maximum period and the list of matching pairs
        if k1 > maxPeriod
            maxPeriod = k1;
            maxPairs = [r, s];
        
        elseif k1 == maxPeriod
            maxPairs = [maxPairs; r, s];
        end
    end
end

% Display results
% Sort by denominator first, then numerator
maxPairs = sortrows(maxPairs, [2, 1]);

% Display the maximum period and all pairs that achieve it
fprintf('Maximum period length: %d\n', maxPeriod);
fprintf('All pairs (r,s) with the maximum period:\n');
disp(maxPairs);

% Select the pair with the largest denominator,
% then the largest numerator if there is a tie
chosenPair = maxPairs(end, :);
rBest = chosenPair(1);
sBest = chosenPair(2);

% Calculate and display the recurring digits
[~, bestDigits] = RecFrac1(rBest, sBest);

fprintf('Selected fraction: %d/%d\n', rBest, sBest);
fprintf('Recurring digits: 0.');
fprintf('%d', bestDigits);
fprintf('\n')