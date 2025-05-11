package Com.Controller;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.Document;
import com.itextpdf.text.html.simpleparser.HTMLWorker;
import com.itextpdf.text.pdf.PdfWriter;

@WebServlet("/DownloadPDFServlet")
public class DownloadPDFServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      try {
         // Set the content type and headers
         response.setContentType("application/pdf");
         response.setHeader("Content-disposition", "attachment; filename=order.pdf");

         // Create a PDF document
         Document document = new Document();
         PdfWriter.getInstance(document, response.getOutputStream());

         // Open the document
         document.open();

         // Create an HTMLWorker to convert HTML/CSS to PDF
         HTMLWorker htmlWorker = new HTMLWorker(document);
         String html = getJSPContent(); // Get the JSP content
         htmlWorker.parse(new StringReader(html));

         // Close the document
         document.close();
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   // Helper method to get the content of your JSP page
   private String getJSPContent() throws Exception {
      URL url = new URL("http://localhost:8080/Coza_Store/my_order.jsp"); // Replace with your JSP URL
      HttpURLConnection conn = (HttpURLConnection) url.openConnection();
      conn.setRequestMethod("GET");
      BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
      StringBuilder sb = new StringBuilder();
      String line;
      while ((line = reader.readLine()) != null) {
         sb.append(line);
      }
      reader.close();
      return sb.toString();
   }
}



