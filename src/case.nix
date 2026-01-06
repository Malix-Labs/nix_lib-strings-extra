{ lib, parse }:
let
  inherit (lib)
    concatMapStringsSep
    toSentenceCase
    toLower
    concatMapStrings
    ;

  inherit (parse)
    splitWords
    ;
in
{
  toTitleCase = string: concatMapStringsSep " " toSentenceCase (splitWords string);

  to_snake_case = string: concatMapStringsSep "_" toLower (splitWords string);

  to-kebab-case = string: concatMapStringsSep "-" toLower (splitWords string);

  ToPascalCase = string: concatMapStrings toSentenceCase (splitWords string);
}
