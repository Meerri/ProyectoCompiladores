package gt.edu.url.analizadorlexico;
import static gt.edu.url.analizadorlexico.Tokens.*;
%%

%class Lexer
%type Tokens
%line
%cup
mayusculas=[A-Z]
miniscula =[a-z]
L=[a-zA-Z_]+
bara = " "
D=[0-9]+
espacio=[ ,\t,\r,\n]+
punto= "."
comilla = "\"" 

%{
    public String lexeme;
%}

%%
verdadero {lexeme=yytext(); return VERDADERO;}
falso {lexeme=yytext(); return FALSO;}
nulo {lexeme=yytext(); return NULO;}
entero {lexeme=yytext(); return ENTERO;}
boleano {lexeme=yytext(); return BOLEANO;}
cadena {lexeme=yytext(); return CADENA;}
escribir {lexeme=yytext(); return ESCRIBIR;}
leer {lexeme=yytext(); return LEER;}
si {lexeme=yytext(); return SI;}
entonces {lexeme=yytext(); return ENTONCES;}
devolver {lexeme=yytext(); return DEVOLVER;}
desde {lexeme=yytext(); return DESDE;}
mientras {lexeme=yytext(); return MIENTRAS;}
incrementar {lexeme=yytext(); return INCREMENTAR;}
decrementar {lexeme=yytext(); return DECREMENTAR;}
hacer {lexeme=yytext(); return HACER;}
clase {lexeme=yytext(); return CLASE;}
extiende {lexeme=yytext(); return EXTIENDE;}
propiedades {lexeme=yytext(); return PROPIEDADES;}
metodos {lexeme=yytext(); return METODOS;}
publicas {lexeme=yytext(); return PUBLICAS;}
publicos {lexeme=yytext(); return PUBLICOS;}
privadas {lexeme=yytext(); return PRIVADAS;}
privados {lexeme=yytext(); return PRIVADOS;}
instanciar {lexeme=yytext(); return INSTANCIAR;}
eliminar {lexeme=yytext(); return ELIMINAR;}
constructor {lexeme=yytext(); return CONSTRUCTOR;}
destructor {lexeme=yytext(); return DESTRUCTOR;}
incluir {lexeme=yytext(); return INCLUIR;}
principal {lexeme=yytext(); return PRINCIPAL;}
estaticos {lexeme=yytext(); return ESTATICO;}
AND {lexeme=yytext(); return AND;}
OR {lexeme=yytext(); return OR;}
cadenaAEntero {lexeme=yytext(); return CADENAENTERO;}
cadenaAReal {lexeme=yytext(); return CADENAREAL;}
cadenaAboleano {lexeme=yytext(); return CADENABOOL;}
seno {lexeme=yytext(); return SENO;}
coseno {lexeme=yytext(); return COSENO;}
tangente {lexeme=yytext(); return TANGENTE;}
logaritmo {lexeme=yytext(); return LOG;}
raiz {lexeme=yytext(); return RAIZ;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/} 
"/*".* {/*Ignore*/}
.*"*/" {/*Ignore*/}
"=" {return IGUAL;}
"+" {return MAS;}
{comilla}({L} | {bara})*{comilla} {return TEXTO;}
"-" {return MENOS;}
"*" {return MULTIPLICACION;}
"/" {return DIVICION;}
"%" {return DIVICIONMODULAR;}
"++" {return INCREMENTO;}
"--" {return DECREMENTO;}
"<" {return MENORQUE;}
">" {return MAYORQUE;}
"==" {return COMPARACION;}
"!=" {return DIFERENTE;}
"#" {return NUMERAL;}
"$" {return DOLAR;}
":" {return DOSPUNTOS;}
";" {return FINLINEA;}
"," {return COMA;}
"(" {return PARENTESISI;}
")" {return PARENTESISF;}
"[" {return CORCHETEI;}
"]" {return CORCHETEF;}
"{" {return LLAVEI;}
"}" {return LLAVEF;}
{miniscula}({L}|{D})* {lexeme=yytext(); return IDENTIFICADOR;}
{mayusculas}({L}|{D})* {lexeme=yytext(); return IDENTIFICADORCLASE;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return NUMEROENTERO;}
("(-"{D}+")")|{D}+{punto}("(-"{D}+")")|{D}+ {lexeme=yytext(); return NUMEROREAL;}
 . {return ERROR;}

