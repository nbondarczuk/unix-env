
#!/bin/bash

# gocode is used by many editors to provide intellisense
go install github.com/nsf/gocode@latest

# goimports is something you should run when saving code to fill in import paths
go install golang.org/x/tools/cmd/goimports@latest

# gorename is used by many editors to provide identifier rename support
go install golang.org/x/tools/cmd/gorename@latest

# oracle is a tool that help with code navigation and search
go install golang.org/x/tools/cmd/oracle@latest

# golint should be run after every build to check your code
go install github.com/golang/lint/golint@latest

cd $HOME
mkdir -p install
git clone https://github.com/creack/dotfiles
