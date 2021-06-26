`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.03.2021 20:09:29
// Design Name: 
// Module Name: alu_control_tb
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


module alu_control_tb;

reg clk;
wire [3:0] ALU_SEL;
reg [5:0] func_field;
reg [1:0] ALUOp;

alu_control uut(.clk(clk),.func_field(func_field),.ALUOp(ALUOp),.ALU_SEL(ALU_SEL));

always #20 clk=~clk;

initial begin
    clk<=1;
    ALUOp<=2'b00;
    func_field<=6'b000100;
    
    #30
    func_field<=6'b000100;
    ALUOp<=2'b01;
 
    #40   
    ALUOp<=2'b10;
    func_field<=6'b100000;
    
    #50
    func_field<=6'b100010;
    
    #50 
    func_field<=6'b100100;   
    
    #50
    func_field<=6'b100101;
    
    #50   
    func_field<=6'b101010;
    $finish;
    end
endmodule