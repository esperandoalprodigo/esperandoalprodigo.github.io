# Convierte las citas bíblicas que van entre paréntesis en la respuesta del catecismo
# en enlaces al pasaje en la Reina-Valera 1960. No cambia el texto: solo lo envuelve en un enlace.
# Entiende "Salmo 73:25-26", varias citas separadas por ; o por coma, y las abreviadas
# que heredan libro o capítulo de la anterior ("Génesis 3:8, 24" o "Hechos 2:47, 9:26").
require "cgi"

module Jekyll
  module CitasBiblicas
    BASE = "https://www.biblegateway.com/passage/?version=RVR1960&amp;search=".freeze
    LIBRO = /\A((?:[1-3]\s?)?[[:alpha:]]+)\s*(\d+):\s*(\d+(?:[-–]\d+)?)\z/.freeze
    CAPITULO = /\A(\d+):\s*(\d+(?:[-–]\d+)?)\z/.freeze
    VERSOS = /\A(\d+(?:[-–]\d+)?)\z/.freeze

    def enlazar_citas(texto)
      texto.to_s.gsub(/\(([^()]*\d+:\s*\d+[^()]*)\)/) do
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
          if pasaje
            antes = trozo[/\A\s*/]
            despues = trozo[/\s*\z/]
            enlace = BASE + CGI.escape(pasaje.tr("–", "-"))
            %(#{antes}<a class="cita-biblica" href="#{enlace}" target="_blank" rel="noopener">#{cita}</a>#{despues})
          else
            trozo
          end
        end
        "(#{dentro})"
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::CitasBiblicas)
