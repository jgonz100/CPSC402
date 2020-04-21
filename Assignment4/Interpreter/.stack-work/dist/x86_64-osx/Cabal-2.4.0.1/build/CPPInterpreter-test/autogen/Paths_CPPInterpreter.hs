{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_CPPInterpreter (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/jgonzalez/Documents/CPSC402/Assignment4/Interpreter/.stack-work/install/x86_64-osx/1cf89c5f5e6061aebde85104162596e9b6d325d86981a434b0af3f7447568ceb/8.6.4/bin"
libdir     = "/Users/jgonzalez/Documents/CPSC402/Assignment4/Interpreter/.stack-work/install/x86_64-osx/1cf89c5f5e6061aebde85104162596e9b6d325d86981a434b0af3f7447568ceb/8.6.4/lib/x86_64-osx-ghc-8.6.4/CPPInterpreter-0.1.0.0-Icj08cURdTlxan7XOHlSa-CPPInterpreter-test"
dynlibdir  = "/Users/jgonzalez/Documents/CPSC402/Assignment4/Interpreter/.stack-work/install/x86_64-osx/1cf89c5f5e6061aebde85104162596e9b6d325d86981a434b0af3f7447568ceb/8.6.4/lib/x86_64-osx-ghc-8.6.4"
datadir    = "/Users/jgonzalez/Documents/CPSC402/Assignment4/Interpreter/.stack-work/install/x86_64-osx/1cf89c5f5e6061aebde85104162596e9b6d325d86981a434b0af3f7447568ceb/8.6.4/share/x86_64-osx-ghc-8.6.4/CPPInterpreter-0.1.0.0"
libexecdir = "/Users/jgonzalez/Documents/CPSC402/Assignment4/Interpreter/.stack-work/install/x86_64-osx/1cf89c5f5e6061aebde85104162596e9b6d325d86981a434b0af3f7447568ceb/8.6.4/libexec/x86_64-osx-ghc-8.6.4/CPPInterpreter-0.1.0.0"
sysconfdir = "/Users/jgonzalez/Documents/CPSC402/Assignment4/Interpreter/.stack-work/install/x86_64-osx/1cf89c5f5e6061aebde85104162596e9b6d325d86981a434b0af3f7447568ceb/8.6.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "CPPInterpreter_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "CPPInterpreter_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "CPPInterpreter_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "CPPInterpreter_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "CPPInterpreter_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "CPPInterpreter_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
