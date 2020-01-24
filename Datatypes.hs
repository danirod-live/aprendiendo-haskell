data Color = RGB { red :: Int, green :: Int, blue :: Int }

colorarray :: Color -> [Int]
colorarray (RGB { red = r, green = g, blue = b }) = [r,g,b]
