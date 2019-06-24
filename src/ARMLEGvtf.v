// Name : Ronit Kumar

`timescale 1ns / 1ps
`include "ARMLEG.v"
`include "Clock.v"


module ARMLEGvtf;
    wire clk;
    reg reset;
    wire [63:0] pc_in,pc_out;
    

    Clock clock(clk);

    ARMLEG ARMLEGv8(clk, reset, pc_in,  pc_out);


    always @ ( reset ) begin
      #1;
      reset = ~reset;
    end

    initial
    begin
//
//    ARMLEGv8.DataMem.Data[08] = 8'h55;
//    ARMLEGv8.DataMem.Data[09] = 8'h55;
//    ARMLEGv8.DataMem.Data[10] = 8'h55;
//    ARMLEGv8.DataMem.Data[11] = 8'h55;
//
//    ARMLEGv8.DataMem.Data[12] = 8'h55;
//    ARMLEGv8.DataMem.Data[13] = 8'h55;
//    ARMLEGv8.DataMem.Data[14] = 8'h55;
//    ARMLEGv8.DataMem.Data[15] = 8'h55;
//
//    ARMLEGv8.DataMem.Data[16] = 8'haa;
//    ARMLEGv8.DataMem.Data[17] = 8'haa;
//    ARMLEGv8.DataMem.Data[18] = 8'haa;
//    ARMLEGv8.DataMem.Data[19] = 8'haa;
//
//    ARMLEGv8.DataMem.Data[20] = 8'haa;
//    ARMLEGv8.DataMem.Data[21] = 8'haa;
//    ARMLEGv8.DataMem.Data[22] = 8'haa;
//    ARMLEGv8.DataMem.Data[23] = 8'haa;
//    ARMLEGv8.DataMem.Data[5] = 8'haa;
//    ARMLEGv8.DataMem.Data[10] = 8'h55;
//    ARMLEGv8.DataMem.Data[40] = 8'haa;
//    ARMLEGv8.DataMem.Data[80] = 8'h55;

    $dumpfile("ARMLEGvtf.vcd");
    $dumpvars(0,ARMLEGvtf);
//    	pc_in = 0;
        #2
        reset = 1;
        #2;
        // $finish;
    end
endmodule