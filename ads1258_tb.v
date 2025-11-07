`timescale 1ns / 1ps

module ads1258_tb;

    reg              clk;        
    reg              rstn; 
    reg              DOUT=1'b1       ;     
   // wire             CLK_DIV_s ; 
   // wire             CLK_pp;
    wire              DIN       ;
    wire              SCLK      ;
    wire              CS         ;    
   
    wire Flag0,Flag1;
    
 //============== 200MHz clk generating=======================
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

ads1258#(.Fs_Hz(1000)) ads1258_tb (
    .sysclk   (clk),
    .locked   (rstn),
    .Rx_0     (DOUT)    ,
    .Tx_0      (DIN ),
    .Clk_0     (SCLK    ) ,
    .CS        (CS       )
    //.en_Ain0   (Flag0)    ,
    //.en_Ain1   (Flag1)     

 );
endmodule
