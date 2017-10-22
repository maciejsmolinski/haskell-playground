{-# LANGUAGE OverloadedStrings #-}
module Main where

import qualified Database.Memcache.Client as MemcacheClient
import qualified Database.Memcache.Types as MemcacheTypes
import Data.Maybe (Maybe(..))
import Data.Function (flip)
import Control.Monad.Reader (ReaderT, runReaderT, ask)
import Control.Monad.IO.Class (liftIO)

type MemcacheResult =
  Maybe (MemcacheTypes.Value, MemcacheTypes.Flags, MemcacheTypes.Version)

connection :: IO MemcacheClient.Client
connection =
  MemcacheClient.newClient [MemcacheClient.def] MemcacheClient.def

get :: MemcacheTypes.Key -> ReaderT MemcacheClient.Client IO MemcacheResult
get key = do
  connection <- ask
  liftIO $ MemcacheClient.get connection key

set :: MemcacheTypes.Key -> MemcacheTypes.Value -> ReaderT MemcacheClient.Client IO MemcacheTypes.Version
set key value = do
  connection <- ask
  liftIO $ MemcacheClient.set connection key value 0 0

flush :: ReaderT MemcacheClient.Client IO ()
flush = do
  connection <- ask
  liftIO $ MemcacheClient.flush connection Nothing

main :: IO ()
main = do
  mc <- connection

  flip runReaderT mc $ do
    flush
    get "counter" >>= liftIO . print
    set "counter" "1"
    get "counter" >>= liftIO . print
    set "counter" "2"
    get "counter" >>= liftIO . print

  return ()
