#Używamy dystrybucji i paczki Alpine z Dockerhub
FROM alpine:latest
#Instalacja niezbędnych pakietów
RUN apk add --no-cache nginx mysql mysql-client openrc bash
#Tworzenie nowego użytkownika
RUN adduser -D -g 'www' www
#Tworzenie katalogu dla nginx
RUN mkdir /www && \
    mkdir -p /run/nginx
#Dodawanie pliku index.html
COPY index.html /www/index.html
#Konfiguracja nginx
COPY nginx.conf /etc/nginx/nginx.conf
#Automatyczne uruchamianie
RUN rc-update add nginx default && \
    rc-update add mariadb default
#Kopiowanie i nadawanie uprawnień do skryptów startowych
COPY start.sh /start.sh
RUN chmod +x /start.sh
#Otwieranie portów
EXPOSE 80 3306
#Uruchomienie skryptu startowego przy starcie kontenera
CMD ["/start.sh"]
