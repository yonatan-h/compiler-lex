%{
#include <stdio.h> 

//Would rather be in third section, but shows an 'implicitly declared' warning
int printToken(char *type, char *token){
    printf("'%s'\t[%s]\n", token, type);
    return 0;
}
%}

delim [ \t\n]
ws {delim}+
letter [A-Za-z]
digit [0-9]
id {letter}({letter}|{digit})*
number [+-]?{digit}+(\.{digit}+)?(E[+\-]?{digit}+)?
keyword "public"|"class"|"private"|"void"|"static"|"float"|"if"|"struct"|"for"|"interface"|"implements"|"boolean"|"int"|"double"|"else"|"return"    

%%
{keyword}                                                   {/* all lang keywords*/printToken("keyword", yytext);}

{id}                                                        {/*java related*/printToken("identifier", yytext);}
[{]                                                         {printToken("left curly", yytext);}
[}]                                                         {printToken("right curly", yytext);}
[\[]                                                        {printToken("left square", yytext);}
[\]]                                                        {printToken("right square", yytext);}
[\(]                                                        {printToken("left bracket", yytext);}
[\)]                                                        {printToken("right bracket", yytext);}
;                                                           {printToken("semicolon", yytext);}
{number}                                                    {printToken("number", yytext);}
"="                                                         {printToken("equals", yytext);}
">"                                                         {printToken("(relational operator) greater", yytext);}
"<"                                                         {printToken("(relational operator) less", yytext);}
"<="                                                        {printToken("(relational operator) less or equal", yytext);}
">="                                                        {printToken("(relational operator) greater or equal", yytext);}
"=="                                                        {printToken("(relational operator) equality", yytext);}
"&&"                                                        {printToken("(logical operator) and", yytext);}
"||"                                                        {printToken("(logical operator) or", yytext);}
"//".*                                                      {printToken("one line comment", yytext);}
\/\*([^\*]|(\*+[^\/]))*\*\/                                   {printToken("multi line comment", yytext);}
{ws}                                                        {/*skip white space*/}
\.                                                          {printToken("dot operator", yytext);}
\".+\"                                                      {printToken("string", yytext);}
'.'                                                         {printToken("character", yytext);}
[\+\-\*\/]                                                  {printToken("arithmetic operation", yytext);}

#{letter}*                                                  {/*c related*/ printToken("preprocessor directive", yytext);}
\<\s*[a-zA-Z0-9_.+-]+\.h\s*\>                               {printToken("header file", yytext);}
,                                                           {printToken("delimiter", yytext);}
\[\]                                                        {printToken("array declaration", yytext);}


\<\s*[a-zA-Z0-9_.+-]+\s*\>                                  {/*cpp relatd*/printToken("header file", yytext);}
\<\<                                                        {printToken("overload operator", yytext);}
\:\:                                                        {printToken("scope resolution operator", yytext);}

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
