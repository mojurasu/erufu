# erufu
Collection of elvish modules

## Installation
```
use epm
epm:install github.com/mojurasu/erufu
```

## Modules
### ssh-agent
Makes it possible to use the OpenSSH Agent with elvish.

`ssh-agent:run` Runs the ssh-agent and sets the required environment variables. Supported Arguments: `bind_adress`, `foreground`, `debug`, `fingerprint_hash`, `pkcs11_whitelist`, `lifetime` (look at the man page of ssh-agent on how to use them)

`ssh-agent:kill` Kill the current ssh-agent and unset its environment variables. 

### femto
Apply multiple regex replacements on a value

`femto:new <pattern> <sub>` Add a new regex pattern that should be replaced by sub

`femto:abbr <string>` Apply all replacements created using `femto:new` to the string and return the new value

### cu
Module for the [CommonUnits](https://commonunits.org/) draft

`cu:clarkes` Returns the current time in clarkes

`cu:time` Convenience function that outputs the current time in kiloclarkes with the unit symbol attached
