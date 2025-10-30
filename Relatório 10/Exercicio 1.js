class Pokemon {
    #vida;
    nome;
    tipo;

    constructor(nome, tipo, vidaInicial) {
        this.nome = nome;
        this.tipo = tipo;
        this.#vida = vidaInicial;
    }
    
    getVida() {
        return this.#vida;
    }
    
    receberDano(dano) {
        this.#vida = Math.max(0, this.#vida - dano);
    }

    atacar(alvo) {
        console.log(`${this.nome} ataca ${alvo.nome}!`);
        alvo.receberDano(10);
    }
}

class PokemonFogo extends Pokemon {
    bonusAtaque;

    constructor(nome, vidaInicial, bonus) {
        super(nome, "Fogo", vidaInicial);
        this.bonusAtaque = bonus;
    }

    atacar(alvo) {
        const dano = 15 + this.bonusAtaque;
        console.log(`\n${this.nome} usa Fire Blast em ${alvo.nome}!`);
        
        if (alvo.tipo === 'Agua') {
            console.log(`Não é muito efetivo...`);
            alvo.receberDano(Math.floor(dano / 2));
        } else {
             alvo.receberDano(dano);
        }
    }
}

class PokemonAgua extends Pokemon {
    #curaBase;

    
    constructor(nome, vidaInicial, curaBase) {
        super(nome, "Agua", vidaInicial);
        this.#curaBase = curaBase;
    }

    
    atacar(alvo) {
        const dano = 10;
        console.log(`\n${this.nome} usa WaterGun em ${alvo.nome}!`);

        alvo.receberDano(dano);

        this.curar(this.#curaBase);
    }
    
    curar(valorCura) {
        const vidaAntes = this.getVida();
        this.vida = vidaAntes + valorCura;
        console.log(`${this.nome} se curou! Vida atual: ${this.getVida()}`);
    }
}

const charmander = new PokemonFogo("Charmander", 100, 15);
const squirtle = new PokemonAgua("Squirtle", 120, 10);
const pikachu = new Pokemon("Pikachu", "Eletrico", 80);

console.log(`Pokemon: ${charmander.nome} (${charmander.getVida()} PV), ${squirtle.nome} (${squirtle.getVida()} PV)`);

charmander.atacar(squirtle);
squirtle.atacar(charmander);
pikachu.atacar(squirtle);

console.log("\n");
console.log(`${charmander.nome} PV: ${charmander.getVida()}`);
console.log(`${squirtle.nome} PV: ${squirtle.getVida()}`);
console.log(`${pikachu.nome} PV: ${pikachu.getVida()}`);
