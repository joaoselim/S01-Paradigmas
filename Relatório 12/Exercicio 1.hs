data Bebida = Bebida
  { nome  :: String
  , tipo  :: String
  , preco :: Float
  } deriving (Show)

data Status = Aberto | Entregue | Cancelado
  deriving (Show, Eq)

data Pedido = Pedido
  { bebidas :: [Bebida]
  , status  :: Status
  } deriving (Show)

valorTotalPedido :: Pedido -> Float
valorTotalPedido (Pedido lista Cancelado) = 0
valorTotalPedido (Pedido lista _) =
  let soma = sum (map preco lista)
  in soma + 5.0

primeiraBebida :: Pedido -> String
primeiraBebida (Pedido [] _) = "Nenhuma bebida no pedido."
primeiraBebida (Pedido (b:_) _) = nome b

main :: IO ()
main = do
  let b1 = Bebida "Latte" "Café" 12.0
  let b2 = Bebida "Chá Verde" "Chá" 8.0
  let pedido = Pedido [b1, b2] Aberto

  putStrLn ("Primeira bebida: " ++ primeiraBebida pedido)
  putStrLn ("Valor total: " ++ show (valorTotalPedido pedido))
