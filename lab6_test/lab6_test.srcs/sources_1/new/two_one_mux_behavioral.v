`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2021 01:22:15 AM
// Design Name: 
// Module Name: two_one_mux_behavioral
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


module two_one_mux(Y, A, B, S);

    output reg Y;
    input wire A, B, S;
    
    always@(A or B or S)
        begin
            if (S == 1'b0)
                Y = A;
            else
                Y = B;
        end

endmodule
