This folder contains example on running the clang static analyzer

To check available checkers:

clang -cc1 -analyzer-checker-help

To run a checker

clang -Xclang -analyze -Xclang -analyzer-checker=<checkername> example.c

or 

clang -cc1 -analyze -analyzer-checker=<checkername> example.c


Note:All checker names are mentioned in the example files
