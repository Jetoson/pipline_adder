module op_mantise(
    input op,
    input [23:0] mantisa1,
    input [23:0] mantisa2,
    output [25:0] out
    );
   reg [25:0]aux;
   reg semn1;
   reg semn2;
   always @ * begin
    semn1 = mantisa1[23];
    semn2 = mantisa2[23];
    if(op == 0) // cele 2 mantise trebuie sa fie adunate
        if (semn1 == semn2)
            aux[23:0] = mantisa1[22:0] + mantisa2[22:0];
       else
            aux[23:0] = mantisa1[22:0] - mantisa2[22:0];
    else if (op == 1)// cele 2 mantise trebuie sa fie scazute
        if (semn1 == semn2)
             aux[23:0] = mantisa1[22:0] - mantisa2[22:0];
         else
            aux[23:0] = mantisa1[22:0] + mantisa2[22:0];
    if( aux[23:0] != 0) // mantisa nu este 0
            aux[25] = 0;
        else // mantisa este 0
            aux[25] = 1;
     aux[24] = semn1; // semnul mantisei rezultat va fi semntul primei mantise
                      // despre care stim ca este mai mare
                      
   end
    assign out = aux[25:0];
endmodule
