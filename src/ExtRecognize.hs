module ExtRecognize (isProj) where


isProj :: String -> Bool
isProj = (== "proj") . extractExtension

extractExtension :: String -> String
extractExtension = reverse . takeWhile (/= '.') . reverse

