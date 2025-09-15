use std::io;

fn somar(j1: i32, j2: i32) -> i32 {
    j1 + j2
}

fn eh_par(numero: i32) -> bool {
    numero % 2 == 0
}

fn main() {
    println!("Escolha entre Impar ou Par: ");
    let mut par_ou_impar = String::new();
    io::stdin()
        .read_line(&mut par_ou_impar)
        .expect("Falha ao ler entrada");
    let par_ou_impar = par_ou_impar.trim().to_lowercase();

    println!("Jogador 1, digite um número: ");
    let mut numero1 = String::new();
    io::stdin()
        .read_line(&mut numero1)
        .expect("Falha ao ler entrada");
    let numero1: i32 = numero1
        .trim()
        .parse()
        .expect("Por favor, digite um número válido");

    println!("Agora o jogador 2, insira um número: ");
    let mut numero2 = String::new();
    io::stdin()
        .read_line(&mut numero2)
        .expect("Falha ao ler entrada");
    let numero2: i32 = numero2
        .trim()
        .parse()
        .expect("Por favor, digite um número válido");

    let resp = /*bool::*/eh_par(somar(numero1, numero2));

    if resp && par_ou_impar == "par" {
        println!("Jogador 1 ganhou!");
    } else if !resp && par_ou_impar == "impar" {
        println!("Jogador 1 ganhou!");
    } else {
        print!("Jogador 2 ganhou!")
    }
}
