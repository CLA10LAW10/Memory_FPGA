library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use std.textio.all;
use ieee.std_logic_textio.all;

entity rom_eight_bit_magnitude_adder is
   Generic(
        DATA_WIDTH : integer:=8;
        ADDR_WIDTH : integer:=16
   );
   Port ( clk : in STD_LOGIC;
          a : in STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0);
          b : in STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0);
          sum : out STD_LOGIC_VECTOR (DATA_WIDTH downto 0));
end rom_eight_bit_magnitude_adder;

architecture Behavioral of rom_eight_bit_magnitude_adder is

constant ROM_DEPTH : integer := 2**ADDR_WIDTH;
type rom_type is array (0 to 2**ADDR_WIDTH-1) of std_logic_vector(DATA_WIDTH downto 0);

    impure function init_rom return rom_type is
        file text_file_16_bit : text open READ_MODE is "sixteen-bit-rom.txt";
        variable text_line : line;
        variable rom_content : rom_type ;
        variable value: std_logic_vector(DATA_WIDTH downto 0);

        begin

            for i in 0 to ROM_DEPTH -1 loop
                readline(text_file_16_bit, text_line);
                read(text_line, value);
                rom_content(i) := value;
            end loop;
        return rom_content;
    end function;

signal addr_r : STD_LOGIC_VECTOR ((DATA_WIDTH * 2) - 1 downto 0);
signal rom: rom_type := init_rom;

begin

    process(clk)
    begin
        if (rising_edge(clk)) then
            sum <= rom(to_integer(unsigned(addr_r)));
        end if;
    end process;

    addr_r <= a & b;
end Behavioral;
       
