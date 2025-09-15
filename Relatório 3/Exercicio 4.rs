use std::io;

fn calcular_media(nota1: f64, nota2: f64, nota3: f64) ->f64 {
    let nota1_peso = nota1 * 0.2;
    let nota2_peso = nota2 * 0.3;
    let nota3_peso = nota3 * 0.5;

    let media = nota1_peso + nota2_peso + nota3_peso;
    media
}

fn main() {
    println!("Insira sua primeira nota: ");
    let mut nota1 = String::new();
    io::stdin().read_line(&mut nota1).expect("Falha ao ler entrada");
    let nota1: f64 = nota1.trim().parse().expect("Por favor, digite um número válido");

    println!("Insira sua segunda nota: ");
    let mut nota2 = String::new();
    io::stdin().read_line(&mut nota2).expect("Falha ao ler entrada");
    let nota2: f64 = nota2.trim().parse().expect("Por favor, digite um número válido");

    println!("Insira sua terceira nota: ");
    let mut nota3 = String::new();
    io::stdin().read_line(&mut nota3).expect("Falha ao ler entrada");
    let nota3: f64 = nota3.trim().parse().expect("Por favor, digite um número válido");

    if calcular_media(nota1, nota2, nota3) >= 7.0{
        println!("Aprovado!!!")
    }
    else {println!("Reprovado")}
}
