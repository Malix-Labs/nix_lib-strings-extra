{ lib }:
let
  inherit (lib)
    lowerChars
    upperChars
    stringToCharacters
    ;

  chars = lowerChars ++ upperChars;
  digits = stringToCharacters "0123456789";
in
{
  inherit
    chars
    digits
    ;

  wordChars = chars ++ digits;
}
