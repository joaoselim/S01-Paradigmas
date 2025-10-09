using System;
using System.Collections.Generic;

class Pokemon
{
    protected string Nome {get; set;}

    public Pokemon(string nome)
    {
        Nome = nome;
    }
    public virtual void Atacar()
    {
        Console.WriteLine(Nome + " ataca!");
    }

}

class PokemonDeFogo : Pokemon
{
    public PokemonDeFogo(string nome) : base(nome) { }
    public override void Atacar()
    {
        Console.WriteLine(Nome + " usa Fire Blast!");
    }
}

class PokemonDeAgua : Pokemon
{
    public PokemonDeAgua(string nome) : base(nome) { }
    public override void Atacar()
    {
        Console.WriteLine(Nome + " usa Water Gun!");
    }
}

class Program
{
    public static void Main(string[] args)
    {
        List<Pokemon> pokemon = new List<Pokemon>();

        pokemon.Add(new PokemonDeFogo("Charizard"));
        pokemon.Add(new PokemonDeAgua("Blastoise"));

        foreach (Pokemon p in pokemon)
        {
            p.Atacar();
        }
    }
}
