# SYNOPSIS
#   go_installer [options]
#
# USAGE
#  go_installer <vesion>
#

function go_installer -d "Install a given go version"
  if not count $argv > /dev/null
    printf "Usage: go_installer <vesion>"
    return 1
  end

  set ver go$argv[1]
  env GO111MODULE=on go get golang.org/dl/$ver
  eval "$ver download"
  ln -sf  ($ver env GOROOT)/bin/go $GOPATH/bin/
  ln -sf  ($ver env GOROOT)/bin/go-fmt $GOPATH/bin/
end
