`timescale 1ns / 1ps
`include "alu.v"

module tb_alu;
//Inputs
 reg[31:0] A,B;
 reg[3:0] ALU_SEL;

//Outputs
 wire[31:0] ALU_OUT;
 wire carry;
 wire zero,negative,overflow,underflow;
 // Verilog code for ALU
 integer i=0;
 ALU_32bit test_unit(
            .A(A),.B(B),  // ALU 32-bit Inputs                 
            .ALU_SEL(ALU_SEL),// ALU Selection
            .ALU_OUT(ALU_OUT), // ALU 32-bit Output
            .carry(carry), // Carry Out Flag
	    .zero(zero),   // zero flag
	    .negative(negative), // negative flag
	    .overflow(overflow), // overflow flag
	    .underflow(underflow) // underflow flag
			 
     );
	 initial 
	 $monitor("A=%b,B=%b,ALU_SEL=%b,ALU_OUT=%b,carry=%b,zero=%b,negative=%b,overflow=%b,underflow=%b",A,B,ALU_SEL,ALU_OUT,carry,zero,negative,overflow,underflow);
	
    initial begin
	
		//$dumpfile("ALU_32bit.vcd");
		//$dumpvars(0,tb_alu);
			
      A = 32'h0A0A0A0A;
      B = 32'h02020202;
      ALU_SEL = 4'h0;
      #10;
	  
      for (i=0;i<=15;i=i+1)             
      begin
       ALU_SEL = ALU_SEL + 8'h01;
      #10;
      end
      
      A = 32'hF6F6F6F6;
      B = 32'h0A0A0A0A;
      #20 $finish;
    end
endmodule
