`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2021 11:56:22 PM
// Design Name: 
// Module Name: four_bit_mux
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
/*This module connects four 1 bit, 2:1 MUXs together to *
 *create a single 4 bit, 2:1 MUX */

module four_bit_mux(Y, A, B, S);
        
        /*declare output and input ports*/
        //output is a 4 bit wide wire
        output wire [3:0] Y;
        input wire [3:0] A, B; //A and B are 4 bit wide wires
        input wire S; //Select is still 1 bit wide
       
       /*instantiate user defined modules*/
        two_one_mux MUX0(Y[0], A[0], B[0], S);
        two_one_mux MUX1(Y[1], A[1], B[1], S);
        two_one_mux MUX2(Y[2], A[2], B[2], S);//just plugging values into the 2:1 MUX...
        two_one_mux MUX3(Y[3], A[3], B[3], S);
endmodule
