#!/bin/bash
set -e
ONE=$1
TWO=$2
VERSION=3.2.0
if [[ "$1" != "" ]]; then
    VERSION=$1
    shift
fi
GCPROJECT=kubeadm-167321
if [[ "" != "${TWO}" ]]; then
    GCPROJECT=${TWO}
    shift
fi
echo "${VERSION} version"
echo "${GCPROJECT} project"


for f in *; do
    if [[ -d $f ]]; then
        pushd $f
        ./build.sh ${VERSION} ${GCPROJECT} "$@"
        popd
    fi
done