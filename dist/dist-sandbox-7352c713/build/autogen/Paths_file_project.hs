{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_file_project (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
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
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/jordanstorz/Documents/learning_haskell/exec-example/.cabal-sandbox/bin"
libdir     = "/Users/jordanstorz/Documents/learning_haskell/exec-example/.cabal-sandbox/lib/x86_64-osx-ghc-8.0.1/file-project-0.1.0.0-6luNL80b89Y4BElpw9kOrT"
datadir    = "/Users/jordanstorz/Documents/learning_haskell/exec-example/.cabal-sandbox/share/x86_64-osx-ghc-8.0.1/file-project-0.1.0.0"
libexecdir = "/Users/jordanstorz/Documents/learning_haskell/exec-example/.cabal-sandbox/libexec"
sysconfdir = "/Users/jordanstorz/Documents/learning_haskell/exec-example/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "file_project_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "file_project_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "file_project_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "file_project_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "file_project_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
