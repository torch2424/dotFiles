# Collection of functions to add IDE like commands to terminal
searchjsproject() {
  
  PATTERN=$1
  DIRECTORY="./"

  if [ $# -eq 2 ]; then
    DIRECTORY=$2
  fi

  if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
    echo "searchjsproject USAGE:"
    echo "searchjsproject [pattern]"
    echo "searchjsproject [pattern] [directory]"
  else
    grep --exclude-dir={**/node_modules,**/*dist*,**/*build*,**/.git,**/.docz,**/third_party} -rn $DIRECTORY -e $PATTERN
  fi
}

alias searchproject='searchjsproject'
