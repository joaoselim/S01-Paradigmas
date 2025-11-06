import java.util.HashMap;
import java.util.LinkedHashSet;

class PadraoAtaque {
    private String nome;
    private int dano;

    public PadraoAtaque(String nome, int dano) {
        this.nome = nome;
        this.dano = dano;
    }

    public String getNome() {
        return nome;
    }

    public int getDano() {
        return dano;
    }

    @Override
    public String toString() {
        return nome + " (Dano: " + dano + ")";
    }
}

class Boss {
    private String nome;
    private String idBoss;
    private String pontoFraco;
    private LinkedHashSet<PadraoAtaque> moveSet;

    public Boss(String nome, String idBoss, String pontoFraco) {
        this.nome = nome;
        this.idBoss = idBoss;
        this.pontoFraco = pontoFraco;
        this.moveSet = new LinkedHashSet<>();
    }

    public String getNome() {
        return nome;
    }

    public String getIdBoss() {
        return idBoss;
    }

    public String getPontoFraco() {
        return pontoFraco;
    }

    public void adicionarAtaque(PadraoAtaque ataque) {
        moveSet.add(ataque);
    }

    public void iniciarFase() {
        System.out.println("Iniciando batalha contra o Boss " + nome);
        System.out.println("Ponto fraco: " + pontoFraco);
        System.out.println("Movimentos conhecidos:");
        for (PadraoAtaque atk : moveSet) {
            System.out.println("- " + atk);
        }
    }
}

class BossMagico extends Boss {
    public BossMagico(String nome, String idBoss, String pontoFraco) {
        super(nome, idBoss, pontoFraco);
    }

    @Override
    public void iniciarFase() {
        System.out.println("O Boss MÁGICO " + getNome() + " aparece em uma aura brilhante!");
        super.iniciarFase();
        System.out.println("Cuidado! Ele pode conjurar feitiços poderosos!");
    }
}

class Batalha {
    private HashMap<String, Boss> arena;

    public Batalha() {
        this.arena = new HashMap<>();
    }

    public void adicionarBoss(Boss boss) {
        arena.put(boss.getIdBoss(), boss);
        System.out.println("Boss adicionado à arena: " + boss.getNome());
    }

    public void iniciarBatalha(String idBoss) {
        Boss boss = arena.get(idBoss);
        if (boss != null) {
            boss.iniciarFase();
        } else {
            System.out.println("Nenhum boss encontrado com o ID: " + idBoss);
        }
    }
}

public class Main {
    public static void main(String[] args) {
        PadraoAtaque fogo = new PadraoAtaque("Explosão de Fogo", 120);
        PadraoAtaque gelo = new PadraoAtaque("Lança Congelante", 90);
        PadraoAtaque raio = new PadraoAtaque("Raio Tempestuoso", 150);

        BossMagico magus = new BossMagico("Magus", "B001", "Gelo");
        Boss dragoon = new Boss("Dragoon", "B002", "Raio");

        magus.adicionarAtaque(fogo);
        magus.adicionarAtaque(raio);
        dragoon.adicionarAtaque(gelo);
        dragoon.adicionarAtaque(fogo);

        Batalha arena = new Batalha();
        arena.adicionarBoss(magus);
        arena.adicionarBoss(dragoon);

        System.out.println();
        arena.iniciarBatalha("B001");
        System.out.println();
        arena.iniciarBatalha("B002");
        System.out.println();
        arena.iniciarBatalha("B999");
    }
}
