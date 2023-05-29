module reg8(
    input [7:0]rin, clear, load, clock,
    output reg [7:0]rout
    );
    
    always @(posedge clock)
        if (clear)
            rout <= 0;
        else if (load)
            rout <= rin;
endmodule
