`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2021 02:12:59 AM
// Design Name: 
// Module Name: up_counter
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


module up_counter(Count, Carry2, En, Clk, Rst);
    
    //i/o
    output reg [2:0] Count;
    output wire Carry2;
    input wire En, Clk, Rst;
    
    //intermediate nets
    wire [2:0] Carry, Sum;
    
    Threebit_counter UC1(Sum, Carry2, Count, En);
    
    always@(posedge Clk or posedge Rst)
        if(Rst)
            Count <= 0;
        else 
endmodule
