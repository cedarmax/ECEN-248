`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2021 03:33:44 AM
// Design Name: 
// Module Name: four_bit_alu
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


module four_bit_alu(
    output wire [3:0] Result, //4 bit output
    output wire Overflow, //1 bit signal for overflow
    input wire [3:0] opA, opB, //4bit operands
    /*ctrl | operation  *
     * 00  |    AND     *
     * 01  |    ADD     *
     * 10  |    AND     *
     * 11  |    SUB     */
     input wire [1:0] ctrl //2 bit operation select
    );
    
    wire [3:0] andAB;
    wire [3:0] Sum;
    wire [3:0] Cout;
    
    assign andAB[0] = opA[0] & opB[0];
    assign andAB[1] = opA[1] & opB[1];
    assign andAB[2] = opA[2] & opB[2];
    assign andAB[3] = opA[3] & opB[3];
    
    //instantiating the full adder module
    full_adder adder0(Sum[0], Cout[0], opA[0], opB[0], ctrl[1]);
    full_adder adder1(Sum[1], Cout[1], opA[1], opB[1], Cout[0]);
    full_adder adder2(Sum[2], Cout[2], opA[2], opB[2], Cout[1]);
    full_adder adder3(Sum[3], Overflow, opA[3], opB[3], Cout[2]);
    
    two_one_mux MUX0(Result[0], andAB[0], Sum[0], ctrl[0]);
    two_one_mux MUX1(Result[1], andAB[1], Sum[1], ctrl[0]);
    two_one_mux MUX2(Result[2], andAB[2], Sum[2], ctrl[0]);
    two_one_mux MUX3(Result[3], andAB[3], Sum[3], ctrl[0]);
    
    four_bit_mux mux4(Result[0], andAB[0], Sum[0], ctrl[0]);
        
    add_sub addsub0(Sum[0], Cout[0], opA[0], opB[0], ctrl[1]);
    
endmodule
