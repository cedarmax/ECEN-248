`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2021 01:38:41 PM
// Design Name: 
// Module Name: sr_latch
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


module sr_latch(Q, notQ, En, S, R);
    
    //declare all ports
    output wire Q, notQ;
    input wire En, S, R;
    
    //intermediate nets
    //nandSEN is the output of NAND(S, En)
    //nandREN is the output of NAND(R, En)
    wire nandSEN, nandREN;
    //delay of nand0 is 2ns. 
    nand #2 nand0(Q, nandSEN, notQ);
    //fill in with your own code
    nand #2 nand1(notQ, nandREN, Q);
    nand #2 nand2(nandSEN, S, En);
    nand #2 nand3(nandREN, R, En);
    
endmodule