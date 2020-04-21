{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_CPPTypeChecker (
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

bindir     = "/Users/jgonzalez/Documents/CPSC402/Assignment3/Typechecker/.stack-work/install/x86_64-osx/1cf89c5f5e6061aebde85104162596e9b6d325d86981a434b0af3f7447568ceb/8.6.4/bin"
libdir     = "/Users/jgonzalez/Documents/CPSC402/Assignment3/Typechecker/.stack-work/install/x86_64-osx/1cf89c5f5e6061aebde85104162596e9b6d325d86981a434b0af3f7447568ceb/8.6.4/lib/x86_64-osx-ghc-8.6.4/CPPTypeChecker-0.1.0.0-I314KGq9QxA8gjNTvTdRSg-CPPTypeChecker-exe"
dynlibdir  = "/Users/jgonzalez/Documents/CPSC402/Assignment3/Typechecker/.stack-work/install/x86_64-osx/1cf89c5f5e6061aebde85104162596e9b6d325d86981a434b0af3f7447568ceb/8.6.4/lib/x86_64-osx-ghc-8.6.4"
datadir    = "/Users/jgonzalez/Documents/CPSC402/Assignment3/Typechecker/.stack-work/install/x86_64-osx/1cf89c5f5e6061aebde85104162596e9b6d325d86981a434b0af3f7447568ceb/8.6.4/share/x86_64-osx-ghc-8.6.4/CPPTypeChecker-0.1.0.0"
libexecdir = "/Users/jgonzalez/Documents/CPSC402/Assignment3/Typechecker/.stack-work/install/x86_64-osx/1cf89c5f5e6061aebde85104162596e9b6d325d86981a434b0af3f7447568ceb/8.6.4/libexec/x86_64-osx-ghc-8.6.4/CPPTypeChecker-0.1.0.0"
sysconfdir = "/Users/jgonzalez/Documents/CPSC402/Assignment3/Typechecker/.stack-work/install/x86_64-osx/1cf89c5f5e6061aebde85104162596e9b6d325d86981a434b0af3f7447568ceb/8.6.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "CPPTypeChecker_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "CPPTypeChecker_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "CPPTypeChecker_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "CPPTypeChecker_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "CPPTypeChecker_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "CPPTypeChecker_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
