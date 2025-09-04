use std::io;

fn imprimir_taboada(numero: i32, limite_inferior: i32, limite_superior: i32) {
    let mut contador = limite_inferior;
    loop {
        let multiplicacao = numero * contador;
        println!("{} x {} = {}", numero, contador, multiplicacao);
        contador += 1;
        if contador > limite_superior {
            break;
        }
    }
}

fn main() {
    println!("Digite um número para taboada: ");
    let mut numero = String::new();
    io::stdin().read_line(&mut numero).expect("Falha ao ler entrada");
    let numero: i32 = numero.trim().parse().expect("Por favor, digite um número válido");

    println!("Digite o limite inferior: ");
    let mut lim_inf = String::new();
    io::stdin().read_line(&mut lim_inf).expect("Falha ao ler entrada");
    let lim_inf: i32 = lim_inf.trim().parse().expect("Por favor, digite um número válido");

    println!("Digite o limite superior: ");
    let mut lim_sup = String::new();
    io::stdin().read_line(&mut lim_sup).expect("Falha ao ler entrada");
    let lim_sup: i32 = lim_sup.trim().parse().expect("Por favor, digite um número válido");

    imprimir_taboada(numero, lim_inf, lim_sup);
}
