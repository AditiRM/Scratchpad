%{
 #include <stdlib.h>
 void yyerror(char *);
 #include "y.tab.h"
%}

%option yylineno

%%
START {return START;}
END {return END;}
 /* variables */
[a-zA-Z] {
 yylval = *yytext - 'a';
 return VARIABLE;
 }
 /* integers */
[0-9]+ {
 yylval = atoi(yytext);
 return INTEGER;
 }
[0-9]+.[0-9]+ {
 yylval = atof(yytext);
 return DECIMAL;
 }
Print  { return PRINT;}
 /* operators */
[-+()=/*] { return *yytext; }
[\n] { 
 return *yytext;
 }
 /* skip whitespace */
[ \t] ;
 /* anything else is an error */
. yyerror("invalid character");
%%
int yywrap(void) {
 return 1;
} 