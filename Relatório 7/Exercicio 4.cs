using System;

abstract class MonstroSombrio
{
    public string Nome { get; set; }

    public MonstroSombrio(string nome)
    {
        Nome = nome;
    }

    public abstract void Mover();
}

class Zumbi : MonstroSombrio
{
    public Zumbi(string nome) : base(nome) { }

    public override void Mover()
    {
        Console.WriteLine(Nome + " se move lentamente... (passos arrastados 🧟‍♂️)");
    }
}

class Espectro : MonstroSombrio
{
    public Espectro(string nome) : base(nome) { }

    public override void Mover()
    {
        Console.WriteLine(Nome + " desliza rapidamente pelo ar! 👻");
    }
}

class Program
{
    public static void Main(string[] args)
    {
        MonstroSombrio[] horda = new MonstroSombrio[2];

        horda[0] = new Zumbi("Zumbi Lento");
        horda[1] = new Espectro("Espectro Veloz");

        foreach (MonstroSombrio m in horda)
        {
            m.Mover();
        }
    }
}
