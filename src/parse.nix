{ lib, characters }:
let
  inherit (lib)
    splitStringBy
    elem
    filter
    concatMap
    lowerChars
    upperChars
    ;

  inherit (characters)
    digits
    wordChars
    ;
in
{
  splitWords =
    str:
    let
      # Step 1: Split by any non-alphanumeric character (discarding them)
      # This handles spaces, underscores, hyphens, dots, etc.
      parts = splitStringBy (prev: curr: !elem curr wordChars) false str;

      # Step 2: Split each part by case transitions (camelCase) or digit transitions (v1)
      splitPart =
        part:
        splitStringBy (
          prev: curr:
          prev != ""
          && ((elem prev lowerChars && elem curr upperChars) || (elem prev digits != elem curr digits))
        ) true part;
    in
    filter (s: s != "") (concatMap splitPart parts);
}
