{-# LANGUAGE OverloadedStrings #-}
module Main where

import qualified Database.Memcache.Client as MemcacheClient
import qualified Database.Memcache.Types as MemcacheTypes
import Data.Maybe (Maybe(..))

type MemcacheResult =
  Maybe (MemcacheTypes.Value, MemcacheTypes.Flags, MemcacheTypes.Version)

connection :: IO MemcacheClient.Client
connection =
  MemcacheClient.newClient [MemcacheClient.def] MemcacheClient.def

set :: MemcacheClient.Client -> MemcacheTypes.Key -> MemcacheTypes.Value -> IO MemcacheTypes.Version
set connection key value =
  MemcacheClient.set connection key value 0 0

get :: MemcacheClient.Client -> MemcacheTypes.Key -> IO MemcacheResult
get =
  MemcacheClient.get

main :: IO ()
main = do
  mc <- connection

  get mc "counter" >>= print
  set mc "counter" "1"
  get mc "counter" >>= print
  set mc "counter" "2"
  get mc "counter" >>= print

  return ()