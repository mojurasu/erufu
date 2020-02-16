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
