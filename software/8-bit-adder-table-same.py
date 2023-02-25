def add_7bit_numbers(num1, num2):
    # Convert the 7-bit numbers to decimal
    decimal1 = int(num1, 2)
    decimal2 = int(num2, 2)

    # Add the decimal values
    result = decimal1 + decimal2

    # Convert the result back to 8-bit binary
    binary_result = bin(result)[2:].zfill(8)

    return binary_result

# Generate all possible 7-bit binary numbers
binary_numbers = [bin(i)[2:].zfill(7) for i in range(128)]

# Open the output file
with open('8-bit-same.txt', 'w') as f:
    # Loop through all possible combinations of binary numbers
    for i in range(len(binary_numbers)):
        for j in range(len(binary_numbers)):
            # Add the two binary numbers
            result = add_7bit_numbers(binary_numbers[i], binary_numbers[j])
            # Write the result to the output file
            f.write(result + '\n')
