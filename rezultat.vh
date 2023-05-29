module rezultat(
       input [7:0] exp,
       input [23:0] mantisa,
       output [31:0] out
    );
    assign out = {mantisa[23], exp, mantisa[22:0]};
endmodule
