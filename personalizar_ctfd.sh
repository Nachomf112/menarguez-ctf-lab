#!/bin/bash

# Rutas actualizadas
LOGO_ORIGEN="/home/kali/Escritorio/logo_menarguez.png"
LOGO_DESTINO="/home/kali/nacho/CTFd/static/img/logo_menarguez.png"
BASE_HTML="/home/kali/nacho/CTFd/CTFd/themes/core/templates/base.html"
NAVBAR_HTML="/home/kali/nacho/CTFd/CTFd/themes/core/templates/components/navbar.html"

echo "🔧 Iniciando personalización de CTFd con el logo de Menarguez–IA–Solutions..."

# Verificar logo
if [ ! -f "$LOGO_ORIGEN" ]; then
  echo "❌ Logo no encontrado en: $LOGO_ORIGEN"
  exit 1
fi

mkdir -p "$(dirname "$LOGO_DESTINO")"
cp "$LOGO_ORIGEN" "$LOGO_DESTINO"
echo "✅ Logo copiado a: $LOGO_DESTINO"

# Favicon en base.html
if [ -f "$BASE_HTML" ]; then
  cp "$BASE_HTML" "$BASE_HTML.bak"
  sed -i '/<head>/a <link rel="icon" href="{{ url_for('\''static'\'', filename='\''img/logo_menarguez.png'\'') }}" type="image/png">' "$BASE_HTML"
  echo "🎨 Favicon insertado en base.html"
else
  echo "⚠️ No se encontró base.html en: $BASE_HTML"
fi

# Logo en navbar.html
if [ -f "$NAVBAR_HTML" ]; then
  cp "$NAVBAR_HTML" "$NAVBAR_HTML.bak"
  sed -i 's|<a class="navbar-brand".*|<a class="navbar-brand" href="{{ request.script_root }}/"><img src="{{ url_for('\''static'\'', filename='\''img/logo_menarguez.png'\'') }}" alt="Logo" height="30"></a>|' "$NAVBAR_HTML"
  echo "🧩 Logo insertado en navbar.html"
else
  echo "⚠️ No se encontró navbar.html en: $NAVBAR_HTML"
fi

# Reinicio de contenedores
cd /home/kali/nacho/CTFd || exit
docker-compose down
docker-compose up -d

echo "✅ Personalización completada. Abre: http://localhost:8000"
