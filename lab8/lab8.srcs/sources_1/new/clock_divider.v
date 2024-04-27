`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2021 03:48:29 PM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(ClkOut, ClkIn);
    /*output port needs to be a reg because we will drive it with *
    *a behavioral statement                                       */
    output wire [3:0] ClkOut;
    input wire ClkIn; //wires can drive regs
    
    /*this is a keyword we have not seen yet!*
    *as the name implies, it is a parameter*
    *that can be changed at compile time... */
    parameter n=5; //make count 6 bits for now...
    
    reg [n:0] Count; //count bit width is based on n! how cool is that!
    
    /*simple behavioral construct to describe a counter... *
    *Are you ready for this?!?                             */
    always@(posedge ClkIn) //should look familiar...
        Count <= Count + 1; //yea that's it
        
    /*now we need to wire up our ClkOut which is a 4 bit wire*/
    /*Wire up to most significant bits*/
    assign ClkOut[3:0] = Count[n:n-3];
    
endmodule //sorry if this was not more exciting
