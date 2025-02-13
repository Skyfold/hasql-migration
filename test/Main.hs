-- |
-- Module      : Main
-- Copyright   : (c) 2014 Andreas Meingast <ameingast@gmail.com>
--               (c) 2016 Timo von Holtz <tvh@tvholtz.de>
--
-- License     : BSD-style
-- Maintainer  : tvh@tvholtz.de
-- Stability   : experimental
-- Portability : GHC
--
-- The test entry-point for hasql-migration.

{-# LANGUAGE OverloadedStrings #-}

module Main
    ( main
    ) where

import Hasql.Connection (acquire)
import Hasql.Connection.Setting (connection)
import Hasql.Connection.Setting.Connection (string)
import Hasql.MigrationTest
import Test.Hspec (hspec)

main :: IO ()
main = do
    conE <- acquire [ connection (string "dbname=postgres") ]
    case conE of
      Right con -> hspec (migrationSpec con)
      Left err -> putStrLn $ show err
