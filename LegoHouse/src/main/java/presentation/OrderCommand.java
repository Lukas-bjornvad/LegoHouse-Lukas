/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package presentation;

import logic.*;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lukas Bjørnvad
 */
public class OrderCommand extends Command{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       try{
        Calc k = new Calc();
        if(request.getParameter("height") != null && request.getParameter("width") != null && request.getParameter("length") != null ){
        int height =  Integer.parseInt(request.getParameter("height"));
        int width =  Integer.parseInt(request.getParameter("width"));
        int length =  Integer.parseInt(request.getParameter("length"));
        int[][] first = k.get(length, width, height, true);
        int[][] second = k.get(length, width, height, false);
        
        request.getSession().setAttribute("Info", first) ;
        request.getSession().setAttribute("Info2", second) ;
        }
       }catch(NumberFormatException | DataException e){
           e.printStackTrace();
       }
       request.getRequestDispatcher("/OrderDetails.jsp").forward(request, response);
    }
    
}
