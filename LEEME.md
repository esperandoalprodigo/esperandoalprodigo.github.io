# Web Esperando al Pródigo · v3 (17 de noviembre de 2026)

Cambios respecto a la v2: bloques dentro del texto, botones para compartir por WhatsApp y copiar el enlace, la foto de la entrada aparece al compartir, publicación programada y fotos reducidas al publicar. El panel usa la sintaxis comprobada en la documentación de Pages CMS.

Cambios respecto a la v1: pie de página reducido a una línea (logotipo, Instagram, Contacto y páginas legales; los créditos de la Biblia y del catecismo quedan en el Aviso legal) y correo de contacto esperandoalprodigo@gmail.com.

Web hecha con Jekyll para publicar gratis en GitHub Pages. Geoco escribe desde el panel Pages CMS, sin tocar código.

## Qué incluye

- **Portada** con el lema, las últimas entradas, el catecismo de la semana, «Sobre mí» e Instagram.
- **Cinco tipos de entrada** con sus plantillas: Pensamiento (P1 a P4), Reflexión (R1 a R3), Meditación (M1 y M2), Palabra (W1 y W2) y Testimonio (T1 a T3). Todas funcionan con foto y sin foto. Si el texto es largo y tiene subtítulos, aparece un índice solo.
- **Bloques** que se añaden a cualquier entrada: cita destacada, versículo, foto con pie, galería, separador, oración y pregunta para pensar.
- **Catecismo de Spurgeon** con las 82 preguntas y respuestas copiadas literalmente del PDF de Chapel Library (archivo _data/spurgeon.yml). Cada semana Geoco solo escribe el número de la pregunta, el porqué y la pregunta para la familia. Plantillas C1 (ficha) y C2 (versión para niños).
- **Páginas:** Entradas, una por sección, Catecismo, Sobre mí, Contacto, Aviso legal, Privacidad, Cookies y página de error.
- **Ajustes** desde el panel: colores (Actual, Más nítido o Bloques oscuros; viene puesto Más nítido), lema, qué se ve en la portada, menú, Instagram, correo y nombre de la titular.
- Tipografías Josefin Sans y Lato servidas desde la propia web, sin cookies ni analítica.

## Pendiente antes de publicar

1. En «Ajustes de la web»: nombre y apellidos de Geoconda (salen en el aviso legal y la privacidad). El correo ya está puesto.
2. En «Sobre mí»: título, resumen y texto de Geoco.
3. Revisar los textos de Aviso legal, Privacidad y Cookies, y poner la fecha de publicación.
4. Borrar las entradas de ejemplo (llevan un aviso amarillo) cuando haya entradas reales.

## Publicar en GitHub Pages (una sola vez)

1. Entrar en GitHub con la cuenta esperandoalprodigo.
2. Crear un repositorio nuevo llamado exactamente **esperandoalprodigo.github.io**, público.
3. En el repositorio, «Add file» › «Upload files», y arrastrar **el contenido** de esta carpeta (no la carpeta). En Mac, los archivos que empiezan por punto (.pages.yml) están ocultos: pulsar Cmd + Mayúsculas + punto en el Finder para verlos y arrastrarlos también.
4. «Commit changes».
5. Settings › Pages › Build and deployment › Source: **GitHub Actions**. No hace falta elegir nada más: la carpeta .github ya trae el proceso «Publicar la web».
   (La carpeta .github también está oculta en el Finder: hay que subirla igual que .pages.yml.)
6. A los pocos minutos la web está en https://esperandoalprodigo.github.io

## Conectar el panel de escritura

1. Ir a https://app.pagescms.org y entrar con la cuenta de GitHub.
2. Elegir el repositorio esperandoalprodigo.github.io.
3. Aparecen Entradas, Catecismo, Sobre mí y Ajustes de la web. Al guardar, la web se actualiza sola en uno o dos minutos.

## Conectar el dominio esperandoalprodigo.es (cuando esté comprado)

1. En GitHub: Settings › Pages › Custom domain: esperandoalprodigo.es. Guardar.
2. En Hostalia, zona DNS del dominio:
   - Cuatro registros A para @ con estas IP: 185.199.108.153, 185.199.109.153, 185.199.110.153 y 185.199.111.153.
   - Un registro CNAME para www que apunte a esperandoalprodigo.github.io
   - Quitar los registros A que Hostalia trae por defecto para @.
3. Cuando GitHub marque el dominio como correcto, activar «Enforce HTTPS».
4. En _config.yml cambiar la línea url por: url: "https://esperandoalprodigo.es"
5. En «Ajustes de la web», cambiar el correo a contacto@esperandoalprodigo.es cuando ese buzón exista.

Los cambios de DNS pueden tardar unas horas.

## Escribir una entrada

1. Panel › Entradas › Nueva.
2. Título, tipo y plantilla (si no se elige, se usa la primera de su tipo).
3. Foto, versículo y cita son opcionales; la plantilla se adapta a lo que haya.
4. Los versículos se copian literalmente de la Reina-Valera 1960.
5. En los testimonios, nunca nombres ni fotos de los hijos, y solo con permiso de quien lo cuenta.

## Bloques dentro del texto

En la entrada, añade los bloques en «Bloques». Para colocar uno entre párrafos, escribe en el texto una línea que solo diga [[1]] (para el primer bloque), [[2]] (para el segundo)... Los bloques que no coloques aparecen al final.

## Programar publicaciones

Pon una fecha futura en la entrada o en la pregunta del catecismo. Se guarda pero no se ve hasta ese día: cada mañana, hacia las 6:00 (hora de España), la web se vuelve a publicar sola y saca lo que toque. Si el repositorio pasa 60 días sin ningún cambio, GitHub pausa esta tarea automática; se reactiva en la pestaña Actions.

## Fotos

Al publicar, las fotos de más de 300 KB se reducen solas a un máximo de 1600 px y se corrigen si salen giradas. Aun así, conviene subir fotos horizontales para la portada de las entradas y no subir capturas de pantalla con datos personales.

## Créditos

- Texto bíblico: Reina-Valera 1960 © Sociedades Bíblicas en América Latina, 1960. Renovado © Sociedades Bíblicas Unidas, 1988.
- Catecismo de Spurgeon © Chapel Library, uso gratuito con mención.
- Tipografías Josefin Sans y Lato: licencia SIL Open Font License.
