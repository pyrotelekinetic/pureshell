import System.Process (proc, createProcess)

main = do
  l <- getLine
  let (c : as) = words l
  createProcess $ proc c as

  main
