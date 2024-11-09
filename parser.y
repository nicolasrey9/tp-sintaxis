%{
#include <stdio.h>
#include <stdlib.h>
extern FILE * yyin;
int yylex();  /* Declaración de yylex */
void yyerror(const char *s);
extern char *yytext;
%}

%token CTER PRINCIPAL CAMBIAR DEVOLVER TRADUCIR MIENTRAS CASO ROMPER MOSTRAR
%token IDENTIFICADOR CARACTER OPERADOR ASIGNACION FINSENTENCIA DELIMITADORIZQ DELIMITADORDER

%%

programa: PRINCIPAL DELIMITADORIZQ sentencias DELIMITADORDER;

sentencias: sentencia
    | sentencia sentencias;

sentencia: inicio_sentencia
    | inicio_sentencia FINSENTENCIA;

inicio_sentencia: mientras
    | traducir
    | cambiar
    | caso
    | declarar
    | asignacion
    | mostrar
    | devolver;

mientras: MIENTRAS condicion DELIMITADORIZQ sentencias DELIMITADORDER;

condicion: IDENTIFICADOR OPERADOR CARACTER;

traducir: TRADUCIR IDENTIFICADOR;

cambiar: CAMBIAR IDENTIFICADOR DELIMITADORIZQ casos DELIMITADORDER;

casos: caso 
    | caso casos;

caso: CASO CARACTER FINSENTENCIA sentencias romper;

romper: ROMPER FINSENTENCIA;

declarar: CTER IDENTIFICADOR ASIGNACION CARACTER FINSENTENCIA
    | CTER IDENTIFICADOR FINSENTENCIA;

asignacion: IDENTIFICADOR ASIGNACION CARACTER FINSENTENCIA;

mostrar: MOSTRAR lista_caracteres;

lista_caracteres: CARACTER lista_caracteres
    | CARACTER;

devolver: DEVOLVER IDENTIFICADOR FINSENTENCIA
    | DEVOLVER CARACTER FINSENTENCIA;

%%


int main(int argc, char **argv) {
    // Verifica si se pasó un archivo como argumento
    if (argc < 2) {
        fprintf(stderr, "Uso: %s <archivo>\n", argv[0]);
        return 1;
    }
    
    yyin = fopen(argv[1], "r");
    if (!yyin) {
        perror("Error al abrir el archivo");
        return 1;
    }
    
    if (yyparse() == 0) {  // 0 significa éxito en la parsificación
        printf("¡Buen fin! El archivo se ha procesado correctamente.\n");
    } else {
        printf("Hubo un error de sintaxis en el archivo.\n");
    }
    
    fclose(yyin);
    return 0;
}


void yyerror(const char *s) {
    //fprintf(stderr, "Error: %s\n", s);
    fprintf(stderr, "Error: %s, en '%s'\n", s, yytext);
}
