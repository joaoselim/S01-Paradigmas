data Item = Item
  { nomeItem  :: String
  , categoria :: String
  , precoItem :: Double
  } deriving (Show)

data CompraZelda = CompraZelda
  { itens :: [Item]
  } deriving (Show)

calculaDesconto :: [Item] -> Double
calculaDesconto lista =
  let total = sum (map precoItem lista)
  in if total > 200
       then total * 0.10
       else 0

valorFinal :: CompraZelda -> Double
valorFinal (CompraZelda lista)
  | totalItens <= 200 = totalItens + 15
  | otherwise         = totalItens - desconto
  where
    totalItens = sum (map precoItem lista)
    desconto   = calculaDesconto lista

espada :: Item
espada = Item "Espada de Ferro" "Arma" 120

poção :: Item
poção = Item "Poção de Vida" "Poção" 30

escudo :: Item
escudo = Item "Escudo de Aço" "Equipamento" 180

compra1 :: CompraZelda
compra1 = CompraZelda [espada, poção]

compra2 :: CompraZelda
compra2 = CompraZelda [espada, escudo]

compra3 :: CompraZelda
compra3 = CompraZelda [poção]

main :: IO ()
main = do
  putStrLn "COMPRA 1"
  print compra1
  putStrLn ("Valor final: " ++ show (valorFinal compra1))
  putStrLn ""

  putStrLn "COMPRA 2"
  print compra2
  putStrLn ("Valor final: " ++ show (valorFinal compra2))
  putStrLn ""

  putStrLn "COMPRA 3"
  print compra3
  putStrLn ("Valor final: " ++ show (valorFinal compra3))
