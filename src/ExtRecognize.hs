module ExtRecognize (isProj) where


validate :: String -> String -> Bool
validate ext = (== ext) . extractExtension

isProj :: String -> Bool
isProj = validate "proj"

extractExtension :: String -> String
extractExtension = reverse . takeWhile (/= '.') . reverse

