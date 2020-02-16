use re

SETENV_PATTERN = 'setenv (?P<name>\w+) (?P<value>.*);'
UNSETENV_PATTERN = 'unsetenv (?P<name>\w+)'


fn -eval-csh [shell_code]{
    for l $shell_code {
        if (re:match "^setenv" $l) {
            match = (re:find $SETENV_PATTERN $l)[groups][1:]
            set-env $match[0][text] $match[1][text]
        } elif (re:match "^unsetenv" $l) {
            match = (re:find $UNSETENV_PATTERN $l)[groups][1:]
            unset-env $match[0][text]
        } elif (re:match "^echo" $l) {
            echo (re:replace "(echo |;)" "" $l)
        } else {
            echo (styled "warning:" yellow) "unknown command passed to ssh-agent:-eval-csh: `"$l"`"
        }
    }
}


fn run [&bind_adress=$nil &foreground=$false &debug=$false &fingerprint_hash=$nil &pkcs11_whitelist=$nil &lifetime=$nil]{
    # -c flag for csh mode since that one is easier to parse
    agent_args = ["-c"]

    if (not-eq $bind_adress $nil) { agent_args = [$@agent_args "-a" $bind_adress] }
    if (eq $foreground $true) { agent_args = [$@agent_args "-D"] }
    if (eq $debug $true) { agent_args = [$@agent_args "-d"] }
    if (not-eq $fingerprint_hash $nil) { agent_args = [$@agent_args "-E" $fingerprint_hash] }
    if (not-eq $pkcs11_whitelist $nil) { agent_args = [$@agent_args "-P" $pkcs11_whitelist] }
    if (not-eq $lifetime $nil) { agent_args = [$@agent_args "-t" $lifetime] }

    -eval-csh [(e:ssh-agent $@agent_args)]
}


fn kill {
    -eval-csh [(e:ssh-agent -k -c)]
}
