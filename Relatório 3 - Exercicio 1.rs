use std::io;

fn verificar_senha(senha: &str) -> bool{
  let tem_8caracteres = senha.len() >= 8;
  let tem_numero = senha.chars().any(|c| c.is_numeric());
  let tem_maiuscula = senha.chars().any(|c| c.is_uppercase());

  if tem_8caracteres && tem_numero && tem_maiuscula {
    return true;
  }
  else {false}
}

fn main() {
  println!("Digite a senha: ");
  let mut senha = String::new();
  io::stdin().read_line(&mut senha).expect("Falha ao ler entrada");

  while !verificar_senha(&senha) {
    println!("Senha incorreta. Insira novamente:");
    senha = String::new();
    io::stdin().read_line(&mut senha).expect("Falha ao ler entrada");
  }
  println!("Senha correta!");
}
