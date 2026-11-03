%% Tests for RecFrac2
% This script tests the output and input validation of RecFrac1.

clc;
clear;

%% Test 1: Check the recurring digits for 18/39
[k, a] = RecFrac2(18, 39);

assert(k == 6, 'Test 1 failed: incorrect period length.');
assert(isequal(a, [4 6 1 5 3 8]), ...
    'Test 1 failed: incorrect recurring digits.');

disp('Test 1 passed: RecFrac2(18,39).');

%% Test 2: Check the recurring digits for 7/19
[k, a] = RecFrac2(7, 19);

assert(k == 18, 'Test 2 failed: incorrect period length.');
assert(isequal(a, [3 6 8 4 2 1 0 5 2 6 3 1 5 7 8 9 4 7]), ...
    'Test 2 failed: incorrect recurring digits.');

disp('Test 2 passed: RecFrac2(7,19).');

%% Test 3: Check that p must be positive
errorcaught = false;
try
    RecFrac2(0,19);
catch
    errorcaught = true;
end

assert(errorcaught, 'Test 3 failed: zero p was accepted.');  
disp('Test 3 passed: p must be positive.');

%% Test 4: Check that q must be positive
errorcaught = false;
try
    RecFrac2(1,0);
catch
    errorcaught = true;
end

assert(errorcaught, 'Test 4 failed: zero q was accepted.');
disp('Test 4 passed: q must be positive.');

%% Test 5: Check that p must be an integer
errorcaught = false;
try
    RecFrac2(1.5,19);
catch
    errorcaught = true;
end

assert(errorcaught, 'Test 5 failed: non-integer p was accepted.');
disp('Test 5 passed: p must be an integer.');

%% Test 6: Check that q must be an integer
errorcaught = false;
try
    RecFrac2(1,19.5);
catch
    errorcaught = true;
end

assert(errorcaught, 'Test 6 failed: non-integer q was accepted.');
disp('Test 6 passed: q must be an integer.');

%% Test 7: Check that p must be smaller than q
errorcaught = false;
try
    RecFrac2(20,19);
catch
    errorcaught = true;
end

assert(errorcaught, 'Test 7 failed: p >= q was accepted.');
disp('Test 7 passed: p must be smaller than q.');

%% Test 8: Check that the last digit of q must be 9
errorcaught = false;
try
    RecFrac2(1,20);
catch
    errorcaught = true;
end

assert(errorcaught, 'Test 8 failed: the last digit of q not being 9 was accepted.');
disp('Test 8 passed: the last digit of q must be 9.');

%% Test 9: Check the recurring digits for 21/159 (3 digit q)
[k, a] = RecFrac2(21, 159);

assert(k == 13, 'Test 1 failed: incorrect period length.');
assert(isequal(a, [1 3 2 0 7 5 4 7 1 6 9 8 1]), ...
    'Test 1 failed: incorrect recurring digits.');

disp('Test 9 passed: RecFrac2(21,159).');

%% All tests completed
disp('All tests passed!');