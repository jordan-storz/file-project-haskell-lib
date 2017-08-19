module Filters (filterOutProjFiles) where

import ExtRecognize as Recognize

filterOutProjFiles :: [String] -> [String]
filterOutProjFiles = filter (not . isProj)

