#include "barf.sh"
safe() { "$@" || barf "cannot $*"; }
