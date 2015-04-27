import           Application
-- import           Prelude              (IO)
import           Import
import           Settings             (parseExtra)
import           Yesod.Default.Config --  (fromArgs)
import           Yesod.Default.Main   (defaultMainLog)
import Control.Monad

-- mkYesodDispatch "App" resourcesApp

config :: IO (AppConfig DefaultEnv Extra)
config = return (cfg extra)
  where cfg = AppConfig Development 3000 "http://yesodportal.fpcenter.io:3000" "*4"
        extra = Extra "Copyright statement" Nothing
 {- host: "*4" # any IPv4 host
  port: 3000
  approot: "http://localhost:3000"
  copyright: Insert copyright statement here
  #analytics: UA-YOURCODE
-}


main :: IO ()
main = do
  app <- config >>= makeFoundation
  warpEnv app
