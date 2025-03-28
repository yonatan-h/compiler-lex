%{
#include <stdio.h> 
int integers = 0;
int fractions = 0;
%}

digit [0-9]
sign [+-]

%%
{sign}?{digit}+\.{digit}+                           { printf("detected frac %s\n", yytext); fractions++;}
{sign}?{digit}+                                     { printf("detected int %s\n", yytext); integers++;}
.                                                   {}
%%

int main(){ 
    yylex(); 
    printf("found %d integers\n", integers);
    printf("found %d fractions\n", fractions);
    
    return 0;
}

int yywrap(){
    return 1; 
}
