`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2021 12:34:14 AM
// Design Name: 
// Module Name: full_adder
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
/*This module describe the gate level model of a full *
 adder in Verilog */

module full_adder(S, Cout, A, B, Cin);

/*declare out put and input ports*/
//1 bit wires
    output wire S, Cout;
    input wire A, B, Cin; //1 bit wires
    
    wire andBCin, andACin, andAB; //1 bit wires
    
    assign S = A ^ B ^ Cin; //^ = XOR
    assign andAB = A & B;//& = AND
    assign andBCin = B & Cin;
    assign andACin = A & Cin;
    
    assign Cout = andAB | andBCin | andACin;//| = OR
    
endmodule
