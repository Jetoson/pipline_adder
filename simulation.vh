`timescale 1ns / 1ps

module testbench;

    reg clk;
    reg load;
    reg reset;
    reg op;
    reg [31:0] numar1;
    reg [31:0] numar2;
    wire [31:0] numar;

    initial begin
        // initialize the inputs
        clk = 0;
        load = 0;
        reset = 0;
        op = 0;
        numar1 = 32'b0;
        numar2 = 32'b0;

        // Apply reset
        reset = 1;
        #10;
        reset = 0;
        #10;

        // Apply load
        load = 1;
        numar1 = 32'h3F800000; // Floating point representation of 1.0
        numar2 = 32'h40000000; // Floating point representation of 2.0
        #10;
        load = 0;
        #10;

        // change operation
        op = 1;
        #10;
        // Apply new inputs
        load = 1;
        numar1 = 32'h40800000; // Floating point representation of 4.0
        numar2 = 32'h40A00000; // Floating point representation of 5.0
        #10;
        load = 0;

        #10 $finish; // End the simulation
    end

    // Generate the clock signal
    always #5 clk = ~clk;

    // Instantiate the module under test
    top_design UUT (
        .clk(clk),
        .load(load),
        .reset(reset),
        .op(op),
        .numar1(numar1),
        .numar2(numar2),
        .numar(numar)
    );

endmodule
