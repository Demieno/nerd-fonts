#!/bin/bash
# version: 1.1.0
# calls the necessary scripts in the necessary order to prepare for a release

#set -x
if [ ! $# -eq 1 ]
  then
    echo "# No release version given, must give semver release versionin format: #.#.#, e.g. 1.1.0"
fi

release=$1

./version-bump.sh "$release"
#./build-latest-py3-version.sh
./standardize-and-complete-readmes.sh
./gotta-patch-em-all-font-patcher!.sh
./generate-fontconfig.sh
./generate-casks.sh
./archive-fonts.sh
./upload-archives.sh

exit

