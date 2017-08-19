module Main where

import ExtRecognize as Recognize
import Filters(filterOutProjFiles)
import Test.Hspec


main :: IO ()
main = hspec $ do


  describe "Recognize proj filename" $ do
    it "should be true when given valid filename" $ do
      let validFileName = "something.proj" 
      Recognize.isProj validFileName `shouldBe` True

  describe "Reject non proj filename" $ do
    it "should be false when given invalid filename" $ do
      let invalidFileName = "something.cs"
      Recognize.isProj invalidFileName `shouldBe` False

  describe "Filter should take out proj files" $ do
    it "should remove filenames that have proj extension" $ do
      let
        originalList =
           ["something.proj", "something.cs", "broke.js", "file.proj"]
        expectedList =
           ["something.cs", "broke.js"]
      filterOutProjFiles originalList `shouldBe` expectedList
