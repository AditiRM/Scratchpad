%{
FILE *declfile;
%}

blanks [ \t]*
letter [a-z]
digit [0-9]
id ({letter}|_)({letter}|{digit}|_)*
number {digit}+
arraydeclpart {id}"["{number}"]"
declpart ({arraydeclpart}|{id})
decllist ({declpart}{blanks}","{blanks})*{blanks}{declpart}{blanks}
declaration (("int")|("float")){blanks}{decllist}{blanks};

%%
{declaration} fprintf(declfile,"%s\n",yytext);
%%

yywrap(){
fclose(declfile);
printf("Closing");
}

main(){
declfile = fopen("declfile","w");
yylex();
}