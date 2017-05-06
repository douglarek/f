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
  for i in "simple/cmd/gosimple" "unused/cmd/unused"
    go get -u -x honnef.co/go/$i
  end
end

