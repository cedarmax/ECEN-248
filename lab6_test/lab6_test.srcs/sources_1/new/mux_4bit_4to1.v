`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 10:24:30 AM
// Design Name: 
// Module Name: mux_4bit_4to1
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

`default_nettype none

module mux_4bit_4to1(Y,A,B,C,D,S);

    output reg [3:0] Y;
    input wire [3:0] A, B, C, D;
    
    always@(*)
        case(S)
            2'b00: Y=A; 
            2'b01: Y=B;
            2'b10: Y=C;
            2'b11: Y=D;
        endcase

endmodule
