/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logic;



/**
 *
 * @author Lukas Bjørnvad
 */
public class Calc {

    int length;
    int width;
    int height;
    public int[][] get(int length, int width, int height, boolean first) throws DataException{
        this.height = height;
        this.width = width;
        this.length = length;
       int[][] l ;
       if(length <=4 || width<=4 || height<=0)throw new DataException();
           // int[][] arr;
            if(first){
              l=calcList(length, width-4);
            }else{
              l=(calcList(length-4, width));   
            } 
//          if(i>0)System.out.println("");
//          for(int j =0; j<arr.length+1; j++){         
//          System.out.print(arr[0][j] + " ");
//          System.out.print(arr[1][j] + " ");
//          System.out.print(arr[2][j]);
//          System.out.println();}
        
       return l;
    }
             
    private int[][] calcList(int length, int width) {
        int array[][] = new int[3][4];
        int fbloksl = length / 4;
        int fbloksw = width / 4;
        array[0][0] = fbloksl;
        array[0][2] = fbloksl;
        array[0][1] = fbloksw;
        array[0][3] = fbloksw;
        array = fill(array, length, width);  
        return array;
        
    }
    
    private int[][] fill(int[][] array, int length, int width ){
        switch (width % 4) {
            case 1:
                array[2][1] = 1;
                array[2][3] = 1;
                break;
            case 2:
                array[1][1] = 1;
                array[1][3] = 1;
                break;
            case 3:
                array[1][1] = 1;
                array[1][3] = 1;
                array[2][1] = 1;
                array[2][3] = 1;
                break;
            default:
                break;
        }
        
        switch (length % 4) {
            case 1:
                array[2][0] = 1;
                array[2][2] = 1;
                break;
            case 2:
                array[1][0] = 1;
                array[1][2] = 1;
                break;
            case 3:
                array[1][0] = 1;
                array[1][2] = 1;
                array[2][0] = 1;
                array[2][2] = 1;
                break;
            default:
                break;
        }  return array;
    }

    @Override
    public String toString() {
        return  length + ","+ width + "," + height ;
    }
 
}
