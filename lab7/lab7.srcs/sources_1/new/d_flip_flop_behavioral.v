`timescale 1ns / 1ps // delay unit is 1ns.
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2021 10:52:01 PM
// Design Name: 
// Module Name: d_flip_flop_behavioral
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


module d_flip_flop_behavioral(
    output reg Q, // described in behavioral statement
    output wire notQ, // dscribed in a dataflow statement
    input wire D,
    input wire Clk // clock signal
    );
    // describe behavior of D flip flop
    // posedge means positive(rising) edge
    always@(posedge Clk) // trigger when rising edge of Clk
        Q<=D; // non block assignemnt statement
    assign notQ = ~Q;
endmodule
