# Nix Lib Strings Extra

## Requirements

- Nix Flakes

## Usage

`flake.nix`
```nix
{
  inputs = {
    nixpkgs.url = "<Whatever Url You Have>";

    lib_strings_extra = {
      url = "github:Malix-Labs/nix_lib-strings-extra";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      ...
    }:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = inputs;
      };
    };
}
```
