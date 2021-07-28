
%%

[A-Z]+ {ECHO; printf("\n");}

.|\n ;

%%

yywrap(){}

main(){yylex();}
