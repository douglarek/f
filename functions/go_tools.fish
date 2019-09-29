# SYNOPSIS
#   go_update_tools [options]
#
# USAGE
#   Options
#

function go_tools -d "install or update go tools"
  getopts $argv | while read -l 1 2
    switch "$1"
      case _

      case u update
        set flags $flags "-u"

      case h help
        printf "Usage: go_tools [--update]\n"

        printf "     -u --update              Update go tools\n"
        printf "     -h --help                Show this help\n"
        return

      case \*
        printf "go_tools: '%s' is not a valid option\n" $1 >& 2
        go_tools --help >& 2
        return 1
    end
  end

  set -l pkgs                                        \
    "golang.org/x/tools/cmd/goimports"               \
    "honnef.co/go/tools/..."                         \
    "github.com/nishanths/license"                   \
    "github.com/ramya-rao-a/go-outline"              \
    "github.com/acroca/go-symbols"                   \
    "github.com/rogpeppe/godef"                      \
    "golang.org/x/tools/cmd/godoc"                   \
    "github.com/zmb3/gogetdoc"                       \
    "golang.org/x/lint/golint"                       \
    "github.com/fatih/gomodifytags"                  \
    "github.com/uudashr/gopkgs/cmd/gopkgs"           \
    "golang.org/x/tools/cmd/gorename"                \
    "github.com/cweill/gotests/..."                  \
    "golang.org/x/tools/cmd/guru"                    \
    "github.com/josharian/impl"                      \
    "github.com/haya14busa/goplay/cmd/goplay"        \
    "github.com/davidrjenni/reftools/cmd/fillstruct" \
    "github.com/go-delve/delve/cmd/dlv"              \
    "github.com/golangci/golangci-lint/cmd/golangci-lint" \
    "golang.org/x/tools/cmd/gopls"                   \

  for p in $pkgs
    env GO111MODULE=on go get $flags $p
  end

end
