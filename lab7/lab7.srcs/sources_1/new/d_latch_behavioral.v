`timescale 1ns / 1ps // delay unit is 1ns.
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2021 10:50:14 PM
// Design Name: 
// Module Name: d_latch_behavioral
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


module d_latch_behavioral(
    // declare all ports
    output reg Q, // described in behavioral statement
    output wire notQ, // described in a dataflow statement
    input wire D, En //wires can drive regs
    );
    // describe behavior of D latch
    always@(En or D)
        if(En) // if En != 1'b0
            Q=D; //
        // else Q=Q
    assign notQ = ~Q; // regs can drive wires
endmodule
