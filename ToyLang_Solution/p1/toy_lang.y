%token INTEGER VARIABLE PRINT START END DECIMAL
%left '+' '-'
%left '*' '/'
%{
 #include <stdio.h> 
 #include <stdlib.h>
 void yyerror(char *);
 int yylex(void);
 int sym[52];

 extern FILE *yyin;
%}
%%
program_structure: 
 START program_body
 |
 ;
program_body:
 program END {exit(0);}
 |
 ;
program:
 program statement '\n'
 |
 ;
statement:
 VARIABLE '=' expr { sym[$1] = $3; }
 | print_statement
 ;
print_statement:
 PRINT print_value  { printf("%d\n", $2); }
 |
 ;
print_value:
 INTEGER  { $$ = $1; }
 | DECIMAL { $$ = $1; }
 | VARIABLE  { $$ = sym[$1]; }
 ;
expr:
 INTEGER
 | DECIMAL
 | VARIABLE { $$ = sym[$1]; }
 | expr '+' expr { $$ = $1 + $3; }
 | expr '-' expr { $$ = $1 - $3; }
 | expr '*' expr { $$ = $1 * $3; }
 | expr '/' expr { $$ = $1 / $3; }
 | '(' expr ')' { $$ = $2; }
 ;
%%
void yyerror(char *s) {
 extern int yylineno;
 fprintf(stderr, "%s at line no: %d\n", s, yylineno-1);
 return 0;
}
int main(void) {
 yyparse();
 return 0;
} 