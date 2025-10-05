# README

On the dependent side, declare the dependency like (`treeish` can be a tag or commit or branch):

    go get github.com/drmalex07/hello-octapus/hellogalaxy@${treeish}

The above will populate go.mod with version (if tag for semantic version is used) or pseudo-version for this module
