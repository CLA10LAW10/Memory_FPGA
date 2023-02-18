# Clayton Lawton
# Printing Truth Tables

file1 = open("TemperatueConversion.txt","w") # Open file

for x in range(213):
  x = str(x)
  file1.write(x + "\n") # Write to file with line returns
  # print(x)            # Print to terminal to verify values.

file1.close()           # Close file