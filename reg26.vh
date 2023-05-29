module reg26(
    input [25:0]rin, clear, load, clock,
    output reg [25:0]rout
    );
    
    always @(posedge clock)
        if (clear)
            rout <= 0;
        else if (load)
            rout <= rin;
endmodule
