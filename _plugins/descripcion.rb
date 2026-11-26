# La descripción que se ve al compartir un enlace (WhatsApp, Instagram, buscadores)
# sale del resumen de la entrada o, en el catecismo, de la pregunta de la semana.
poner_descripcion = proc do |doc|
  next if doc.data["description"].to_s.strip != ""
  texto = doc.data["resumen"].to_s.strip
  if texto.empty? && doc.respond_to?(:collection) && doc.collection.label == "catecismo"
    numero = doc.data["numero"].to_i
    fila = (doc.site.data["spurgeon"] || []).find { |q| q["numero"].to_i == numero }
    texto = "Catecismo, pregunta #{numero}: #{fila["pregunta"]}" if fila
  end
  if texto.empty? && doc.data["tipo"] == "pensamiento"
    texto = doc.content.to_s.gsub(/[*_#>\[\]]/, "").strip.split(/\n\s*\n/).first.to_s
  end
  doc.data["description"] = texto unless texto.empty?
end
Jekyll::Hooks.register :documents, :pre_render, &poner_descripcion
Jekyll::Hooks.register :pages, :post_init, &poner_descripcion
