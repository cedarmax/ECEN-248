`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2021 01:55:40 AM
// Design Name: 
// Module Name: adder_synchronous
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


module adder_synchronous(Carry_reg, Sum_reg, Clk, A, B);

    output reg Carry_reg;
    output reg [1:0] Sum_reg;
    
    input wire Clk;
    input wire [1:0] A, B;
    
    reg [1:0] A_reg, B_reg;
    wire Carry;
    wire [1:0] Sum;
    
    always@(posedge Clk)
        begin
            A_reg <= A;
            B_reg <= B;
        end
    
    always@(posedge Clk)
        begin
            Carry_reg <= Carry;
            Sum_reg <= Sum;
        end
endmodule
