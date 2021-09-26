package q2;

import java.io.IOException;

public class ExceptionDemo {
    public static void main(String[] args) {

        try {
            throw new ExceptionA("ExceptionA");
        } catch (ExceptionA exceptionA) {
            exceptionA.printStackTrace();
        }

        try {
            throw new ExceptionB("ExceptionB");
        } catch (ExceptionB exceptionB) {
            exceptionB.printStackTrace();
        }

        try {
            throw new NullPointerException("NullPointerException");
        }catch (NullPointerException nullPointerException){
            nullPointerException.printStackTrace();
        }

        try {
            throw new IOException("IOException");
        }catch (IOException ioException){
            ioException.printStackTrace();
        }
    }
}
