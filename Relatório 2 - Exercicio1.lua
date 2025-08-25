print("Insira dois numeros para termos um intervalo: ")
local m = tonumber(io.read())
local n = tonumber(io.read())
local i = m
print("Escolha outro numero para achar os multiplos dentro do intervalo: ")
local x = tonumber(io.read())
print("Os multiplos de " .. x .. " entre " .. m .. " e " .. n .. " sao: ")
for i=m, n, 1 do
  if i / x == math.floor(i / x) then
    print(i)
  end
end
