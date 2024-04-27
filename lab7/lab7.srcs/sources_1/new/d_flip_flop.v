`timescale 1ns / 1ps
`include "d_latch.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2021 06:45:16 PM
// Design Name: 
// Module Name: d_flip_flop
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


module d_flip_flop(Q, notQ, Clk, D);
    //declare all ports
    output wire Q, notQ;
    input wire Clk, D;
    //intermediate nets
    wire notClk;
    wire Qm; //output of master
    //notQm is used in instantiation
    //but left unconnected
    wire notQm;
    //instantiate the NOT gate, add 2ns delay to it
    //instantiate the D latches
    wire notNotClk;
    not #2 not0(notClk, Clk);
    not #2 not1(notNotClk, notClk);
    d_latch master_latch(Qm, notQm, D, notClk);
    d_latch slave_latch(Q, notQ, Qm, notNotClk);
    
endmodule
