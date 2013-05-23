---------------------------------------------------------------------------------------------------
--
-- Title       : ControlUnit
-- Design      : designproj2
-- Author      : MAJ Paul Maxwell
-- Company     : USMA
--
---------------------------------------------------------------------------------------------------
--
-- File        : ControlUnit.vhd
-- Generated   : 6 Aug 14:10:36 2003
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
---------------------------------------------------------------------------------------------------
--
-- Description : Control unit for the MARC1 processor for design project 2 in CS380.
--		 Modified to add an Address Register and fixed Tristate bus access
--
---------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity Control_Unit is
	 port(
		clk: IN  std_logic;	
		Mem_rd: OUT  std_logic  :='1';	 
		Mem_wr: OUT  std_logic  :='1';		
		Mem_cs: OUT std_logic :='1'; 
		Z: IN std_logic; 
		N: IN std_logic; 
		R_we: OUT std_logic; 
		ld_op: OUT std_logic; 
		st_op: OUT std_logic;
		ctl_wd: OUT std_logic_vector(14 downto 0); 
		const_out: OUT  std_logic_vector(15 downto 0); 
		CU_addr_bus: INOUT  std_logic_vector(15 downto 0);	
		CU_data_bus: INOUT  std_logic_vector(15 downto 0);
  		run: IN std_logic; 	
		rst: IN  std_logic 
	     );
end Control_Unit;


architecture Control_Unit of Control_Unit is

--States for Control unit execution cycles
type states is (Reset, Fetch, Decode, Execute, WB);
signal current_state : states;

--Instructions set types
type operations is (subx, st, addx, andx, notx, srlx, sllx, ld, hlt, sethi, addi, ret,
bz, bn, ba, orx, call, nop, jmp);
signal op : operations;

signal PC, SP, IR, AR : std_logic_vector(15 downto 0);  --added AR to fix address issues
signal PSR : std_logic_vector(1 downto 0);		   	  --condition code register
signal offset : std_logic_vector(15 downto 0);	        --displacement and offset register
signal test : std_logic_vector(3 downto 0);		        --dummy signal for case statement
signal AR_EN, SP_EN, PCd_EN : std_logic;					  --tristate enable bits

