%{
#include <stdio.h> 

int printToken(char *type, char *token){
    if (token == NULL) printf("[%s]\n", type);
    else printf("%s:\t%s\n", type, token);
    return 0;
}
%}

delim [ \t\n]
ws {delim}+
letter [A-Za-z]
digit [0-9]
id {letter}({letter}|{digit})*
int {digit}+

%%

":="                                                        {printToken("TKN_ASSIGN", yytext);}
"+"                                                         {printToken("TKN_ADD", yytext);}
"-"                                                         {printToken("TKN_SUBTRACT", yytext);}
"*"                                                         {printToken("TKN_MULTIPLY", yytext);}
"/"                                                         {printToken("TKN_DIVIDE", yytext);}
"if"                                                        {printToken("TKN_IF", yytext);}
"repeat"                                                    {printToken("TKN_REPEAT", yytext);}
"else"                                                      {printToken("TKN_ELSE", yytext);}
"end"                                                       {printToken("TKN_END", yytext);}
"read"                                                      {printToken("TKN_READ", yytext);}
"write"                                                     {printToken("TKN_WRITE", yytext);}
"<"                                                         {printToken("TKN_LESS_THAN", yytext);}
">"                                                         {printToken("TKN_GREATER_THAN", yytext);}
"="                                                         {printToken("TKN_EQUAL", yytext);}
"("                                                         {printToken("TKN_LEFT_BRACKET", yytext);}
")"                                                         {printToken("TKN_RIGHT_BRACKET", yytext);}
";"                                                         {printToken("TKN_SEMICOLON", yytext);}
"then"                                                      {printToken("TKN_THEN", yytext);}
"until"                                                     {printToken("TKN_UNTIL", yytext);}

{int}                                                       {printToken("TKN_INTEGER", yytext);}      
{id}                                                        {printToken("TKN_IDENTIFIER", yytext);}
\{[^\}]*\}                                                  {printToken("TKN_COMMENT", yytext);}
{delim}                                                     {/*skip white space*/}

.                                                           {
                                                                char context[10] = {0};
                                                                int i;

                                                                context[0] = yytext[0];

                                                                for (i = 1; i < 10; i++) {
                                                                    int nextChar = input(); 
                                                                    if (nextChar != EOF) context[i] = nextChar;
                                                                     else context[i] = ' ';
                                                                }

                                                                printf("unknown token: '%s;\n", context);
                                                                exit(1);
                                                            }

%%



int main(){ 
    yylex(); 
    return 0;
}

int yywrap(){
    return 1; 
}
