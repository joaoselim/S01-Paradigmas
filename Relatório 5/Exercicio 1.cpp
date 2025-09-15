#include <iostream>
using namespace std;

int fibonacci(int n){
	int resp;
	if(n == 0){
		return 0;
	}else if(n == 1){
		return 1;
	}else{
		resp = fibonacci(n-1) + fibonacci(n-2);
		return resp;
	}
}

int main()
{
	int n;
	cout << "Digite um numero: ";
	cin >> n;
	cout << endl << "Resultado igual a: " << fibonacci(n) << endl;
	
	return 0;
}
