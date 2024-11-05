<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Dokumentenmanagement-System</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            padding: 20px;
        }
        .upload-container {
            margin-bottom: 30px;
        }
        .document-list {
            margin-top: 20px;
        }
    </style>
</head>

<body>
    <div class="container">
        <h2>Dokumentenmanagement-System</h2>
        
        <div class="upload-container">
            <h4>Datei hochladen</h4>
            <form action="upload_custom" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="file">Wähle eine Datei:</label>
                    <input type="file" id="file" name="file" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary">Hochladen</button>
            </form>
        </div>

        <div class="document-list">
            <h4>Hochgeladene Dokumente</h4>
            <ul class="list-group">
            </ul>
        </div>
    </div>
</body>
</html>
