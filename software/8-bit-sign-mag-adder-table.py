def add_8bit_numbers(num1, num2):
    # Convert the 8-bit numbers to decimal
    decimal1 = int(num1, 2)
    decimal2 = int(num2, 2)

    # Add the decimal values
    if (decimal1 < 128 ^ decimal2 < 128):       # 11/00 OR 00/11
        if (decimal1 > decimal2):               # 11/00 Case
            decimal1 = decimal1 - 128           # Remove negative sign for proper substitution
            result = decimal1 - decimal2        # Subtract
            result = abs(result)                # Absolute since sign will be added later
            result = result + 256               # Add proper negative sign 
        else:                                   # 00/11 Case
            decimal2 = decimal2 - 128           # Remove negative sign for proper substitution
            result = decimal1 - decimal2        # Subtract 7 bit value
            result = abs(result)                # Absolute since sign will be added later
            result = result                     # Result, bit will not be added as it is 0.
    else:                                       # 11/11 OR 00/00
        if (decimal1 > 128 and decimal2 > 128): # 11/11 Case
            decimal1 = decimal1 - 128           # Remove sign for proper addition
            decimal2 = decimal2 - 128           # Remove sign for proper addidion
            result = decimal1 + decimal2        # Add values since same sign
            result = result + 256               # Keep initial negative sign, now 9 bits
        else:                                   # 00/00 Case
            result = decimal1 + decimal2        # 00/00 Add and keep initial sign of 0.

    # Convert the result back to 8-bit binary
    binary_result = bin(result)[2:].zfill(9)

    return binary_result

# Generate all possible 7-bit binary numbers
binary_numbers = [bin(i)[2:].zfill(8) for i in range(256)]

# Open the output file
with open('sixteen-bit-rom.txt', 'w') as f:
    # Loop through all possible combinations of binary numbers
    for i in range(len(binary_numbers)):
        for j in range(len(binary_numbers)):
            # Add the two binary numbers
            result = add_8bit_numbers(binary_numbers[i], binary_numbers[j])
            # Write the result to the output file
            f.write(result + '\n')
