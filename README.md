# VHDL Multiplier with Overflow Handling

This repository demonstrates a common bug in VHDL code: the lack of overflow handling in arithmetic operations.  The `multiplier_bug.vhdl` file contains a simple multiplier that does not account for potential overflow.  The `multiplier_solution.vhdl` file provides a corrected version with overflow detection and handling.

## Bug Description

The original multiplier code multiplies two 8-bit unsigned inputs (A and B) and outputs a 16-bit product. However, if the result of the multiplication exceeds the maximum value representable by a 16-bit unsigned integer, the most significant bits will be truncated, causing incorrect results. This can lead to unexpected behavior and system failures in applications that rely on accurate arithmetic computations.

## Solution

The solution demonstrates several ways to improve the design:

1. **Overflow Check:** The code explicitly checks for overflow before assigning the result to the output.  If overflow is detected, an appropriate action (e.g., setting an error flag, clamping the result) is taken.
2. **Larger Data Type:** Consider using a larger data type to accommodate the potential result. Using a 32-bit data type to handle two 16-bit multiplications would be better.

## How to Use

1. Clone the repository.
2. Compile and simulate both the buggy and the corrected versions using a VHDL simulator (e.g., ModelSim, GHDL).
3. Compare the results for different inputs, including cases that would cause overflow in the original code.