# Clayton Lawton
# Printing Truth Tables

file1 = open("TemperatueConversion.txt","w") # Open file

for c in range(101): # 0 - 100
  c = bin(c)[2:]
  c = str(c)
  file1.write(c + "\n") # Write to file with line returns
  print(c)            # Print to terminal to verify values.

for f in range(101): # 32 - 212
  f = 9/5 * f + 32
  f = int(f)
  f = bin(f)[2:]
  f = str(f)
  file1.write(f + "\n") # Write to file with line returns
  print(f)            # Print to terminal to verify values.

file1.close()           # Close file