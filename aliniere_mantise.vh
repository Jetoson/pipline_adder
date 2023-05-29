module aliniere_mantise(
    input [23:0] mantisa1,
    input [23:0] mantisa2,
    input [8:0] valoare,
    output reg [23:0] out_m1,
    output reg [23:0] out_m2
    );
    reg [23:0] aux1;
    reg [23:0] aux2;
    
    always @(*) begin
        if(valoare[8] == 0) begin
            aux1[23] = mantisa1[23];
            aux1[22:0] = {1'b1, mantisa1[22:1]};
            aux1[22:0] = aux1[22:0] >> valoare[7:0];
            
            aux2[23] = mantisa2[23];
            aux2[22:0] = {1'b1, mantisa2[22:1]};
        end
        else begin
            aux2[23] = mantisa2[23];
            aux2[22:0] = {1'b1, mantisa2[22:1]};
            aux2[22:0] = aux2[22:0] >> valoare[7:0];
            
            aux1[23] = mantisa1[23];
            aux1[22:0] = {1'b1, mantisa1[22:1]};
        end
        
        if (aux1[22:0] > aux2[22:0]) begin
            // ma asigur ca prima mantisa este cea mai mare
            assign out_m1 = aux1;
            assign out_m2 = aux2;
        end
        else begin
            assign out_m1 = aux2;
            assign out_m2 = aux1;
        end
    end   
endmodule
