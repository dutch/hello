#!/bin/sh

set -e

me=$(basename $0)

AUTORECONF=${AUTORECONF-autoreconf}
AUTOM4TE=${AUTOM4TE-autom4te}

$AUTORECONF --install

ninjap=$($AUTOM4TE --language=autoninja --trace=AN_INIT configure.ac)
if test ! -z $ninjap; then
    bin/autoninja
fi
