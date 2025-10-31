class IExplorador {
  explorarTerritorio() {
    throw new Error("Método explorarTerritorio() deve ser implementado.");
  }
}

class ODM_Gear {
    #gasRestante;
    modelo;

    constructor(modelo) {
        this.modelo = modelo;
        this.#gasRestante = 100;
    }

    usarGas(quantidade) {
        this.#gasRestante -= quantidade;
    }

    getGas() {
        return this.#gasRestante;
    }
}

class Soldado extends IExplorador{
    #gear;

    constructor(nome, modeloGear){
        super();
        this.nome = nome;
        this.#gear = new ODM_Gear(modeloGear);
    }

     explorarTerritorio(){
        this.#gear.usarGas(10);
        console.log(`${this.nome} explorou usando seu ${this.#gear.modelo}.`);
    }

    verificarEquipamento(){
        console.log(`${this.nome} está com o ${this.#gear.modelo}.`)
    }
}

class Esquadrao extends IExplorador{
    constructor(lider, membrosIniciais = []) {
        super();
        this.lider = lider;
        this.membros = [lider, ...membrosIniciais];
    }

    adicionarMembro(soldado) {
        this.membros.push(soldado);
        console.log(`\n${soldado.nome} foi adicionado ao esquadrão do ${this.lider}.`);
    }

    explorarTerritorio(){
        console.log(`\nO ${this.lider.nome} está em exploração com seu esquadrão`);
        return this.membros.map(membro => membro.explorarTerritorio());
    }

    relatarStatus() {
        return this.membros.map(membro => membro.verificarEquipamento());
    }
}

const Levi = new Soldado('Levi', 'Modelo-A');
const João = new Soldado('Paulo', 'Modelo-B');
const Camile = new Soldado('Samuel', 'Modelo-C');
const Maria = new Soldado('Caio', 'Modelo-D');

let esquadraoLevi = new Esquadrao(Levi, [João, Camile]);

esquadraoLevi.adicionarMembro(Maria);
for (let i=0; i<2; i++) {
    esquadraoLevi.explorarTerritorio();
    esquadraoLevi.relatarStatus();
}
