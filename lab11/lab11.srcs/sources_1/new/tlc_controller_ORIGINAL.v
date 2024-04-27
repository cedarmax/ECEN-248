`timescale 1ns / 1ps
`default_nettype none
`define one_sec 50000000
`define three_sec 150000000
`define fifteen_sec 750000000
`define thirty_sec 1500000000
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2020 09:36:46 AM
// Design Name: 
// Module Name: tlc_controller
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

/*This is a behavioral Verilog description of a 2 bit saturating counter.*/

//module saturating_counter(
    /*ouput and input are wires*/
  //  output wire [1:0] Count;
    //output reg Sat;
    //input wire Up;
    //input wire Clk, Rst;
//);
//endmodule

module tlc_fsm(
    output reg [2:0] state, //output for debugging
    output reg RstCount, //use an always block
    /*another always block for these as well*/
    output reg [1:0] highwaySignal, farmSignal,
    input wire [30:0] Count, //use n computed earlier
    input wire Clk, Rst, //clock and reset
    input wire farmSensor
);

    // defining states
    parameter Srst = 3'b000,
    S0 = 3'b001,
    S1 = 3'b010,
    S2 = 3'b011,
    S3 = 3'b100,
    S4 = 3'b101,
    S5 = 3'b110;
    
    /*intermediate nets*/
    reg [2:0] nextState;
    
    //defining colors
    parameter green = 2'b11,
    yellow = 2'b10,
    red = 2'b01;
    
    /*describe next state and output logic*/
    always@(state or Count)
        case(state)
            Srst: begin
                highwaySignal = red;
                farmSignal = red;
                nextState = S0;
                RstCount <= 1;
            end
            S0: begin
                if(Count == `one_sec) //if count reached
                    nextState = S1; //transition next state
                else
                    nextState = S0; //remain current state
                highwaySignal = red;
                farmSignal = red;
                if(Count == `one_sec) // if count reached
                    RstCount = 1; // rest counter
                else
                    RstCount = 0; //counter continues running
            end
            S1: begin
                if(Count == `thirty_sec && farmSensor == 1) //if count reached
                    nextState = S2; //transition to next
                else
                    nextState = S1; //remain in current state
                highwaySignal = green;
                farmSignal = red;
                if(Count == `thirty_sec) //count reached
                    RstCount = 1; //rest counter
                else
                    RstCount = 0; //let counter continue running
            end
            S2: begin
                if(Count == `three_sec) //if count reached
                    nextState = S3; //transition to next state
                else
                    nextState = S2; //remain in current state
                highwaySignal = yellow;
                farmSignal = red;
                if(Count == `three_sec) // if count reached
                    RstCount = 1; // rest counter
                else
                    RstCount = 0; // let counter continue running
            end
            S3: begin
                if(Count == `one_sec) //if count reached
                    nextState = S4; //transition to next state
                else
                    nextState = S3; //remain in current state
                highwaySignal = red;
                farmSignal = red;
                if(Count == `one_sec) // if count reached
                    RstCount = 1; // rest counter
                else
                    RstCount = 0; // let counter continue running
            end
            S4: begin
                if(Count == `fifteen_sec && farmSensor == 0) //if count reached
                    nextState = S5; //transition to next state
                else
                    nextState = S4; //remain in current state
                highwaySignal = red;
                farmSignal = green;
                if(Count == `fifteen_sec) // if count reached
                    RstCount = 1; // rest counter
                else
                    RstCount = 0; // let counter continue running
            end
            S5: begin  
                if(Count == `three_sec) //if count reached
                    nextState = S0; //transition to next state
                else
                    nextState = S5; //remain in current state
                highwaySignal = red;
                farmSignal = yellow;
                if(Count == `three_sec) // if count reached
                    RstCount = 1; //rest counter
                else
                    RstCount = 0; //let counter continue running
            end
            default: begin //avoid latches
                nextState = S0;
                highwaySignal = red;
                farmSignal = red;
                RstCount = 1;
            end

       endcase
    
    /*behavior for input clock*/
    always@(posedge Clk)
        if(Rst) begin
            state <= Srst;
        end
        else
            state <= nextState;
endmodule

/*This module describes the top level traffic light controller module discussed in lab11*/
module tlc_controller(

    output wire [1:0] highwaySignal, farmSignal, //connected to LEDs
    /*Let's output state for debugging!*/
    output wire [3:0] JB,
    input wire Clk,
    /*the buttons provide input to our top level circuit*/
    input wire Rst, //use as reset
    input wire Sensor

    );
    
    /*intermediate nets*/
    wire RstSync;
    wire RstCount;
    reg [30:0] Count;
    
    assign JB[3] = RstCount;
    
    /*Synchronize button inputs*/
    synchronizer syncRst(RstSync, Rst, Clk);
    
    /*instantiate FSM*/
    tlc_fsm FSM(
        .state(JB[2:0]), //wire state up to JB
        .RstCount(JB[3]),
        .highwaySignal(highwaySignal),
        .farmSignal(farmSignal),
        .Count(Count),
        .Clk(Clk),
        .Rst(RstSync),
        .farmSensor(Sensor)
    );
    
    /*Describe counter with a synchronous reset*/
    always@(posedge Clk )
        if(RstCount)
            Count <= 0;
        else
            Count <= Count + 1;
    
endmodule
