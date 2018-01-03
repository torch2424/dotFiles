#!/bin/bash

# Bebop.sh
# By: torch2424
# repo: https://github.com/torch2424/bebop.sh
# LICENSE: Apache 2.0


# Simply print some new lines for a script
print-spacing() {
    echo " "
        echo " "
    }

    # Prompt the user for sudo access
    get-sudo() {
        [ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"
    }

    # Timeout before running next command
    command-delay() {
        sleep 2
    }

    #Find a line containing the text, and replace the entire line with the other passed text
    #Reference: http://stackoverflow.com/questions/11245144/replace-whole-line-containing-a-string-using-sed
    #@param $1 - The First argument, The Text to be found in a file
    #@param $2 - The second argument, the line the will be replacing the entire first line
    #@param $3 - The Third/Last argument, the file this function will be run against
    find-replace-line() {
        sed -i "/$1/c$2" $3
    }

    # Set Colors
    # Taken From: https://natelandau.com/bash-scripting-utilities/

    bold=$(tput bold)
    underline=$(tput sgr 0 1)
    reset=$(tput sgr0)

    purple=$(tput setaf 171)
    red=$(tput setaf 1)
    green=$(tput setaf 76)
    tan=$(tput setaf 3)
    blue=$(tput setaf 38)

    # Headers and  Logging
    # Taken From: https://natelandau.com/bash-scripting-utilities/

    e_header() { printf "\n${bold}${purple}====  %s  ====${reset}\n" "$@"
    }
    e_arrow() { printf "~~> $@\n"
    }
    e_success() { printf "${green}* %s${reset}\n" "$@"
    }
    e_error() { printf "${red}X %s${reset}\n" "$@"
    }
    e_warning() { printf "${tan}~~> %s${reset}\n" "$@"
    }
    e_underline() { printf "${underline}${bold}%s${reset}\n" "$@"
    }
    e_bold() { printf "${bold}%s${reset}\n" "$@"
    }
    e_note() { printf "${underline}${bold}${blue}Note:${reset}  ${blue}%s${reset}\n" "$@"
    }

    # USAGE FOR SEEKING CONFIRMATION
    # seek_confirmation "Ask a question"
    # Credt: https://github.com/kevva/dotfiles
    # Taken From: https://natelandau.com/bash-scripting-utilities/
    # 
    # if is_confirmed; then
    #   some action
    # else
    #   some other action
    # fi

    seek_confirmation() {
          printf "\n${bold}$@${reset}"
            read -p " (y/n) " -n 1
              printf "\n"
          }

          # underlined
          seek_confirmation_head() {
                printf "\n${underline}${bold}$@${reset}"
                  read -p "${underline}${bold} (y/n)${reset} " -n 1
                    printf "\n"
                }

                # Test whether the result of an 'ask' is a confirmation
                is_confirmed() {
                    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
                          return 0
                      fi
                      return 1
                  }

                  # Test whether a command exists
                  # $1 = cmd to test
                  # Taken From: https://natelandau.com/bash-scripting-utilities/
                  # Usage:
                  # if type_exists 'git'; then
                  #   some action
                  # else
                  #   some other action
                  # fi

                  type_exists() {
                      if [ $(type -P $1) ]; then
                            return 0
                        fi
                        return 1
                    }

                    # Test which OS the user runs
                    # Taken From: https://natelandau.com/bash-scripting-utilities/
                    # $1 = OS to test
                    # Usage: if is_os 'darwin'; then

                    is_os() {
                        if [[ "${OSTYPE}" == $1* ]]; then
                              return 0
                          fi
                          return 1
                      }
