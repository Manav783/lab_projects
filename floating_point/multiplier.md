# 4-Bit Floating Point Multiplier (2’s Complement Method)

## Floating Point Representation

Each number is represented in the form:

A = M × 2^E

Where:
- M → 4-bit mantissa (signed, 2’s complement)
- E → 3-bit exponent

## Multiplication Rule

Let: A = M1 × 2^E1   and B = M2 × 2^E2  
Then, A × B = (M1 × M2) × 2^(E1 + E2)

The multiplication operation is divided into:
1. Exponent Addition
2. Mantissa Multiplication
3. Normalization

## Step 1: Exponent Addition

- Add the 3-bit exponents using a binary adder  
- E_out = E1 + E2  

## Step 2: Mantissa Multiplication (2’s Complement Shift-Add Method)

Since mantissas are signed 4-bit numbers, direct 2’s complement multiplication is used.

### Algorithm:

1. Sign-extend both 4-bit mantissas to 8 bits
2. Initialize Product = 0
3. For each bit of multiplier (LSB to MSB):
   - If bit = 1 → Add multiplicand to Product
   - Shift multiplicand left by 1
4. Final 8-bit value is the signed product

Because 2’s complement inherently supports signed arithmetic, no separate sign handling is required.


## Step 3: Normalization

- The 8-bit product is normalized back to 4-bit mantissa format
- If shifted:
  - Left shift → Decrease exponent
  - Right shift → Increase exponent

Final result is expressed as:

M_final × 2^E_final

## Files
- 'fp_mutliplier.v' consists of the verilog code for the exact along with needed comments
- 'fp_multiplier_tb.v' is the testbench code for the designed module, consists of basic examples change according to your requirements

