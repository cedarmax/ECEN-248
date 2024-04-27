`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2021 11:12:04 PM
// Design Name: 
// Module Name: two_one_mux
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
/*This module describes a 1 bit wide multiplexer using structural constructs *
 *and gate level primitives built into Verilog. */

module two_one_mux(Y, A, B, S);

/*Declare output and input ports*/
        output wire Y;
        input wire A, B, S;
        
        /*declare internal nets*/
        wire notS;
        wire andA;
        wire andB;
        
        /*instantiate gate level modules*/
        not not0(notS, S);
        and and0(andA, notS, A);
        and and1(andB, S, B);
        or or0(Y, andA, andB);
        
endmodule //designate end of module
