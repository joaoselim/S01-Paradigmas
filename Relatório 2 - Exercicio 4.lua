print("Digite dois números e o operador desejado(+-/*): ")
n1 = io.read()
n2 = io.read()
op = io.read()

tonumber(n1, n2)

local resultado
if op == "+" then
    resultado = n1 + n2
    print("Resultado: " ..resultado)
elseif op == "-" then
    resultado = n1 - n2
    print("Resultado: " ..resultado)
elseif op == "*" then
    resultado = n1 * n2
    print("Resultado: " ..resultado)
elseif op == "/" then
    resultado = n1 / n2
    print("Resultado: " ..resultado)
else
    print("Erro! Operador inválido")
end
