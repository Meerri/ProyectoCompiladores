/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gt.edu.url.analizadorlexico;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Diego
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
    //lista para guardar los tokens
        LinkedList<Item> lista = new LinkedList<Item>();
    //revisar si exite algun argumento
        if (args.length != 0) {
            try {
                //se guarda el archivo en lector para ser pasado al analizador
                Reader lector = new BufferedReader(new FileReader(args[0].toString()));
                //Lexer es la clase del analizador lexico que revisara el archivo de lector
                Lexer lexer = new Lexer(lector);
                // se analizara cada token hasta que el archivo este vacio
                while (true) {
                    Tokens tokens = lexer.yylex();
                    
                    if (tokens == null) {
                        // se acabaron los tokes y se guardaran en el archivo de salida
                        File archivo = new File("salida.txt");
                        PrintWriter escribir = new PrintWriter(archivo);
                        for (int i = 0; i < lista.size(); i++) {
                            escribir.print(lista.get(i).getItem() + "\n ");
                        }
                        escribir.close();
                        System.out.println("ANALISIS EXITO, ARCHIVO DE SALIDA CREADO");
                        return;
                    }
                    
                    if (tokens == Tokens.ERROR) {
                        System.out.println("ERROR " + "TOKEN: " + lexer.yytext() + " NO ES VALIDO PARA EL LENGUAJE");
                        return;
                    } else {
                        Item elemento = new Item(tokens.name(), lexer.yytext());
                        lista.add(elemento);
                    }
                }

            } catch (FileNotFoundException ex) {
                Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            System.out.println("SE TIENE QUE AGREGAR LA RUTA DE ALGUN ARCHIVO");
        }
    }

}
