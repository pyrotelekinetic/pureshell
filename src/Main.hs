import System.Process (proc, createProcess)
import System.Exit (exitSuccess)
import System.Directory (setCurrentDirectory)

main = do
  l <- getLine
  eval l

eval :: String -> IO ()
eval [] = main
eval "exit" = exitSuccess
eval ('c' : 'd' : ' ' : dir) = do
  setCurrentDirectory dir
  main
eval x = do
  let (c : as) = words x
  createProcess $ proc c as
  main
