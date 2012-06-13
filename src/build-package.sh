#include "shout.sh"
#include "barf.sh"
#include "safe.sh"
usage() {
  shout "usage: #TARGET# [ --help ] destdir path dir ..."
  exit 100
}
####
umask 022
here=`env - PATH=$PATH pwd`

#### subs

first_line() { awk '1 {print $1}' < "$1"; }
last_line()  { awk '{l=$1}; END{print l}' < "$1"; }

#### main

while [ $# -gt 0 ]
do
  case "$1" in
    --help)
      usage
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

[ 2 -le $# ] || usage

destdir="$1"
[ -d "$destdir" ] || barf "destdir is not an existing directory: $destdir"
shift

path="$1"
[ -d "$path" ] || barf "path is not an existing directory: $path"
shift

base="`basename "$path"`"

dest="$destdir/$base"
safe rm -f "$tmp"
{ safe echo "$path" | safe tr '/' '\n' | safe xargs sh -c '
    t="$1"
    shift
    for d in "$@"
    do
      if [ "X$p" = "X" ]
      then
	p="$d"
      else
	p="$p/$d"
      fi
      tar -rnf "$t" "$p"
    done
  ' build-package-tar "$dest.tar.tmp"

  for d in "$@"
  do
    safe tar -rf "$dest.tar.tmp" "$path/$d"
  done
}

safe gzip -c "$dest.tar.tmp" > "$dest.tar.gz.tmp"
rm -f "$dest.tar.tmp"
safe mv "$dest.tar.gz.tmp" "$dest.tar.gz"

exit 0

