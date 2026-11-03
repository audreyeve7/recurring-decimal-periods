# Recurring Decimal Periods

## Overview
This project investigates recurring decimal expansions of rational numbers using MATLAB. It implements two algorithms for calculating the recurring digits and period length of fractions, then uses these algorithms to identify the maximum recurring period for a specified set of fractions.

## Methods
Two algorithms are implemented:

- **Algorithm 1 (`RecFrac1`)** – identifies the recurring period by tracking when the remainder returns to its initial value.
- **Algorithm 2 (`RecFrac2`)** – identifies repeated states to determine when the decimal expansion begins to repeat.

Both algorithms are compared in terms of their outputs and computational performance.

## Key Results
- Identified a maximum recurring period of **708**.
- Found that all 708 qualifying fractions have denominator **709**.
- Selected \(708/709\) as the fraction with the largest numerator among the maximum-period pairs.
- Verified that both algorithms produce matching recurring digits and period lengths.

## Technologies
- MATLAB
- Number theory
- Algorithm design and implementation
- Computational analysis

## Repository Structure
- `RecFrac1.m` – implementation of Algorithm 1.
- `RecFrac2.m` – implementation of Algorithm 2.
- `testRecFrac1.m` - validation of Algorithm 1.
- `testRecFrac2.m` - validation of Algorithm 2.
- `MaximumPeriod.m` – script for the maximum-period investigation.
- `recurring-decimal-periods` – final project report.

## Running the Project
Download the MATLAB files and place them in the same directory. Run the main project script in MATLAB to reproduce the maximum-period investigation.

## Author
Audrey Ward
