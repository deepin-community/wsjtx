#!/bin/sh

# to be invoked from uscan (debian/watch)

set -eux

: $0 "$@"
# $1 is expected to be "--upstream-version"
version="$2"
tarball="$3"

# unpack original tarball, move inner tarball in place
tar xf $tarball
#mv wsjtx-*/src/wsjtx.tgz ../wsjtx_$version+repack.orig.tar.gz
mk-origtargz --copyright-file debian/copyright --force-repack --version $version+repack wsjtx-*/src/wsjtx.tgz
rm -rf wsjtx-*/

# import into git
#gbp import-orig --pristine-tar --upstream-version=$version+repack ../wsjtx_$version+repack.orig.tar.xz

#dch -v $version+repack-1 "New upstream version $version."