begin
	test <= IR(10 downto 7);

	CU_addr_bus <= AR when AR_EN = '1' else
						SP when SP_EN = '1' else
						(others=>'Z');

	CU_data_bus <= PC when PCd_EN = '1' else
						(others=>'Z');

	
	main: process (clk, current_state, run, rst, PC,AR,CU_data_bus, CU_addr_bus)
	begin
		if rst = '0' then 						--active low reset
			current_state <= reset;
		elsif (clk'event and clk = '1') then
			case current_state is
				when reset => 					   --initialize signals
					PC <= X"0080";				   --point to 1st instr.  --address was "0100"  --addr was "0080" 2 Aug 12
					SP <= X"04FE";				   --init. stack				--address was "0FFE"
					IR <= (others=>'0');
					PSR <= "00";
					mem_rd <= '0';
					mem_wr <= '1';
					mem_cs <= '0';
					R_we <= '0';
					ld_op <= '0';
					st_op <= '0';
					ctl_wd <= (others=>'0');
					const_out <= (others=>'0');
					SP_EN <= '0';
					AR_EN <= '1';
					AR <= PC;
					PCd_EN <= '0';
					offset <= (others=>'0');
					if run = '0' then current_state <= fetch;  --active low run signal
					else current_state <= reset;
					end if;	 
					
				when fetch =>
					AR_EN <= '0';
					PCd_EN <= '0';
					SP_EN <= '0';			--added 13 Nov 12
					AR <= PC + 1;			--added for address bus fix
					IR <= CU_data_bus;
					Mem_CS <= '0';
					Mem_Rd <= '0'; 
					current_state <= decode;
					R_we <= '0'; 
					ld_op <= '0';
					st_op <= '0';
					PC <= PC + 1;
					
				when decode => 
				   --PC <= PC + 1;			--moved location to this state to avoid timing issues
				   PCd_EN <= '0'; 		--new addition for bus control
					if IR(15)='1' then op <= call; offset <= '0' & IR(14 downto 0);	 
						PCd_en <='1';SP_EN <= '1';  	--added 28 Jan 04 
						ld_op <= '0'; st_op <= '0';
						AR_EN <= '0';						--added 13 Nov 12
						ctl_wd <= (others=>'0');  		--added 13 Nov 12 to deal with data bus issues
						--AR_EN <= '0';-- Mem_cs <= '0';  Mem_wr <= '0';
						Mem_CS <= '1';					  --return value to off
						Mem_Rd <= '1';					  --return value to off
					elsif IR(14)='0' then
						case test is
							when "1001" => op <= subx; ctl_wd <= IR(15 downto 1);ld_op <= '0'; st_op <= '0';Mem_CS <= '1';					  --return value to off
					Mem_Rd <= '1';	AR_EN <= '1';				--added 13 Nov 12				  --return value to off
										   --SP <= SP+2;
							when "1000" => op <= orx; ctl_wd <= IR(15 downto 1);ld_op <= '0'; st_op <= '0';Mem_CS <= '1';					  --return value to off
					Mem_Rd <= '1';	AR_EN <= '1';				--added 13 Nov 12				  --return value to off
							when "0111" => op <= jmp; ctl_wd <= IR(15 downto 1);ld_op <= '0'; st_op <='1';Mem_CS <= '1';					  --return value to off
					Mem_Rd <= '1';	AR_EN <= '1';				--added 13 Nov 12				  --return value to off --added
							when "0110" => op <= addx; ctl_wd <= IR(15 downto 1);ld_op <= '0'; st_op <= '0';Mem_CS <= '1';					  --return value to off
					Mem_Rd <= '1';	AR_EN <= '1';				--added 13 Nov 12				  --return value to off
							when "0101" => op <= andx; ctl_wd <= IR(15 downto 1);ld_op <= '0'; st_op <= '0';Mem_CS <= '1';					  --return value to off
					Mem_Rd <= '1';	AR_EN <= '1';				--added 13 Nov 12				  --return value to off
							when "0100" => op <= notx; ctl_wd <= IR(15 downto 1);ld_op <= '0'; st_op <= '0';Mem_CS <= '1';					  --return value to off
					Mem_Rd <= '1';	AR_EN <= '1';				--added 13 Nov 12				  --return value to off
							when "0011" => op <= srlx; ctl_wd <= IR(15 downto 1);ld_op <= '0'; st_op <= '0';Mem_CS <= '1';					  --return value to off
					Mem_Rd <= '1';	AR_EN <= '1';				--added 13 Nov 12				  --return value to off
							when "0010" => op <= sllx; ctl_wd <= IR(15 downto 1);ld_op <= '0'; st_op <= '0';Mem_CS <= '1';					  --return value to off
					Mem_Rd <= '1';	AR_EN <= '1';				--added 13 Nov 12			  --return value to off
							when "0001" => op <= ld; ctl_wd <= '1'& IR(14 downto 1); ld_op <='1'; st_op <= '0';Mem_cs <= '0'; 
					 			   Mem_rd <='0';
					 			   R_we <= '0';
									AR_EN <= '0';				--added 20 Nov 12
							when "0000" => op <= st; ctl_wd <= IR(15 downto 1);ld_op <= '0'; st_op <= '0';Mem_CS <= '1';					  --return value to off
					Mem_Rd <= '1';	AR_EN <= '1';				--added 13 Nov 12				  --return value to off
							when others => op <= nop; ctl_wd <= (others=>'0');ld_op <= '0'; st_op <= '0';Mem_CS <= '1';					  --return value to off
					Mem_Rd <= '1';	AR_EN <= '1';				--added 13 Nov 12				  --return value to off  --added nop to deal with unexpected values
					    end case;
					else
						AR_EN <= '1';				--added 13 Nov 12
						Mem_CS <= '1';					  --return value to off
						Mem_Rd <= '1';					  --return value to off
						case IR(10 downto 8) is
							when "000" => op <= hlt; ctl_wd <= IR(15 downto 1); ld_op <= '0'; st_op <= '0';
							when "001" => op <= ret; ctl_wd <= IR(15 downto 1); ld_op <= '0'; st_op <= '0';
										   SP <= SP + 1;
							when "011" => op <= addi; ctl_wd <= IR(15 downto 8)&'0'&IR(13 downto 11)&"000";ld_op <= '0'; st_op <= '0';
											if IR(7)='1' then
												offset <= X"FF"&IR(7 downto 0);
											else
												offset <= X"00"&IR(7 downto 0);
											end if;
							when "100" =>  op <= ba; ctl_wd <= IR(15 downto 1); ld_op <= '0'; st_op <= '0';
											if IR(7)='1' then
												offset <= X"FF"&IR(7 downto 0);
											else
												offset <= X"00"&IR(7 downto 0);
											end if;
							when "101" => op <= bn; ctl_wd <= IR(15 downto 1); ld_op <= '0'; st_op <= '0';
											if IR(7)='1' then
												offset <= X"FF"&IR(7 downto 0);
											else
												offset <= X"00"&IR(7 downto 0);
											end if;
							when "110" => op <= bz; ctl_wd <= IR(15 downto 1); ld_op <= '0'; st_op <= '0';
											if IR(7)='1' then
												offset <= X"FF"&IR(7 downto 0);
											else
												offset <= X"00"&IR(7 downto 0);
											end if;
							when "111" => op <= sethi; offset<=IR(7 downto 0)&X"00"; ld_op <= '0'; st_op <= '0';
							 			  ctl_wd <= IR(15 downto 11)&'0'&IR(10 downto 8)&"000000";				
							when others => op <= nop; ctl_wd <= (others=>'0'); ld_op <= '0'; st_op <= '0';
						end case;
					end if;
					current_state <= execute;
						
	 			when execute =>
				 --if (op /= call and op /= ret) then AR <= PC; --change added/commented out 21 Nov 12
				 --end if;
				 AR_EN <= '1';
				 
				 if (op /= call) then PCd_EN <= '0'; --added
				 end if;
				 case op is
					 when subx => ld_op <= '0'; st_op <= '0';
					 when st => St_op <= '1'; Mem_cs <='0'; ld_op <= '0';
					 			Mem_wr <= '0'; 
					 when jmp => PC <= CU_data_bus; ld_op <= '0'; st_op <= '0';
					 when addx => ld_op <= '0'; st_op <= '0';
					 when andx => ld_op <= '0'; st_op <= '0';
					 when notx => ld_op <= '0'; st_op <= '0';
					 when srlx => ld_op <= '0'; st_op <= '0';
					 when sllx => ld_op <= '0'; st_op <= '0';
					 when ld => ld_op <='0'; st_op <= '0';
					 			   Mem_cs <= '0';
					 			   Mem_rd <='0'; 
					 			   R_we <= '1';	   --ld_op & R_we to allow register capture
					 when sethi => const_out <= offset; ld_op <= '0'; st_op <= '0';
				 	 when addi => const_out <= offset;ld_op <= '0'; st_op <= '0';
					 when ret => Mem_cs <= '0'; Mem_rd <= '0'; ld_op <= '0'; st_op <= '0';
					 			    SP_EN <='1'; 
				 	 when bz => if PSR(0)='1' then PC <= PC + offset; AR <= PC + offset; end if; 			--added 26 Nov 12
									ld_op <= '0'; st_op <= '0'; 
					 when bn => if PSR(1)='1' then PC <= PC + offset; AR <= PC + offset;	end if;			--added 26 Nov 12
									ld_op <= '0'; st_op <= '0'; 									
					 when ba => PC <= PC + offset;ld_op <= '0'; st_op <= '0'; AR <= PC + offset;
					 when orx => ld_op <= '0'; st_op <= '0';
					 when call => Mem_cs <= '0';  Mem_wr <= '0';ld_op <= '0'; st_op <= '0';
					 			  SP_EN <= '1';  
								  PCd_EN <='1';  
					 			  AR <= offset; --change added 
									--PC <= offset;
					 when others => null;
				 end case;
				 if (op=hlt) then current_state <= execute;
				 else current_state <= wb;
				 end if;
				 
				when wb =>
					mem_wr <= '1';					   --return value
					AR_EN <= '1'; 
				   SP_EN <= '0'; PCd_EN <= '0';
					AR <= PC;
					PSR <= N & Z;								--added 26 Nov 12 to fix logic error, not registered
					ld_op <= '0'; st_op <= '0';
					if op = ld then
						ld_op <= '0';  R_we <= '0';	   --turn off values
						Mem_cs <= '0'; Mem_rd <= '0';
					else
						Mem_cs <= '0'; Mem_rd <='0';
						--if op = hlt then current_state <= reset;		--commented out 26 Nov 12
						if (op=addx or op=notx or op=srlx or op=sllx or op=sethi or
						  op=addi or op=andx or op=subx or op=orx) then
							R_we <= '1';
						end if;	 
					end if;
					if op = call then SP <= SP - 1;	PC <= offset;
						 AR <= offset;		--added 28 Jan 04
					end if;	 --release bus
					if op = ret then PC <= CU_data_bus; 
							AR <= CU_data_bus;--PC;   --
					end if;
					current_state <= fetch;
					--place new value on addr. bus
				when others => null;
			end case;
		end if;
	end process;				 

end Control_Unit;
