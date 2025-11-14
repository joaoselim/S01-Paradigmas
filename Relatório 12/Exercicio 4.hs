data Servico = Servico
  { nome :: String
  , tipo :: String
  , precoBase :: Double
  } deriving (Show)

data Status = EmAndamento | Finalizado | Cancelado
  deriving (Show, Eq)

data Atendimento = Atendimento
  { servicos :: [Servico]
  , status   :: Status
  } deriving (Show)

bonusEspiritual :: [Servico] -> Double
bonusEspiritual lista =
  let soma = sum (map precoBase lista)
      somaBonus = if length lista > 3
                    then soma * 1.25
                    else soma
      somaFinal = if somaBonus > 500
                    then somaBonus * 0.90
                    else somaBonus
  in somaFinal

valorFinalAtendimento :: Atendimento -> Double
valorFinalAtendimento at
  | status at == Cancelado = 0
  | otherwise = bonusEspiritual (servicos at)

descricaoPrimeiroServico :: Atendimento -> String
descricaoPrimeiroServico at =
  case servicos at of
    [] -> "Nenhum serviço realizado."
    (s:_) -> "Primeiro serviço: " ++ nome s ++ " (" ++ tipo s ++ ")"

main :: IO ()
main = do
  let s1 = Servico "Banho de Ervas" "Banho" 120
  let s2 = Servico "Massagem Ritual" "Massagem" 200
  let s3 = Servico "Banquete Real" "Banquete" 300
  let s4 = Servico "Esfoliação Espiritual" "Limpeza" 150

  let at1 = Atendimento [s1, s2] Finalizado
  let at2 = Atendimento [s1, s2, s3, s4] Finalizado
  let at3 = Atendimento [s3] Cancelado

  putStrLn "- Atendimento 1"
  print at1
  putStrLn ("Valor final: " ++ show (valorFinalAtendimento at1))
  putStrLn (descricaoPrimeiroServico at1)

  putStrLn "\n- Atendimento 2"
  print at2
  putStrLn ("Valor final: " ++ show (valorFinalAtendimento at2))
  putStrLn (descricaoPrimeiroServico at2)

  putStrLn "\n- Atendimento 3"
  print at3
  putStrLn ("Valor final: " ++ show (valorFinalAtendimento at3))
  putStrLn (descricaoPrimeiroServico at3)
