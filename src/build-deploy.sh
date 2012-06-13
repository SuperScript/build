
#### subs
#include "shout.sh"
#include "barf.sh"
#include "safe.sh"
#include "mkdir_mod.sh"

usage() {
  shout "usage: #TARGET# [ --help -n ] destdir subdir ..."
  exit 100
}

first_line() {
  first_line_value="`awk '1 {print $1}' < "$1"`"
  [ 0 -eq $? ] || barf "cannot first_line $*"
  printf "$first_line_value"
}
last_line()  {
  last_line_value="`awk '{l=$1}; END{print l}' < "$1"`"
  [ 0 -eq $? ] || barf "cannot last_line $*"
  printf "$last_line_value"
}

dry_or_run() {
  dry_or_run_value="$1"
  shift
  if [ 0 -eq $dry_or_run_value ]
  then
    "$@"
  else
    echo "$@"
  fi
}

#### main

umask 022
here="`env - PATH=$PATH pwd`"

dryrun=0
while [ $# -gt 0 ]
do
  case "$1" in
    --help)
      usage
      ;;
    -n)
      dryrun=1
      shift
      ;;
    --)
      shift
      break
      ;;
    *)
      break
      ;;
  esac
done

[ $# -gt 0 ] || usage

destdir="$1"
shift

[ -d "$destdir" ] || barf "no destination directory: $destdir"
[ -d package ] || barf "no package directory"

nondir=0
for d in "$@"
do
  [ -d "$d" ] && continue
  nondir=1
  shout "not a directory: $d"
done
[ 0 -eq $nondir ] || barf "deploy operates only on directories"

name="`first_line package/name`"
path="`first_line package/path`"
version="`last_line package/versions`"

safe cd "$destdir"
dry_or_run "$dryrun" safe mkdir_mod 01755 "$path"
[ -d "$path/$name-$version" ] \
  || dry_or_run "$dryrun" safe mkdir -m 0755 "$path/$name-$version"
safe cd "$here"

dry_or_run "$dryrun" safe cp -r "$@" "$destdir/$path/$name-$version/"

exit 0

