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
	int tamanho;
	
	cout << "Insira o tamanho do vetor: ";
	cin >> tamanho;
	float arr[tamanho];
	
	cout << "Insira os valores desejados(reais): ";
	for(int i=0; i<tamanho; i++){
		cin >> arr[i];
	}
	
	cout << "Soma dos valores inseridos: " << somarArray(arr, tamanho);;
	
	return 0;
}
