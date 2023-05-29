module reg24(
    input [23:0]rin, clear, load, clock,
    output reg [23:0]rout
    );
    
    always @(posedge clock)
        if (clear)
            rout <= 0;
        else if (load)
            rout <= rin;
endmodule
