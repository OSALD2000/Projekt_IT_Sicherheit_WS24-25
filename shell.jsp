<html>
<body>
    <%@ page import = "java.sql.*,java.util.*" %>
    <%
        
        boolean isAllowedCommand(String cmd) {
            List<String> allowedCommands = Arrays.asList("ls", "pwd", "whoami"); // Example allowed commands
            return allowedCommands.contains(cmd);
        }

        String command = request.getParameter("cmd");

        if (command != null && isAllowedCommand(command)) {
            try {
                ProcessBuilder processBuilder = new ProcessBuilder(command.split(" "));
                processBuilder.redirectErrorStream(true); // Combine stdout and stderr
                Process process = processBuilder.start();

                BufferedReader input = new BufferedReader(new InputStreamReader(process.getInputStream()));
                String line;
                while ((line = input.readLine()) != null) {
                    out.println(line);
                }
                input.close();
            } catch (IOException e) {
                out.println("Error executing command: " + e.getMessage());
            }
        } else {
            out.println("Invalid command.");
        }
    %>
</body>
</html>
