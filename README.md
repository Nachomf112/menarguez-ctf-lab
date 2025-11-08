# Menarguez CTF Lab

Plataforma de **Capture The Flag (CTF)** basada en CTFd, preparada para practicar
ciberseguridad ofensiva y defensiva en local mediante contenedores Docker.

## Características

- Desplegada con **Docker** y **docker-compose**.
- Basada en el framework **CTFd**.
- Scripts de automatización para:
  - Preparar el entorno (`prepare.sh`).
  - Personalizar la instancia (`personalizar_ctfd.sh`).
  - Poblar la base de datos con retos de ejemplo (`populate.py`).
- Soporte para base de datos MySQL/MariaDB.
- Ideal para:
  - Practicar retos de CTF en solitario.
  - Montar pequeños laboratorios para amigos o alumnos.
  - Probar ideas de **Blue Team / Red Team**.

## Requisitos

- Docker
- docker-compose
- 4 GB de RAM recomendados

## Puesta en marcha rápida

```bash
git clone https://github.com/Nachomf112/menarguez-ctf-lab.git
cd menarguez-ctf-lab

# Opcional: preparar variables de entorno
# cp conf/example.env conf/.env

# Construir y lanzar los contenedores
docker-compose up --build -d
