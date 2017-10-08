# SYNOPSIS
#   go_update_tools [options]
#
# USAGE
#   Options
#

function go_tools -d "install or update go tools"
  for i in "josharian/impl" "nishanths/license" "nsf/gocode" "rogpeppe/godef" "golang/lint/golint" "golang/dep/cmd/dep" "nishanths/go-hgconfig"
    go get -u -x github.com/$i
  end

  for i in "cmd/gorename" "cmd/goimports" "cmd/guru"
    go get -u -x golang.org/x/tools/$i
  end

  go get -u -x honnef.co/go/tools/...

  go get -u -x github.com/zmb3/gogetdoc
  go get -u -x github.com/ramya-rao-a/go-outline
  go get -u -x sourcegraph.com/sqs/goreturns
  go get -u -x github.com/uudashr/gopkgs/cmd/gopkgs
  go get -u -x github.com/acroca/go-symbols
  go get -u -x github.com/cweill/gotests/...
  go get -u -x golang.org/x/tools/cmd/godoc
  go get -u -x github.com/fatih/gomodifytags
end

