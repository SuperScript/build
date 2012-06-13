#include "safe.sh"
mkdir_mod() {
  safe echo "$2" | safe tr '/' '\n' | safe xargs sh -c '
    p="."
    m="$1"
    shift
    for d in "$@"
    do
      p="$p/$d"
      [ -d "$p" ] || mkdir -m "$m" "$p"
    done
  ' mkdir_mod "$1"
}

