using System;
using System.Collections.Generic;

class Feitico
{
    public string Nome { get; set; }

    public Feitico(string nome)
    {
        Nome = nome;
    }
}

class Grimorio
{
    private List<Feitico> feiticos;

    public Grimorio()
    {
        feiticos = new List<Feitico>();
    }

    public void AdicionarFeitico(Feitico f)
    {
        feiticos.Add(f);
    }

    public void ListarFeiticos()
    {
        Console.WriteLine("Feitiços no Grimório:");
        foreach (var f in feiticos)
        {
            Console.WriteLine("- " + f.Nome);
        }
    }
}

class Ferramenta
{
    public string Nome { get; set; }

    public Ferramenta(string nome)
    {
        Nome = nome;
    }
}

class Maga
{
    private Grimorio grimorio;
    private List<Ferramenta> ferramentas;

    public Maga(List<Ferramenta> ferramentas)
    {
        grimorio = new Grimorio();
        this.ferramentas = ferramentas;
    }

    public void AdicionarFeiticoAoGrimorio(Feitico f)
    {
        grimorio.AdicionarFeitico(f);
    }

    public void MostrarFerramentas()
    {
        Console.WriteLine("Ferramentas da maga Frieren:");
        foreach (var f in ferramentas)
        {
            Console.WriteLine("- " + f.Nome);
        }
    }

    public void MostrarFeiticos()
    {
        grimorio.ListarFeiticos();
    }
}

class Program
{
    static void Main(string[] args)
    {
        List<Ferramenta> ferramentas = new List<Ferramenta>
        {
            new Ferramenta("Capa"),
            new Ferramenta("Lanterna"),
            new Ferramenta("Mapa Mágico")
        };

        Maga frieren = new Maga(ferramentas);

        frieren.AdicionarFeiticoAoGrimorio(new Feitico("Raio de Gelo"));
        frieren.AdicionarFeiticoAoGrimorio(new Feitico("Barreira Arcana"));

        frieren.MostrarFerramentas();
        Console.WriteLine();
        frieren.MostrarFeiticos();
    }
}
