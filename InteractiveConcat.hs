interactiveConcatenating :: IO ()
interactiveConcatenating = do
    putStrLn "Choose two strings:"
    let concatenameEsta = (++) <$> getLine
    concatenado <- (++) <$> getLine <*> getLine
    putStrLn "Let's concatenate them:"
    putStrLn concatenado

main = interactiveConcatenating
