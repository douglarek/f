# SYNOPSIS
#   go_update_tools [options]
#
# USAGE
#   Options
#

function go_tools -d "install or update go tools"
  go get -x -v golang.org/x/tools/cmd/goimports
  go get -x -v github.com/golang/dep/cmd/dep
  go get -x -v honnef.co/go/tools/...
  go get -x -v github.com/nishanths/license
  go get -x -v github.com/ramya-rao-a/go-outline
  go get -x -v github.com/acroca/go-symbols
  go get -x -v github.com/mdempsky/gocode
  go get -x -v github.com/rogpeppe/godef
  go get -x -v golang.org/x/tools/cmd/godoc
  go get -x -v github.com/zmb3/gogetdoc
  go get -x -v github.com/golang/lint/golint
  go get -x -v github.com/fatih/gomodifytags
  go get -x -v github.com/uudashr/gopkgs/cmd/gopkgs
  go get -x -v golang.org/x/tools/cmd/gorename
  go get -x -v sourcegraph.com/sqs/goreturns
  go get -x -v github.com/cweill/gotests/...
  go get -x -v golang.org/x/tools/cmd/guru
  go get -x -v github.com/josharian/impl
  go get -x -v github.com/haya14busa/goplay/cmd/goplay
end

