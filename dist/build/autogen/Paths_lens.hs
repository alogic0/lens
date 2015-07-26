module Paths_lens (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [4,12,2] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/.cabal/bin"
libdir     = "/home/.cabal/lib/i386-linux-ghc-7.10.1/lens_1Jl0JjfWoYH8fOckK0k1ws"
datadir    = "/home/.cabal/share/i386-linux-ghc-7.10.1/lens-4.12.2"
libexecdir = "/home/.cabal/libexec"
sysconfdir = "/home/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "lens_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "lens_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "lens_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "lens_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "lens_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
