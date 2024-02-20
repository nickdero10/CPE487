--  https://ghdl.readthedocs.io/en/stable/using/QuickStartGuide.html
entity adder is
  -- `i0`, `i1`, and the carry-in `ci` are inputs of the adder.
  -- `s` is the sum output, `co` is the carry-out.
  port (
            A, B : in bit; 
            ci : in bit; 
            s : out bit; 
            co : out bit
          );
end adder;

architecture rtl of adder is
begin
  --  This full-adder architecture contains two concurrent assignments.
  --  Compute the sum.
  s <= A xor B xor ci;
  --  Compute the carry.
  co <= (A and B) or (A and ci) or (B and ci);
end rtl;
