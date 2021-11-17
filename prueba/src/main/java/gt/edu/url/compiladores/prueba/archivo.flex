/* return new Symbol(sym.error); System.out.println("LEX: Encontré una clase"); */
/* Seccion 1 */
package gt.edu.url.compiladores.prueba;
import java_cup.runtime.Symbol; 

%%
%class Lexer
%line
%column
%cupsym sym
%cup

mayusculas=[A-Z]
miniscula =[a-z]
L=[a-zA-Z]
guion = "-" 
bara = " "
D=[0-9]+
espacio=[ ,\t,\r,\n]+
PUNTO = "."
comilla = "\"" 

/*COMA = ","*/
HACER = "hacer"
CLASE = "clase"
VERDADERO = "verdadero"
FALSO= "falso"
NULO= "nulo"
ENTERO= "entero"
REAL= "real"
BOOLEANO= "booleano"
CADENA= "cadena"
ESCRIBIR= "escribir"
LEER= "leer"
SI= "si"
SINO = "sino"
ENTONCES= "entonces"
DEVOLVER= "devolver"
DESDE="desde" 
MIENTRAS= "mientras"
INCREMENTAR= "incrementar"
DECREMENTAR= "decrementar"
EXTIENDE= "extiende"
PROPIEDADES= "propiedades"
METODOS= "metodos"
PUBLICAS= "publicas"
PUBLICOS= "publicos"
PRIVADAS = "privadas"
PRIVADOS = "privados"
INSTANCIAR = "instanciar"
ELIMINAR = "eliminar"
CONSTRUCTOR = "constructor"
DESTRUCTOR = "destructor"
INCLUIR = "incluir"
PRINCIPAL= "Principal"
ESTATICO= "estaticos"
OR= "OR"
CADENAAENTERO= "cadenaAEntero"
CADENAAREAL= "cadenaAReal"
CADENAABOOL= "cadenaAboleano"
SENO= "seno"
COSENO= "coseno"
TAN= "tangente"
LOG= "logaritmo"
RAIZ = "raiz"
PROTEGIDAS = "protegidas"
PROTEGIDOS = "protegidos"


%%
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/} 
"/*".* {/*Ignore*/}
.*"*/" {/*Ignore*/}

/* return new Symbol(sym.NUM, Integer.parseInt(yytext()));*/

{HACER} {return new Symbol(sym.HACER, yytext());}
{CLASE} { return new Symbol(sym.CLASE, yytext());}
"="     { return new Symbol(sym.IGUAL);}
{D} { return new Symbol(sym.NUMEROENTERO, Integer.parseInt(yytext()));}
{VERDADERO} {return new Symbol(sym.VERDADERO, yytext());}
/*{COMA} {return new Symbol(sym.COMA, yytext());}*/
{PROTEGIDAS} {return new Symbol(sym.PROTEGIDAS, yytext());}
{PROTEGIDOS} {return new Symbol(sym.PROTEGIDOS, yytext());}
{FALSO} {return new Symbol(sym.FALSO, yytext());}
{NULO} {return new Symbol(sym.NULO, yytext());}
{ENTERO} {return new Symbol(sym.ENTERO, yytext());}
{REAL}  {return new Symbol(sym.REAL, yytext());}
{BOOLEANO} {return new Symbol(sym.BOOLEANO, yytext());}
{CADENA} {return new Symbol(sym.CADENA, yytext());}
{ESCRIBIR} {return new Symbol(sym.ESCRIBIR, yytext());}
{LEER} {return new Symbol(sym.LEER, yytext());}
{SI} {return new Symbol(sym.SI, yytext());}
{SINO} {return new Symbol(sym.SINO, yytext());}
{ENTONCES} {return new Symbol(sym.ENTONCES, yytext());}
{DEVOLVER} {return new Symbol(sym.DEVOLVER, yytext());}
{DESDE} {return new Symbol(sym.DESDE, yytext());}
{MIENTRAS} {return new Symbol(sym.MIENTRAS, yytext());}
{INCREMENTAR} {return new Symbol(sym.INCREMENTAR, yytext());}
{DECREMENTAR} {return new Symbol(sym.DECREMENTAR, yytext());}
{EXTIENDE} {return new Symbol(sym.EXTIENDE, yytext());}
{PROPIEDADES} {return new Symbol(sym.PROPIEDADES, yytext());}
{METODOS} {return new Symbol(sym.METODOS, yytext());}
{PUBLICAS} {return new Symbol(sym.PUBLICAS, yytext());}
{PUBLICOS} {return new Symbol(sym.PUBLICOS, yytext());}
{PRIVADAS} {return new Symbol(sym.PRIVADAS, yytext());}
{PRIVADOS} {return new Symbol(sym.PRIVADOS, yytext());}
{INSTANCIAR} {return new Symbol(sym.INSTANCIAR, yytext());}
{ELIMINAR} {return new Symbol(sym.ELIMINAR, yytext());}
{CONSTRUCTOR} {return new Symbol(sym.CONSTRUCTOR, yytext());}
{DESTRUCTOR} {return new Symbol(sym.DESTRUCTOR, yytext());}
{INCLUIR} {return new Symbol(sym.INCLUIR, yytext());}
{PRINCIPAL} {return new Symbol(sym.PRINCIPAL, yytext());}
{ESTATICO} {return new Symbol(sym.ESTATICO, yytext());}
{OR} {return new Symbol(sym.OR, yytext());}
{CADENAAENTERO} {return new Symbol(sym.CADENAAENTERO, yytext());}
{CADENAAREAL} {return new Symbol(sym.CADENAAREAL, yytext());}
{CADENAABOOL} {return new Symbol(sym.CADENAABOOL, yytext());}
{SENO} {return new Symbol(sym.SENO, yytext());}
{COSENO} {return new Symbol(sym.COSENO, yytext());}
{TAN} {return new Symbol(sym.TAN, yytext());}
{LOG} {return new Symbol(sym.LOG, yytext());}
{RAIZ} {return new Symbol(sym.RAIZ, yytext());}
{PUNTO} {return new Symbol(sym.PUNTO, yytext());}
"+" {return new Symbol(sym.MAS);}
{comilla}({L} | {bara}|.)*{comilla} {return new Symbol(sym.TEXTO);}
"-" {return new Symbol(sym.MENOS);}
"*" {return new Symbol(sym.MULTIPLICACION);}
"," {return new Symbol(sym.COMA);}
"/" {return new Symbol(sym.DIVISION);}
"%" {return new Symbol(sym.DIVISIONMODULAR);}
"++" {return new Symbol(sym.INCREMENTO);}
"--" {return new Symbol(sym.DECREMENTO);}
"<" {return new Symbol(sym.MENORQUE);}
">" {return new Symbol(sym.MAYORQUE);}
"==" {return new Symbol(sym.COMPARACION);}
"!=" {return new Symbol(sym.DIFERENTE);}
":" {return new Symbol(sym.DOSPUNTOS);}
/*";" {return new Symbol(sym.FINLINEA);}*/
"(" {return new Symbol(sym.PARENTESISI);}
")" {return new Symbol(sym.PARENTESISF);}

{miniscula}({L}|{D}|{guion})* {return new Symbol(sym.IDENTIFICADOR, yytext());}
{mayusculas}({L}|{D}|{guion})* {return new Symbol(sym.IDENTIFICADORCLASE, yytext());}
 . {return new Symbol(sym.error);}