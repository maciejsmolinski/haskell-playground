{-# LANGUAGE OverloadedStrings #-}
module Main where

import qualified Database.Memcache.Client as MemcacheClient
import qualified Database.Memcache.Types as MemcacheTypes
import Data.Maybe (Maybe(..))

type MemcacheResult = Maybe (MemcacheTypes.Value, MemcacheTypes.Flags, MemcacheTypes.Version)

printValue :: MemcacheResult -> IO ()
printValue Nothing = putStrLn "Miss"
printValue (Just (value, _, _)) = putStrLn $ "Hit: " ++ show value

main :: IO ()
main = do
  mc <- MemcacheClient.newClient [MemcacheClient.def] MemcacheClient.def
  -- MemcacheClient.set mc "key" "Hello World" 0 0
  value <- MemcacheClient.get mc "key"
  printValue value
