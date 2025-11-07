`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/02/13 11:32:55
// Design Name: 
// Module Name: PID_tb
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
`timescale 1ns / 1ps

module PID_tb;

    reg              clk        ;        
    reg              rstn       ;   

    wire    [31:0]   P_target = 32'd2517;
    wire    [31:0]   i_current    ;
   
    wire [2:0] a_test;

    assign a_test = 6'b101111;
 //==============50MHz clk generating=======================
    localparam   T50M_HALF    = 10;
    initial begin
        clk = 1'b0 ;
        forever begin
            # T50M_HALF clk = ~clk ;
        end
    end    
  //========reset and finish=============
    initial begin
        rstn = 1'b0 ;
        # 30 ;
        rstn = 1'b1 ;
        # (T50M_HALF * 2 * 20000000) ;
        $finish ;
    end   

tb_PID tb_PID_tb (
    .clk         (clk      ),
    .rst_n       (rstn     ),
    .P_target    (P_target )    ,
    .i_current   (i_current )  

 );
endmodule
