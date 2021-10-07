/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.loop;

import java.util.Scanner;

/**
 *
 * @author User
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Scanner leer = new Scanner(System.in);
        String cadena;
        String condicion[]={"if","else"};
        String declaracion[]={"Clase"," "};
        String operando[]={"+","-"};
        String division[];
        int tamano=0;
        int cont=0;

        System.out.println("Ingrese una frase");
        cadena=leer.nextLine();
        division=cadena.split(" ");
        tamano=division.length;

       
        for (int i = 0; i < tamano; i++) {
            //System.out.println(division[i]);
            for (int j = 0; j < condicion.length; j++) {
               if(division[i].equals(condicion[j])){
                System.out.println(division[i]+" es condicion");
                break;
            }else if(division[i].equals(declaracion[j])){
                System.out.println(division[i]+" es declaracion");
                break;
            }else if(division[i].equals(operando[j])){
                System.out.println(division[i]+" es operando");
                break;
            }     
            } 
            }    
        }
        
    }

    

