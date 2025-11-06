import java.util.ArrayList;

class Cafe {
    private String nome;
    private double precoBase;

    public Cafe(String nome, double precoBase) {
        this.nome = nome;
        this.precoBase = precoBase;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getPrecoBase() {
        return precoBase;
    }

    public void setPrecoBase(double precoBase) {
        this.precoBase = precoBase;
    }

    public double calcularPrecoFinal() {
        return precoBase;
    }
}

class CafeGourmet extends Cafe {
    private double bonusAroma;

    public CafeGourmet(String nome, double precoBase, double bonusAroma) {
        super(nome, precoBase);
        this.bonusAroma = bonusAroma;
    }

    public double getBonusAroma() {
        return bonusAroma;
    }

    public void setBonusAroma(double bonusAroma) {
        this.bonusAroma = bonusAroma;
    }

    @Override
    public double calcularPrecoFinal() {
        return super.calcularPrecoFinal() + bonusAroma;
    }
}

class Menu {
    private ArrayList<Cafe> itens;

    public Menu() {
        this.itens = new ArrayList<>();
    }

    public ArrayList<Cafe> getItens() {
        return itens;
    }

    public void adicionarItem(Cafe cafe) {
        itens.add(cafe);
    }

    public void exibirMenu() {
        System.out.println("---- Menu da Cafeteria ----");
        for (Cafe cafe : itens) {
            System.out.println(cafe.getNome() + " - R$ " + cafe.calcularPrecoFinal());
        }
        System.out.println("---------------------------");
    }
}

class CafeLeblanc {
    private Menu menu;

    public CafeLeblanc(Menu menu) {
        this.menu = menu;
    }

    public void receberPedido(Cafe cafe) {
        menu.adicionarItem(cafe);
        System.out.println("Pedido recebido: " + cafe.getNome());
    }

    public void exibirMenu() {
        menu.exibirMenu();
    }
}

public class Main {
    public static void main(String[] args) {
        Menu menu = new Menu();
        CafeLeblanc leblanc = new CafeLeblanc(menu);

        Cafe cafeSimples = new Cafe("Café Preto", 5.0);
        CafeGourmet cafeGourmet = new CafeGourmet("Café Gourmet", 8.0, 2.5);

        leblanc.receberPedido(cafeSimples);
        leblanc.receberPedido(cafeGourmet);

        leblanc.exibirMenu();
    }
}
