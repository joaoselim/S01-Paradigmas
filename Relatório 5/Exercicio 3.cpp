#include <iostream>
using namespace std;

float somarArray(float arr[], int tamanho){
	float soma = 0;
	for(int i=0; i<tamanho; i++){
		soma += arr[i];
	}
	return soma;
}

int main()
{
	int nNotas;
	float nota, soma = 0, media;
	
	cout << "Quantas notas deseja inserir: ";
	cin >> nNotas;
	
	for(int i=0; i<nNotas; i++){
		cout << "Insira a " << i+1 << " nota: ";
		cin >> nota;
		while(nota < 0 || nota > 10){
			cout << "A nota deve estar entre 0 e 10! Insira novamente: ";
			cin >> nota;
		}
		soma += nota;
	}
	
	media = soma / nNotas;
	if(media >= 7){
		cout << "Aprovado!";
	}
	else{
		cout << "Reprovado!";
	}
	
	return 0;
}
