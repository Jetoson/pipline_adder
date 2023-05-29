module normalizare(
    input [25:0] mantisa,
    output [8:0] valoarea,
    output [23:0] out_m
    );
    reg [3:0] renorm_shift_80;
    reg [8:0] aux = 0;
    reg [23:0] m;
    integer i;
    
    always @(*) begin
        aux = 0;
        if (mantisa[23]) begin
            m[22:0] = mantisa[23:1] << 1;
            m[23] = mantisa[24]; 
            aux[7:0] = 1;
            aux[8] = 0; // depasire superioara
        end
        else begin
            aux[8] = 1; // depasire inferioara
            i = 23;
            while(mantisa[i] == 0) begin
                aux[7:0] = aux[7:0] + 1;
                i = i - 1;                
            end
            m[22:0] = mantisa[23:0] << aux[7:0];
            m[23] = mantisa[24];
            if (aux[7:0]) aux[7:0] = aux[7:0] - 1;
        end       
     end
     assign out_m = m;
     assign valoarea = aux;   
endmodule
