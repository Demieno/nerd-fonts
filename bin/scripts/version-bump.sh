#!/bin/bash
# version: 1.1.0
# bump version number for release in scripts (bash and python)
# does not do semver format checking
# this obviously is not perfect but works good enough for now (YAGNI)
# todo take some ideas from: https://github.com/fsaintjacques/semver-tool

#set -x
if [ ! $# -eq 1 ]
  then
    echo "# No release version given, must give semver release versionin format: #.#.#, e.g. 1.1.0"
fi

release=$1

sed -i "s|[0-9]\.[0-9]\.[0-9]|$release|g" ../../font-patcher
sed -i "s|\# version: [0-9]\.[0-9]\.[0-9]|\# version: $release|g" ../../bin/scripts/*.sh
sed -i "s|version=\"[0-9]\.[0-9]\.[0-9]\"|version=\"$release\"|g" ../../bin/scripts/*.sh

exit

