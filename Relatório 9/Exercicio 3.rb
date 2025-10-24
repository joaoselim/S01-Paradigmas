class MicroondasUnidade
  def aquecer_por(tempo)
    puts "Aquecendo por #{tempo} segundos..."
  end
end

class DMail
  attr_reader :conteudo, :hora_envio

  def initialize(conteudo, hora_envio)
    @conteudo = conteudo
    @hora_envio = hora_envio
  end

  def to_s
    "D-Mail: '#{@conteudo}' enviado às #{@hora_envio}"
  end
end

class TelefoneDeMicroondas
  def initialize
    @unidade = MicroondasUnidade.new
    @dmails = []
  end

  def enviar_dmail
    print "Insira o conteúdo do D-Mail: "
    conteudo = gets.chomp

    print "Insira o horário de envio (ex: 10:30): "
    hora = gets.chomp

    @unidade.aquecer_por(3)
    dmail = DMail.new(conteudo, hora)
    @dmails << dmail

    puts "\nD-Mail enviado com sucesso!"
  end

  def listar_dmails(horario_corte)
    selecionados = @dmails.select { |d| d.hora_envio > horario_corte }

    if selecionados.empty?
      puts "Nenhum D-Mail enviado após #{horario_corte}."
    else
      puts "\nD-Mails enviados após #{horario_corte}:"
      selecionados.each { |d| puts d }
    end
  end
end

telefone = TelefoneDeMicroondas.new
telefone.enviar_dmail
telefone.enviar_dmail

print "\nDigite um horário de corte para listar os D-Mails (ex: 09:00): "
hora_corte = gets.chomp
telefone.listar_dmails(hora_corte)
