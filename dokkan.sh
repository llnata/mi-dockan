#!/bin/bash

# Nombre de la imagen y el contenedor
IMAGE_NAME="proyecto-apache"
CONTAINER_NAME="contenedor-apache"

# Función para construir la imagen
build_image() {
    echo "Construyendo la imagen Docker..."
    docker build -t $IMAGE_NAME .
    echo "Imagen construida: $IMAGE_NAME"
}

# Función para ejecutar el contenedor
run_container() {
    echo "Ejecutando el contenedor..."
    docker run -d --name $CONTAINER_NAME -p 8080:80 $IMAGE_NAME
    echo "Contenedor ejecutándose en http://localhost:8080"
}

# Función para detener el contenedor
stop_container() {
    echo "Deteniendo el contenedor..."
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
    echo "Contenedor detenido y eliminado."
}

# Función para limpiar la imagen
clean_image() {
    echo "Eliminando la imagen Docker..."
    docker rmi $IMAGE_NAME
    echo "Imagen eliminada: $IMAGE_NAME"
}

# Menú de opciones
echo "Seleccione una opción:"
echo "1. Construir la imagen"
echo "2. Ejecutar el contenedor"
echo "3. Detener el contenedor"
echo "4. Limpiar la imagen"
echo "5. Salir"
read -p "Opción: " OPTION

case $OPTION in
    1)
        build_image
        ;;
    2)
        run_container
        ;;
    3)
        stop_container
        ;;
    4)
        clean_image
        ;;
    5)
        echo "Saliendo..."
        ;;
    *)
        echo "Opción no válida."
        ;;
esac
