class Musico
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def tocar_partitura(peca)
    raise NotImplementedError, ""
  end
end

class Pianista < Musico
  def tocar_partitura(peca)
    "#{@nome} toca a peça '#{peca}' no piano"
  end
end

class Violinista < Musico
  def tocar_partitura(peca)
    "#{nome} toca a peca '#{peca}' no violino"
  end
end

class Maestro
  def initialize(musicos)
    @musicos = musicos
  end  
  
  def iniciar_ensaio(peca)
    puts "\nIniciando ensaio da peça '#{peca}'...\n\n"
    @musicos.each do |musico|
      puts musico.tocar_partitura(peca)
    end
  end

  def mudar_foco(estado)
    @musicos.map do |musico|
      "#{musico.nome} agora está #{estado}!"
    end
  end
end

pianista = Pianista.new("Kousei", "Piano")
violinista = Violinista.new("Kaori", "Violino")

maestro = Maestro.new([pianista, violinista])

puts "Qual a peça a ser tocada: "
peca = gets.chomp

maestro.iniciar_ensaio(peca)
