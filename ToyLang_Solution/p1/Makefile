toy_lang:
	lex toy_lang.l
	yacc -d toy_lang.y
	clang++ -o toy_lang.out lex.yy.c y.tab.c -lfl
	
clean:
	rm *.yy.c ||:
	rm *.tab.* ||:
	rm *.out ||: