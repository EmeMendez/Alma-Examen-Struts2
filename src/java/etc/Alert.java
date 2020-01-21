/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
alert alert-warning alert-dismissible fade show
 */
package etc;

/**
 *
 * @author Melón
 */
public class Alert {
    
    
    
    public static String getAlert(String tipo, String mensaje){
        return   "<div class='"+tipo+"' role=\"alert\">\n" +
                 "  '"+mensaje+"'\n" +
                 "  <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n" +
                 "    <span aria-hidden=\"true\">&times;</span>\n" +
                 "  </button>\n" +
                 "</div>";
                }
    

}
