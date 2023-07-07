function __gitmoji_available
  for cmd in $argv
    if which (string match -r '^[\S]+' "$cmd") 2&> /dev/null;
      echo $cmd
      break
    end
  end
end

function __gitmoji -d 'Gitmoji completion for fish shell'
  set -q GITMOJI_FILTER; or set -l GITMOJI_FILTER 'fzy' 'fzf' 'peco' 'percol'
  set -l buf (commandline -t)
  set -l cursor (commandline -C)
  set -l lbuf (commandline -tc)
  set -l rbuf (string sub --start=(math (string length -- $lbuf) +1) $buf)

  set -l query ''
  set -l mode 'insert'
  if test -n $lbuf
    set -l lquery (string match -r ':?[a-z0-9\+\-\_]+$' -- $lbuf)
    set lbuf (string sub --length=(math (string length -- $lbuf) - (string length -- $lquery; or echo 0)) -- $lbuf)
    set -l rquery (string match -r '^[a-z0-9\+\-\_]+:?' -- $rbuf)
    set rbuf (string sub --start=(math (string length -- $rquery; or echo 0) +1) -- $rbuf)
    set query "$lquery$rquery"

    if string length -q -- $rquery
      set mode 'replace'
    end
  end

  cat (dirname (realpath (status -f)))/../conf.d/gitmoji.tsv \
    | awk '{ print $1"\t"$2}' \
    | eval (__gitmoji_available $GITMOJI_FILTER)" --query '$query'" \
    | string match -r '^[\S]' \
    | read -l emoji
  
  if test -n $emoji
    set nbuf "$lbuf$emoji$rbuf"
    if test $mode = 'insert'
      set cursor (math $cursor + (string length -- $nbuf) - (string length -- $buf))
    end
    commandline -rt $nbuf
    commandline -C $cursor
  end
  commandline -f repaint
end
