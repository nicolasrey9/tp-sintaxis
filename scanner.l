%{
/* Codigo C incluido en el encabezado del archivo generado */
#include <stdio.h>
%}

%%
[ \t\n]+                                               { /* No hacer nada */ }

cter|principal|mientras|cambiar|devolver|caso|traducir {printf("PALABRA RESERVADA: %s\n", yytext);}

[aeiorsnmdchlbtg][aeiorsnmdchlbtg_]{0,15}              {printf("IDENTIFICADOR: %s\n", yytext);}  /* Identificadores */

==|!=|=                                                {printf("OPERADOR: %s\n", yytext);}   /*Operadores */ 

[! \ [ \]]                                             {printf("DELIMITADOR: %s\n", yytext);}

'[aeiorsnmdchlbtg]'                                    {printf("CARACTER: %s\n", yytext);}
%%


int main(int argc, char **argv) {
    yylex();  /* Llama al analizador lexico generado */
    return 0;
}

int yywrap() {
    return 1;
}
