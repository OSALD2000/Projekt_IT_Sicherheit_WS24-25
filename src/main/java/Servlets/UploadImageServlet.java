package Servlets;

import Model.User;

import java.io.IOException;
import java.io.File;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class UploadImageServlet extends HttpServlet
{

    private static final String UPLOAD_DIR = "images";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        User user = (User) request.getSession().getAttribute("loggedUser");

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        boolean uploaded = false;

        for (Part part : request.getParts()) {
            String fileName = user.getId() + "_" + part.getSubmittedFileName();
            if (!fileName.matches(".*\\.(jpg|jpeg|gif|png|bmp|tiff)$")) {
                continue;
            }

            if (fileName != null && !fileName.isEmpty()) {
                if (!user.getProfileImage().equals("non.jpg")) {
                    File oldFile = new File(uploadPath + File.separator + user.getProfileImage());
                    oldFile.delete();
                }

                user.setProfileImage(fileName);
                part.write(uploadPath + File.separator + fileName);
                uploaded = true;
            }
        }

        if (uploaded) {
            response.sendRedirect("profile.jsp");
        } else {
            response.sendRedirect("profile.jsp?message=upload failed");
        }
    }
}
