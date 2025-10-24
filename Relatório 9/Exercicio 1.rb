class Drink
  attr_reader :nome

  def initialize(nome, preco_base)
    @nome = nome
    self.preco_base = preco_base
  end

  def preco_base
    @preco_base
  end

  def preco_base=(valor)
    if valor > 0
      @preco_base = valor
    else
      raise "Preço inválido! Deve ser maior que 0."
    end
  end

  def preco_final
    @preco_base
  end

  def to_s
    "Drink comum: #{@nome}, preço base: $#{@preco_base}"
  end
end

class DrinkLenda < Drink
  def initialize(nome, preco_base, anos_desde_criacao)
    super(nome, preco_base)
    @anos_desde_criacao = anos_desde_criacao
  end

  def preco_final
    @preco_base + (5 * @anos_desde_criacao)
  end

  def to_s
    "Drink Lenda: #{@nome}, Preço base: $#{@preco_base}, " \
    "Anos: #{@anos_desde_criacao}, Preço final: $#{preco_final}"
  end
end

puts "Insira o nome do drink:"
nome = gets.chomp

puts "Insira o preço base do drink:"
preco = gets.chomp.to_f

puts "Insira a idade do drink (em anos):"
anos = gets.chomp.to_i

drink = DrinkLenda.new(nome, preco, anos)

puts "\n#{drink}"
