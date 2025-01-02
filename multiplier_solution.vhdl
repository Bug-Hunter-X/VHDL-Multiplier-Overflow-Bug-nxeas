```vhdl
entity multiplier is
  Port ( clock : in  STD_LOGIC;
              reset : in  STD_LOGIC;
              A : in  STD_LOGIC_VECTOR (7 downto 0);
              B : in  STD_LOGIC_VECTOR (7 downto 0);
              product : out  STD_LOGIC_VECTOR (15 downto 0);
              overflow : out STD_LOGIC);
end entity;

architecture behavioral of multiplier is

signal internal_product : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal unsigned_product : unsigned(15 downto 0);
begin

process (clock,reset)
begin
if (reset = '1') then
    internal_product <= (others => '0');
    overflow <= '0';
elif (clock'event and clock = '1') then
    unsigned_product <= unsigned(A) * unsigned(B);
    if unsigned_product > to_unsigned(65535,16) then
        overflow <= '1';
        internal_product <= (others => '1'); -- Or handle the overflow appropriately
    else
        internal_product <= std_logic_vector(unsigned_product);
        overflow <= '0';
    end if;
end if;
end process;

product <= internal_product;
end architecture; 
```