digits [0-9]+
exp ([Ee](\+|\-)?{digits})
blanks [ \t\n]+
float_qual [fFlL]

%%

{digits}{exp}{float_qual}?/{blanks}    {printf("float no fraction:%s\n",yytext);}
[0-9]*\.{digits}{exp}?{float_qual}?/{blanks}    {printf("float with optional integer part :%s\n",yytext);}
{digits}\.[0-9]*{exp}?{float_qual}?/{blanks}    {printf("float with optional fraction:%s\n",yytext);}
.|\n;

%%

yywrap(){} 

int main(){
    yylex();
}