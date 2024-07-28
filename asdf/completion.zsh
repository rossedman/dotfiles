completion=$(brew --prefix asdf)/etc/bash_completion.d/asdf.bash

if test -f $completion
then
  source $completion
fi