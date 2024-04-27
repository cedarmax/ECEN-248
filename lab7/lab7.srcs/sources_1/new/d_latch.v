`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2021 02:44:47 PM
// Design Name: 
// Module Name: d_latch
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


module d_latch(Q, notQ, D, En);
    //declare all ports
    output wire Q, notQ;
    input wire D, En;
    //intermediate nets
    wire notD, nandDEN, nandNDEN;
    //delay of nand0 is 2ns.
    nand #2 nand0(Q, nandDEN, notQ);
    nand #2 nand1(notQ, Q, nandNDEN);
    nand #2 nand2(nandDEN, D, En);
    nand #2 nand3(nandNDEN, notD, En);
    not #2 not4D(notD, D);
    
endmodule
