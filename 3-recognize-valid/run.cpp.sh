#! /bin/bash
flex lexer.l && gcc lex.yy.c -o lexer -ll && ./lexer < input.cpp