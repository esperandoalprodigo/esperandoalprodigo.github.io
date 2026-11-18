# Citas bíblicas del catecismo.
# enlazar_citas: convierte cada cita que va entre paréntesis en la respuesta en un enlace
#   al pasaje en la Reina-Valera 1960. No cambia el texto: solo lo envuelve en un enlace.
# citas_de: devuelve la lista de pasajes citados ("1 Corintios 10:31"), para mostrar debajo
#   el texto de cada uno, que se guarda en _data/versiculos.yml.
# Entiende "Salmo 73:25-26", varias citas separadas por ; o por coma, y las abreviadas
# que heredan libro o capítulo de la anterior ("Génesis 3:8, 24" o "Hechos 2:47, 9:26").
require "cgi"

module Jekyll
  module CitasBiblicas
    BASE = "https://www.biblegateway.com/passage/?version=RVR1960&amp;search=".freeze
    GRUPO = /\(([^()]*\d+:\s*\d+[^()]*)\)/.freeze
    LIBRO = /\A((?:[1-3]\s?)?[[:alpha:]]+)\s*(\d+):\s*(\d+(?:[-–]\d+)?)\z/.freeze
    CAPITULO = /\A(\d+):\s*(\d+(?:[-–]\d+)?)\z/.freeze
    VERSOS = /\A(\d+(?:[-–]\d+)?)\z/.freeze

    # Recorre el texto y entrega al bloque cada cita: el trozo original, la cita tal como
    # está escrita y el pasaje completo ("Génesis 3:24"). El bloque devuelve lo que la sustituye.
    def self.recorrer(texto)
      texto.to_s.gsub(GRUPO) do
        libro = nil
        capitulo = nil
        dentro = Regexp.last_match(1).gsub(/[^;,]+/) do |trozo|
          cita = trozo.strip
          pasaje = nil
          if (m = LIBRO.match(cita))
            libro = m[1].sub(/\A([1-3])\s?/, '\1 ')
            capitulo = m[2]
            pasaje = "#{libro} #{capitulo}:#{m[3]}"
          elsif libro && (m = CAPITULO.match(cita))
            capitulo = m[1]
            pasaje = "#{libro} #{capitulo}:#{m[2]}"
          elsif libro && capitulo && (m = VERSOS.match(cita))
            pasaje = "#{libro} #{capitulo}:#{m[1]}"
          end
          pasaje ? yield(trozo, cita, pasaje.tr("–", "-")) : trozo
        end
        "(#{dentro})"
      end
    end

    def enlazar_citas(texto)
      CitasBiblicas.recorrer(texto) do |trozo, cita, pasaje|
        antes = trozo[/\A\s*/]
        despues = trozo[/\s*\z/]
        %(#{antes}<a class="cita-biblica" href="#{BASE}#{CGI.escape(pasaje)}" target="_blank" rel="noopener">#{cita}</a>#{despues})
      end
    end

    def citas_de(texto)
      lista = []
      CitasBiblicas.recorrer(texto) do |trozo, _cita, pasaje|
        lista << pasaje unless lista.include?(pasaje)
        trozo
      end
      lista
    end
  end
end

Liquid::Template.register_filter(Jekyll::CitasBiblicas)
