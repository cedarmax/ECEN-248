`timescale 1ns / 1ps
//`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2020 10:18:47 AM
// Design Name: 
// Module Name: combination_lock_fsm
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

module combination_lock_fsm(

    /*for ease of debugging, output state*/
    output reg [1:0] state,
    output wire [3:0] Lock, //asserted when locked
    input wire Key1, //unlock button 0
    input wire Key2, //unlock button 1
    input wire [3:0] Password, //indicate number
    input wire Reset, //reset
    input wire Clk //clock

    );
    
    /*we haven't talked about parameters much but as you can see they make our code much more readable!*/
    parameter S0 = 2'b00,
              S1 = 2'b01,
              S2 = 2'b10,
              S3 = 2'b11;
    
    /*intermediate nets*/
    reg [1:0] state;
    reg [1:0] nextState;
    
    assign Lock = (state == S3)? 4'b1111:4'b0000;
    
    always@(*) //purely combinational!
        case(state)
            S0: begin
                if(Key1) //count up
                    nextState = S1;
                else //count down
                    nextState = S0;
            end
            //Now from S0 to S1
            S1: begin
                if(Key2)
                    if(Password == 4'b0111)
                        nextState = S2;
                    else
                        nextState = S0;
                    else
                        nextState = S1;
            //S1 to s2
            end                
            S2: begin
                if(Key1)
                    if(Password == 4'b1001)
                        nextState = S3;
                    else
                        nextState = S0;
                    else
                        nextState = S2;
            end
            //S2 to S3
            S3: begin
                if(Reset)
                    nextState = S0;
                else
                    nextState = S3;
            end
            default: begin
                nextState = S0;
            end
        endcase
    always@(posedge Clk)
        if(Reset)
            state <= S0;
        else
            state <= nextState;
endmodule