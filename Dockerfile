# Usamos la imagen base de Nginx
FROM nginx:latest

# Copiamos el archivo HTML al directorio de Nginx
COPY index.html /usr/share/nginx/html/

# Exponemos el puerto 80
EXPOSE 80

# Comando por defecto para ejecutar Nginx
CMD ["nginx", "-g", "daemon off;"]
