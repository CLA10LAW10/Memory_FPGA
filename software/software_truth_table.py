# Clayton Lawton
# Printing Truth Tables

file1 = open("TemperatueConversion.txt","w") # Open file

for c in range(101):
  c = str(c)
  file1.write(c + "\n") # Write to file with line returns
  #print(c)            # Print to terminal to verify values.

for f in range(101):
  f = 9/5 * f + 32
  f = round(f,1)
  f = str(f)
  file1.write(f + "\n") # Write to file with line returns
  #print(f)            # Print to terminal to verify values.

file1.close()           # Close file