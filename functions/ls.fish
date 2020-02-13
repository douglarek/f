function ls --description 'List contents of directory'
    set -l opt -G
            command ls $opt $argv
end
funcsave ls
