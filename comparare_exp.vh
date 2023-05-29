module comparare_exp(
    input [7:0]exp1,
    input [7:0] exp2,
    output [8:0]valoare,
    output reg[7:0] exp
    );
    reg [8:0] aux;
    always @(*) begin
        if(exp1 > exp2) begin
            // mantisa pentru cel de al doilea numar trebuie deplasata
            aux[8] = 1; //mantisa celui de al doilea numar trebuie deplasata la dreapta
            aux[7:0] = exp1 - exp2;
            assign exp = exp1;
        end
        else begin
            // mantisa pentru primul numar trebuie deplasata
            aux[8] = 0; //mantisa celui de al doilea numar trebuie deplasata la dreapta
            aux[7:0] = exp2 - exp1;
            assign exp = exp2;
        end      
    end
    assign valoare = aux;
endmodule
