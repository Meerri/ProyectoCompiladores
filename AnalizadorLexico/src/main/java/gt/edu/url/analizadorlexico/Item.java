/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gt.edu.url.analizadorlexico;

/**
 *
 * @author Diego
 */
public class Item {
      private String Token;
    private String lexema;

    public Item(String Token, String lexema) {
        this.Token = Token;
        this.lexema = lexema;
    }
    
    public String getItem(){
        return "<" + this.Token +" , " + this.lexema + ">";
    }
    
}
