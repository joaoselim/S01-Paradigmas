data Banda = Banda
  { nomeBanda :: String
  , genero    :: String
  , cache     :: Double
  } deriving (Show)

data StatusEvento = Ativo | Encerrado | Cancelado
  deriving (Show, Eq)

data Evento = Evento
  { bandas :: [Banda]
  , status :: StatusEvento
  } deriving (Show)

custoTotalEvento :: Evento -> Double
custoTotalEvento (Evento lista Cancelado) = 0
custoTotalEvento (Evento lista _) =
    let totalCachê = sum (map cache lista)
        taxaProducao = totalCachê * 0.20
    in totalCachê + taxaProducao

bandaAbertura :: Evento -> String
bandaAbertura (Evento [] _) = "Nenhuma banda disponível."
bandaAbertura (Evento (b:_) _) = nomeBanda b

bandaEncerramento :: Evento -> String
bandaEncerramento (Evento [] _) = "Nenhuma banda disponível."
bandaEncerramento (Evento lista _) =
    nomeBanda (last lista)

rock :: Banda
rock = Banda "StoneFire" "Rock" 5000

pop :: Banda
pop = Banda "BlueStars" "Pop" 3200

metal :: Banda
metal = Banda "DarkSteel" "Metal" 7000

eletronica :: Banda
eletronica = Banda "NeonMix" "Eletrônica" 2800

eventoAtivo :: Evento
eventoAtivo = Evento [rock, pop, eletronica] Ativo

eventoEncerrado :: Evento
eventoEncerrado = Evento [metal, rock] Encerrado

eventoCancelado :: Evento
eventoCancelado = Evento [eletronica, pop] Cancelado

main :: IO ()
main = do
  putStrLn "EVENTO ATIVO"
  print eventoAtivo
  putStrLn ("Custo total: " ++ show (custoTotalEvento eventoAtivo))
  putStrLn ("Banda de abertura: " ++ bandaAbertura eventoAtivo)
  putStrLn ("Banda de encerramento: " ++ bandaEncerramento eventoAtivo)
  putStrLn ""

  putStrLn "EVENTO ENCERRADO"
  print eventoEncerrado
  putStrLn ("Custo total: " ++ show (custoTotalEvento eventoEncerrado))
  putStrLn ("Banda de abertura: " ++ bandaAbertura eventoEncerrado)
  putStrLn ("Banda de encerramento: " ++ bandaEncerramento eventoEncerrado)
  putStrLn ""

  putStrLn "EVENTO CANCELADO"
  print eventoCancelado
  putStrLn ("Custo total: " ++ show (custoTotalEvento eventoCancelado))
  putStrLn ("Banda de abertura: " ++ bandaAbertura eventoCancelado)
  putStrLn ("Banda de encerramento: " ++ bandaEncerramento eventoCancelado)
