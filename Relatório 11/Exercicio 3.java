import java.util.HashMap;

interface Rastreavel {
    String obterCoordenadas();
}

class Poder {
    private String nome;

    public Poder(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}

abstract class Entidades implements Rastreavel {
    private String nome;
    private String localizacao;
    protected Poder poder;

    public Entidades(String nome, String localizacao, Poder poder) {
        this.nome = nome;
        this.localizacao = localizacao;
        this.poder = poder;
    }

    public String getNome() {
        return nome;
    }

    public String getLocalizacao() {
        return localizacao;
    }

    public Poder getPoder() {
        return poder;
    }

    @Override
    public String obterCoordenadas() {
        return "Entidade " + nome + " localizada em " + localizacao;
    }
}

class Youkai extends Entidades {
    public Youkai(String nome, String local, Poder poder) {
        super(nome, local, poder);
    }

    @Override
    public String obterCoordenadas() {
        return "Youkai " + getNome() + " está em " + getLocalizacao() +
               " usando poder " + poder.getNome();
    }
}

class Alien extends Entidades {
    private String planetaOrigem;
    private String ovni;

    public Alien(String nome, String planeta, String ovni, Poder poder) {
        super(nome, planeta, poder);
        this.planetaOrigem = planeta;
        this.ovni = ovni;
    }

    public String getPlanetaOrigem() {
        return planetaOrigem;
    }

    public String getOvni() {
        return ovni;
    }

    @Override
    public String obterCoordenadas() {
        return "Alien " + getNome() + " avistado vindo de " + planetaOrigem +
               " em um OVNI do tipo " + ovni + " com poder " + poder.getNome();
    }
}

class Registros {
    private String nomeEquipe;
    private HashMap<String, Entidades> avistamentos;

    public Registros(String nomeEquipe) {
        this.nomeEquipe = nomeEquipe;
        this.avistamentos = new HashMap<>();
    }

    public boolean registrarAvistamento(Entidades entidade) {
        if (!avistamentos.containsKey(entidade.getNome())) {
            avistamentos.put(entidade.getNome(), entidade);
            System.out.println("Novo avistamento registrado: " + entidade.getNome());
            return true;
        } else {
            System.out.println("Avistamento duplicado ignorado: " + entidade.getNome());
            return false;
        }
    }

    public void listarAvistamentos() {
        System.out.println("Avistamentos da Equipe " + nomeEquipe);
        for (Entidades e : avistamentos.values()) {
            System.out.println(e.obterCoordenadas());
        }
    }
}

public class Main {
    public static void main(String[] args) {
        Poder invisibilidade = new Poder("Invisibilidade");
        Poder telepatia = new Poder("Telepatia");

        Youkai kitsune = new Youkai("Kitsune", "Floresta Mística", invisibilidade);
        Alien zorg = new Alien("Zorg", "Marte", "Disco Voador", telepatia);

        Registros equipe = new Registros("Detetives Ocultos");

        equipe.registrarAvistamento(kitsune);
        equipe.registrarAvistamento(zorg);

        equipe.listarAvistamentos();
    }
}
