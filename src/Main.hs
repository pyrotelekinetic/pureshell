import System.Process (proc, createProcess)
import System.Exit (exitSuccess)
import System.Directory (setCurrentDirectory)
import Control.Exception (try, IOException)

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
  a <- try' . createProcess $ proc c as
  case a of
    Left e -> do
      print e
      main
    Right r -> main
  where
    try' :: IO a -> IO (Either IOException a)
    try' = try
