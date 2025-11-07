`timescale 1ns / 1ps

module fft_tb;


 reg                    clk   ; 
 reg                    rstn ; 

        
 //============== 200MHz clk generating=======================
    localparam   T200M_HALF    = 20.000;
    initial begin
        clk = 1'b0 ;
        forever begin
            # T200M_HALF clk = ~clk ;
        end
    end    
  //========reset and finish=============
    initial begin
        rstn = 1'b0 ;
        # 30 ;
        rstn = 1'b1 ;
        # (T200M_HALF * 2 * 2000000) ;
        $finish ;
    end   

fft_test fft_test(
    .sys_clk   (clk),
    .sys_rst_n (rstn)
);
 
endmodule  
