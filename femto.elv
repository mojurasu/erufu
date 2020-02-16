use re

-patterns = []

fn new [pattern sub]{
    -patterns = [$@-patterns [$pattern $sub]]
}

fn abbr [string]{
    for p $-patterns {
        pattern sub = $@p
        string = (re:replace $pattern $sub $string)
    }
    put $string
}
