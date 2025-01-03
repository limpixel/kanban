# Menggunakan image nginx sebagai server
FROM nginx:alpine

# Copy file website ke direktori default nginx
COPY . /usr/share/nginx/html
