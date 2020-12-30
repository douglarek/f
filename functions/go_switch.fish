function go_switch --argument-names 'verzion' # since version in fish shell is a bulit-in var
    if not test -n "$verzion"
        echo "Usage: go_switch [version]"
        return 1
    end

    if not type -q go{$verzion}
        echo "Go $verzion doesn't exist, start downloading..."
        go get golang.org/dl/go{$verzion}; or return 1
        go{$verzion} download; or return 1
    end

    go{$verzion} download &> /dev/null; or return 1 # maybe go binary not downloaded, so try it
    set go_bin (command -v "go$verzion")
    ln -sf $go_bin ~/bin/go; or return 1
    echo "Switched to Go $verzion"
    set -gx fish_greeting ''
    exec fish # reload fish
end
