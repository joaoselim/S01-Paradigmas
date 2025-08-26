print("Digite os números, digite letra para sair: ")

local entrada = io.read()
local i = 1
local t = {}
while true do
  num = tonumber(entrada)
  if num == nil then
      break
  end
  t[i] = num
  entrada = io.read()
  i = i + 1
end

local maior = t[1]
for _, num in ipairs(t) do
    if num > maior then
        maior = num
    end
end

print("O maior número é: " .. maior)
