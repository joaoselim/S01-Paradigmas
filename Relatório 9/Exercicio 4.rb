module Rastreavel
  def obter_localizacao(hora)
    "Localização às #{hora}: #{@localizacao}"
  end
end

module Perigoso
  def calcular_risco
    "Nível de risco alto! (#{@nome})"
  end
end

class Participante
  attr_accessor :nome, :localizacao

  def initialize(nome, localizacao)
    @nome = nome
    @localizacao = localizacao
  end
end

class Detetive < Participante
  include Rastreavel

  def initialize(nome, localizacao)
    super
  end
end

class MestreDoCrime < Participante
  include Rastreavel
  include Perigoso

  def initialize(nome, localizacao)
    super
  end
end

class Cenario
  attr_accessor :participantes

  def initialize
    @participantes = []
  end

  def adicionar(participante)
    @participantes << participante
  end

  def identificar_ameacas
    @participantes.select { |p| p.respond_to?(:calcular_risco) }
  end
end

puts "~JOGO DAS SOMBRAS~"
puts "Digite a localização de Sherlock:"
loc_sherlock = gets.chomp

puts "Digite a localização de Moriarty:"
loc_moriarty = gets.chomp

sherlock = Detetive.new("Sherlock Holmes", loc_sherlock)
moriarty = MestreDoCrime.new("Moriarty", loc_moriarty)

cenario = Cenario.new
cenario.adicionar(sherlock)
cenario.adicionar(moriarty)
