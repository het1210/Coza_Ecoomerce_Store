import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import org.xhtmlrenderer.pdf.ITextRenderer;

import com.lowagie.text.DocumentException;

public class GenratePdf {
    public static void generatePDF(String inputHtmlPath, String outputPdfPath)
    {
        try {
            String url = new File(inputHtmlPath).toURI().toURL().toString();
            System.out.println("URL: " + url);

            OutputStream out = new FileOutputStream(outputPdfPath);

            //Flying Saucer part
            ITextRenderer renderer = new ITextRenderer();

            renderer.setDocument(url);
            renderer.layout();
            renderer.createPDF(out);
            out.close();
        }
        catch (DocumentException | IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }    
    public static void main(String[] args) {
            String inputFile = "D:\\D_HUSAIN\\Coza Store\\WebContent\\my-order.jsp";
            String outputFile = "C:\\Users\\My pc\\Downloads\\my-order.pdf";
            generatePDF(inputFile, outputFile);

            System.out.println("Done!");

    }

}