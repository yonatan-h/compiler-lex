%{
#include <stdio.h> 
int consonants = 0;
int vowels = 0;
%}

%%
[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ]       {consonants+=1;}
[aeiouAEIOU]                                        {vowels++;}
.                                                   {printf("unknown char '%s'\n", yytext);}
%%

int main(){ 
    yylex(); 
    printf("found %d consonants\n", consonants);
    printf("found %d vowels\n", vowels);
    
    return 0;
}

int yywrap(){
    return 1; 
}
