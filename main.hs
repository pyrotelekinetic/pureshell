import System.Process (proc, createProcess)
import System.Exit (exitSuccess)

main = do
  l <- getLine
  eval l

eval :: String -> IO ()
eval "exit" = exitSuccess
eval x = do
  let (c : as) = words x
  createProcess $ proc c as
  main
