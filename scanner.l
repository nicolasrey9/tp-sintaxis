%{
#include <stdio.h>
#include "parser.tab.h"  /* Incluye los tokens generados por Bison */
%}

%%

[ \t\n]+                                               { /* No hacer nada */ }

"cter" {printf("CTER: %s\n", yytext); return CTER;}
"principal" {printf("PRINCIPAL: %s\n", yytext); return PRINCIPAL;}
"mientras" {printf("MIENTRAS: %s\n", yytext); return MIENTRAS;}
"cambiar" {printf("CAMBIAR: %s\n", yytext); return CAMBIAR;}
"devolver" {printf("DEVOLVER: %s\n", yytext); return DEVOLVER;}
"caso" {printf("CASO: %s\n", yytext); return CASO;}
"traducir" {printf("TRADUCIR: %s\n", yytext); return TRADUCIR;}
"romper" {printf("ROMPER: %s\n", yytext); return ROMPER;}
"mostrar" {printf("MOSTRAR: %s\n", yytext); return MOSTRAR;}

[aeiorsnmdchlbtg][aeiorsnmdchlbtg_]{0,15}  {printf("IDENTIFICADOR: %s\n", yytext); return IDENTIFICADOR;}
'[aeiorsnmdchlbtg]'                        {printf("CARACTER: %s\n", yytext); return CARACTER;}

"==" {printf("OPERADOR: %s\n", yytext); return OPERADOR;}
"!=" {printf("OPERADOR: %s\n", yytext); return OPERADOR;}
"="  {printf("ASIGNACION: %s\n", yytext); return ASIGNACION;}

"!" {printf("FINSENTENCIA: %s\n", yytext); return FINSENTENCIA;}
"[" {printf("DELIMITADORIZQ: %s\n", yytext); return DELIMITADORIZQ;}
"]" {printf("DELIMITADORDER: %s\n", yytext); return DELIMITADORDER;}

%%

int yywrap() {
    return 1;
}
