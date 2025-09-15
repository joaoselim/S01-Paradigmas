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

i=1
local pares ={}
for _, num in ipairs(t) do
    if num % 2 == 0 then
        pares[i] = num
        i = i + 1
    end
end

print("Os números pares são: ")
for _, num in ipairs(pares) do
  print(num)
end
