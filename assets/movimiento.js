/* Copiar el enlace de una entrada. Si el navegador no deja copiar
   (pasa en algunos navegadores internos), muestra el enlace para copiarlo a mano. */
function copiarEnlace(boton) {
  var enlace = boton.dataset.enlace;
  var aviso = boton.parentNode.querySelector('.compartir-aviso');
  function hecho() { boton.textContent = 'Enlace copiado'; if (aviso) aviso.textContent = 'Enlace copiado'; }
  function aMano() {
    var campo = boton.parentNode.querySelector('.compartir-campo');
    if (!campo) {
      campo = document.createElement('input');
      campo.className = 'compartir-campo'; campo.readOnly = true; campo.value = enlace;
      campo.setAttribute('aria-label', 'Enlace de esta entrada');
      boton.parentNode.appendChild(campo);
    }
    campo.focus(); campo.select();
    try { if (document.execCommand('copy')) { hecho(); return; } } catch (e) {}
    if (aviso) aviso.textContent = 'Mantén pulsado el enlace para copiarlo.';
  }
  if (navigator.clipboard && navigator.clipboard.writeText) {
    navigator.clipboard.writeText(enlace).then(hecho, aMano);
  } else { aMano(); }
}

/* Movimiento suave al desplazarse. Sin bibliotecas.
   Si el navegador pide menos movimiento, no hace nada y todo se ve fijo. */
(function () {
  if (!('IntersectionObserver' in window)) return;
  if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) return;

  var selector = [
    '.bloque-portada > .envoltura > h2',
    '.bloque-portada .caja-rosa',
    '.tarjeta',
    '.destacada',
    '.puerta',
    '.filtros',
    '.lista-cat li',
    '.img-entrada',
    '.versiculo',
    '.b-cita',
    '.b-foto',
    '.b-galeria',
    '.b-sep',
    '.b-oracion',
    '.b-pregunta',
    '.m1-versiculo',
    '.pasos li',
    '.puntos li',
    '.pens-caja',
    '.r3-panel',
    '.carta',
    '.antes-despues',
    '.c-resp',
    '.compartir',
    '.cierre'
  ].join(',');

  var elementos = document.querySelectorAll(selector);
  if (!elementos.length) return;

  function limpiar(el) {
    el.classList.remove('rev', 'visto');
    el.style.transitionDelay = '';
  }

  var observador = new IntersectionObserver(function (entradas) {
    var orden = 0;
    entradas.forEach(function (entrada) {
      if (!entrada.isIntersecting) return;
      var el = entrada.target;
      var espera = Math.min(orden, 5) * 90;
      orden += 1;
      el.style.transitionDelay = espera + 'ms';
      el.classList.add('visto');
      observador.unobserve(el);
      /* Al terminar se quitan las clases para no interferir con el efecto al pasar el ratón */
      window.setTimeout(function () { limpiar(el); }, espera + 800);
    });
  }, { threshold: 0.05, rootMargin: '0px 0px -6% 0px' });

  for (var i = 0; i < elementos.length; i++) {
    elementos[i].classList.add('rev');
    observador.observe(elementos[i]);
  }
})();
