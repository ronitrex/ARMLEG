`timescale 1ns / 1ps
`include "ARMLEG.v"
`include "Clock.v"


module ARMLEGvtf;
    wire CLOCK;
    reg RESET;
    

    Clock clock(CLOCK);

    ARMLEG ARMLEGv8(CLOCK, RESET);


    always @ ( RESET ) begin
      #1;
      RESET = ~RESET;
    end

    initial
    begin
	$dumpfile("ARMLEGvtf.vcd");
    $dumpvars(0,ARMLEGvtf);
        #5
        RESET = 1;
        #5;
        // $finish;
    end
endmodule