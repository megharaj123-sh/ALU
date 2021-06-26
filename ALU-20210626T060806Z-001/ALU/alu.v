`timescale 1ns / 1ps

module ALU_32bit( 
//port declarations
                input [3:0]ALU_SEL,
                input [31:0]A,B,
                output reg [31:0]ALU_OUT,
                output  carry,
	        output  zero,negative,overflow,underflow

        );
		
		wire [32:0] tmp;
		assign tmp = {1'b0,A} + {1'b0,B};
                assign carry = tmp[32]; // Carryout flag
		assign zero = ~(|ALU_OUT); //zero flag
		assign negative = (ALU_OUT[31] == 1 && (ALU_SEL == 4'b0001));
		assign overflow = ({carry,ALU_OUT[31]} == 2'b01);
		assign underflow = ({carry,ALU_OUT[31]} == 2'b10);
		
	always@(*)
	begin
	
	case(ALU_SEL)
	
		  4'b0000: // AdditionOK
           ALU_OUT <= A + B ; 
		   
        4'b0001: // SubtractionOK
           ALU_OUT <= B - A ;
		   
        4'b0010: // setlessthan
           ALU_OUT <= (A<B)?32'd1:32'd0;
           
        4'b0011: // setlessthan unsigned
           ALU_OUT <= (A>B)?32'd1:32'd0;
           
        4'b0100: // Logical shift left
           ALU_OUT <= A<<1;
		   
        4'b0101: // Logical shift right
           ALU_OUT <= A>>1;
		   
        4'b0110: // shiftrightarithmetic(if the bits are signed,otherwise it is same as right shift)
           ALU_OUT <= A>>>1;
		    
        4'b0111: // logicl and 
           ALU_OUT <= A & B;
		   
        4'b1000: //  Logical or 
           ALU_OUT <= A | B;
		   
        4'b1001: //  Logical xor 
           ALU_OUT <= A ;
		   
        4'b1010: //  extra
           ALU_OUT <= B;
		   
        4'b1011: //  extra 
           ALU_OUT <= A ;
		   
        4'b1100: // extra
           ALU_OUT <=  B ;
		   
        4'b1101: // extra
           ALU_OUT <= A ;
		   
        4'b1110: // extra
           ALU_OUT <= B ;
		   
        4'b1111: // extra
           ALU_OUT <= A ; 
		   
          default: ALU_OUT <= A + B; 
        endcase
    end

endmodule	
