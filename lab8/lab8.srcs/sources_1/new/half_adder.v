`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2021 02:08:51 AM
// Design Name: 
// Module Name: half_adder
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


module half_adder(S, Cout, A, B);
    //i/o
    output wire S;
    output wire Cout;
    input wire A, B;
    
    //logic diagram
    assign S = A ^ B;
    assign Cout = A & B;
endmodule
