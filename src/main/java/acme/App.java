package acme;

import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.Scanner;

import org.joda.time.DateTime;


/**
 * Hello world!
 */
public class App 
{
    public static void main( String[] args ) throws IOException
    {
        DateTime d = new DateTime(new java.util.Date());  
        System.err.println("Hello World (at " + d.toString() + ")!");
        
        for (String path: Arrays.asList("/samples/1.csv", "/hello.txt")) {
            System.err.printf(" -- classpath:%s -- %n", path);
            try (Scanner in = new Scanner(App.class.getResourceAsStream(path))) {
                while (in.hasNextLine())
                    System.err.println(in.nextLine());
            }
        }
    }
}
