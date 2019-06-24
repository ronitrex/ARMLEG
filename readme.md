# ARM-LEGv8 simulator

A pipelined ARM LEGv8 CPU written in Verilog.

LEGv8 is subset of ARM instruction set.

Supported instructions include: LDUR, STUR, ADD, SUB, ORR, AND	, B

For a brief introduction to what this project is all about and how different modules work, please look at the slides [here.](http://harmanani.github.io/classes/csc320/Notes/ch04.pdf)

To summarize, the full datapath without pipelining looks like :
![](https://github.com/ronitrex/ARMLEG/blob/master/readme/FullDataPath.png)

With introduction of pipeline :

![](https://github.com/ronitrex/ARMLEG/blob/master/readme/DataPathwControl.png)


# Running :

The project was developed on Eclipse Platform using the Sigasi plugin. GTKWave was used to study the wave outputs. Once [iverilog](http://iverilog.icarus.com/) and [gtkwave](http://gtkwave.sourceforge.net/) are installed, run the following commands to execute the simulator and see the wave output file :	

	iverilog -o ARMLEG ARMLEGvtf.v
	vvp ARMLEG
	gtkwave ARMLEGvtf.vcd




