#include <iostream>
using namespace std;

double celsiusParaFahrenheit(double celsius){
	double resp;
	resp = ((celsius * 9)/5) + 32;
	
	return resp;
}

double celsiusParaKelvin(double celsius){
	double resp;
	resp = celsius + 273;
	
	return resp;
}

int main()
{
	double temp;
	int opcao;
	
	do{
	cout << "Oque deseja fazer? " << endl;
	cout << "1 - Converter Celsius para Fahrenheit" << endl;
	cout << "2 - Converter Celsius para Kelvin" << endl;;
	cout << "3 - sair" << endl;
	cin >> opcao;
	cout << endl;
	
	if(opcao == 1){
		cout << "Insira a temperatura que se deseja converter: ";
		cin >> temp;
		cout << temp << " graus Celcius em Fahrenheit fica: " << celsiusParaFahrenheit(temp) << endl << endl;
	}
	if(opcao == 2){
		cout << "Insira a temperatura que se deseja converter: ";
		cin >> temp;
		cout << temp << " graus Celcius em Kelvin fica: " << celsiusParaKelvin(temp) << endl << endl;
	}
	}while(opcao != 3);
	
	return 0;
}
