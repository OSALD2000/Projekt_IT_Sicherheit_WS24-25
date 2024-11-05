import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/upload_custom")
@MultipartConfig
public class UploadServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "uploads"; // Set the directory for uploads

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        StringBuilder fileNames = new StringBuilder();
        boolean uploaded = false;

        for (Part part : request.getParts()) {
            String fileName = part.getSubmittedFileName();
            if (fileName != null && !fileName.isEmpty()) {
                part.write(uploadPath + File.separator + fileName);
                fileNames.append(fileName).append(", ");
                uploaded = true;
                
            }
        }


        response.setContentType("text/html");
        response.getWriter().println("<h2>Datei hochgeladen: " + (uploaded ? fileNames.toString() : "Keine Datei hochgeladen.") + "</h2>");
        response.getWriter().println("<a href='http://localhost:8080/document_management/document_management'>Zurück</a>");
    }
}
