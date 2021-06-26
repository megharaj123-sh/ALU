`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.03.2021 18:17:26
// Design Name: 
// Module Name: alu_control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu_control(clk,func_field,ALUOp,ALU_SEL);

    input clk; //To synchronize
    input [5:0] func_field; //lower bits of instruction--> Instruction[5:0]
    input [1:0] ALUOp; //comes from the Main control Unit
    output reg [3:0] ALU_SEL; //O/p of the ALU control goes to the ALU to perform the specified operation
    
	always @(negedge clk)
	   case(ALUOp)
	       2'b00: //lw,sw instn 
	            //Irrespective of the func field, it generates an add control signal[to calculate the address]
	            ALU_SEL<=4'b0010;
	       2'b01: //branch instn
	            //Irrespective of the func field, it generates an subtract control signal[to check for the beq condition]
                ALU_SEL<=4'b0110;
           2'b10: //R-type instruction
                    case(func_field)
                        6'b100000: //add 
                            ALU_SEL<=4'b0010;
                        6'b100010: //sub 
                            ALU_SEL<=4'b0110;
                        6'b100100: //AND
                            ALU_SEL<=4'b0000;
                        6'b100101: //OR
                            ALU_SEL<=4'b0001;
                        6'b101010: //Set on less than
                            ALU_SEL<=4'b0111; 
                     endcase                                      
       endcase
endmodule
