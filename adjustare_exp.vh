module ajustare_exp(
    input [7:0] exp,
    input [8:0] valoare,
    output [7:0] exp_out
    );
    reg [7:0]aux; 
       
    always @ (*) begin
        if (valoare[8] == 0) begin // depasire superioara
            aux = exp + 1;
        end
        else begin
            aux = exp - valoare[7:0];
        end
    end 
    assign exp_out = aux;       
endmodule
