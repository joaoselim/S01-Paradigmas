class IRastreavel {
    rastrearLocal(lat, long){
        throw new Error('Método rastrearLocal() deve ser implementado');
    }
}

class Hunter extends IRastreavel{
    #nome;
    #idade;
    #localizacao;

    constructor(nome, idade, localizacao){
        super();
        this.#nome = nome;
        this.#idade = idade;
        this.#localizacao = localizacao;
    }

    getNome(){
        return this.#nome;
    }

    getLocalizacao(){
        return this.#localizacao
    }

    rastrearLocal(lat, long) {
        return `Hunter ${this.#nome} localizado em [${lat}, ${long}].`;
    }
}

class Especialista extends Hunter {
    #habilidadeNen;

    constructor(nome, idade, localizacao, habilidade){
        super(nome, idade, localizacao);
        this.#habilidadeNen = habilidade;
    }

    rastrearLocal(lat, long) {
        return `[Especialista] ${this.getNome()} (${this.#habilidadeNen}) encontrou uma ameaça em [${lat}, ${long}].`;
    }
}

class Manipulador extends Hunter {
    #alvoAtual;

    constructor(nome, idade, localizacao, alvo){
        super(nome, idade, localizacao);
        this.#alvoAtual = alvo;
    }

    rastrearLocal(lat, long) {
    this.localizacao = `${lat}, ${long}`;
    const alvoInfo = this.alvoAtual ? ` (alvo: ${this.alvoAtual.nome})` : "";
    return `Manipulador ${this.nome}${alvoInfo} rastreando — nova posição: ${this.localizacao}`;
  }
}

class Batalhao {
    #hunters

    constructor(){
        this.#hunters = new Set();
    }

    adicionarHunter(hunter){
        const nomeDuplicado = Array.from(this.#hunters).some(h => h.getNome() === hunter.getNome());

        if(nomeDuplicado){
            console.log(`${hunter.getNome()} já está no Batalhão.`);
            return false;
        }

        this.#hunters.add(hunter);
        console.log(`${hunter.getNome()} adicionado ao Batalhão`);
        return true;
    }

    iniciarRastreamento(lat, long) {
        const resultadosRastreamento = [];

        console.log(`\nRastreando Hunters`);

        for (const hunter of this.#hunters) {
            const mensagem = hunter.rastrearLocal(lat, long);
            resultadosRastreamento.push(mensagem);
            console.log(`-> ${mensagem}`);
        }

        return resultadosRastreamento;
    }
}

const especialistaA = new Especialista("Soneca", 24, "Bahia", "Física");
const especialistaB = new Especialista("Mestre", 39, "Obra", "Quebrar códigos");
const manipuladorC = new Manipulador("Zangado", 14, "Ensino Médio", "Raiva");
const manipuladorD = new Manipulador("Dunga", 8, "Rio de Janeiro", "Maneirisse");

const batalhaoPrincipal = new Batalhao();

console.log("Adicionando Hunters:\n");
batalhaoPrincipal.adicionarHunter(especialistaA);
batalhaoPrincipal.adicionarHunter(manipuladorC);
batalhaoPrincipal.adicionarHunter(especialistaB);
batalhaoPrincipal.adicionarHunter(manipuladorD); 


const latitude = -26.0472;
const longitude = 107.3367;

const rastreamentos = batalhaoPrincipal.iniciarRastreamento(latitude, longitude);

console.log("\nInformações obtidas:");
rastreamentos.forEach(r => console.log(r));
