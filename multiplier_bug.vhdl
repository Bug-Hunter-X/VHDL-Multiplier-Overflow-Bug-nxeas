```vhdl
entity multiplier is
  Port ( clock : in  STD_LOGIC;
              reset : in  STD_LOGIC;
              A : in  STD_LOGIC_VECTOR (7 downto 0);
              B : in  STD_LOGIC_VECTOR (7 downto 0);
              product : out  STD_LOGIC_VECTOR (15 downto 0));
end entity;

architecture behavioral of multiplier is

signal internal_product : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');

begin

process (clock,reset)
begin
if (reset = '1') then
    internal_product <= (others => '0');
elif (clock'event and clock = '1') then
    internal_product <= std_logic_vector(unsigned(A) * unsigned(B));
end if;
end process;

product <= internal_product;

end architecture; 
```