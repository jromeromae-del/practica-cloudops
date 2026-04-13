
# 1. Usamos una imagen de Go ligera (Alpine)
FROM golang:1.26-alpine

# 2. Definimos el directorio de trabajo dentro del contenedor
WORKDIR /app

# 3. Copiamos los archivos de gestión de módulos y descargamos dependencias
COPY go.mod ./
RUN go mod download

# 4. Copiamos todo el contenido de nuestra carpeta 'miapp' al contenedor
COPY . .

# 5. Compilamos la aplicación
RUN go build -o app

# 6. Exponemos el puerto que usa Go (8080)
EXPOSE 8080

# 7. Comando para ejecutar la aplicación al arrancar el contenedor
CMD ["./app"]