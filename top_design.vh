module top_design(
    input clk,
    input load,
    input reset,
    input op,
    input [31:0] numar1,
    input [31:0] numar2,
    output [31:0] numar
    );
     
    wire [7:0] exp_1;
    wire [7:0] exp_2;
    wire [7:0] exp_3;
    wire [7:0] exp_1pipe;
    wire [7:0] exp_2pipe;
    wire [23:0] mantisa1_1; 
    wire [23:0] mantisa2_1;
    wire [23:0] mantisa1_1pipe; 
    wire [23:0] mantisa2_1pipe;
    wire [25:0] mantisa_2;
    wire [25:0] mantisa_2pipe;
    wire [23:0] mantisa_3;
    wire [8:0] valoare1;
    wire [8:0] valoare2;  
    
    // se compara exponentii si se intoarce cel mai mare exponent
    comparare_exp pas1(numar1[30:23], numar2[30:23], valoare1, exp_1);
    reg8 reg1_e(exp_1, reset, load, clk, exp_1pipe);
    
    // se aliniaza mantisele
    aliniere_mantise pas2({numar1[31], numar1[22:0]}, {numar2[31], numar2[22:0]}, valoare1, mantisa1_1, mantisa2_1);
    reg24 reg1_m(mantisa1_1, reset, load, clk, mantisa1_1pipe);
    reg24 reg2_m(mantisa2_1, reset, load, clk, mantisa2_1pipe);
    
    // se realizeaza operatia necesara asupra mantiselor
    op_mantise pas3(op, mantisa1_1pipe, mantisa2_1pipe, mantisa_2);
    reg26 reg3_m(mantisa_2, reset, load, clk, mantisa_2pipe);
    reg8 reg2_e(exp_1pipe, reset, load, clk, exp_2pipe);
    
    // normalizarea mantiselor
    normalizare pas4(mantisa_2pipe, valoare2, mantisa_3);
    ajustare_exp pas5(exp_2pipe, valoare2, exp_3);
    
    // concatenarea semnului, a exponentului si a mantisei
    rezultat rez(exp_3, mantisa_3, numar);    
endmodule
