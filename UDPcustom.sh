#!/bin/bash
#Version : ⇢ 2.7-pro
udp_dir='/etc/UDPCustom'
#source $udp_dir/module

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Local Module
#source ./module/module
case $newlang in
en_US)
  a_enter=' ⇢  Press enter to continue'
  a_back=' ⇢  RETURN'
  a_selection_fun=' ⇢  Select an option:'
  ;;
esac

# varibles
export _hora=$(printf '%(%H:%M:%S)T')
export _fecha=$(printf '%(%D)T')

export numero='^[0-9]+$'
export texto='^[A-Za-z]+$'
export txt_num='^[A-Za-z0-9]+$'

# 🔹color interfaces🔹colored interfaces
msg() {
  COLOR[0]='\033[1;37m' #BRAN='\033[1;37m'
  COLOR[1]='\e[31m'     #RED='\e[31m'
  COLOR[2]='\e[32m'     #GREEN='\e[32m'
  COLOR[3]='\e[33m'     #YELLOW='\e[33m'
  COLOR[4]='\e[34m'     #BLUE='\e[34m'
  COLOR[5]='\e[91m'     #MAGENTA='\e[35m'
  COLOR[6]='\033[1;97m' #MAG='\033[1;36m'
  COLOR[7]='\e[36m'     #teal='\e[36m'
  COLOR[8]='\e[30m'     #negro='\e[30m'
  COLOR[9]='\033[34m'   #blue='\033[1;34m'

  NEGRITO='\e[1m'
  SEMCOR='\e[0m'

  case $1 in
  -ne) cor="${COLOR[1]}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}" ;;
  -nazu) cor="${COLOR[6]}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}" ;;
  -nverd) cor="${COLOR[2]}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}" ;;
  -nama) cor="${COLOR[3]}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}" ;;
  -ama) cor="${COLOR[3]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -verm) cor="${COLOR[3]}${NEGRITO}[!] ${COLOR[1]}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -verm2) cor="${COLOR[1]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -verm3) cor="${COLOR[1]}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -teal) cor="${COLOR[7]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -teal2) cor="${COLOR[7]}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -blak) cor="${COLOR[8]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -blak2) cor="${COLOR[8]}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -azu) cor="${COLOR[6]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -blu) cor="${COLOR[9]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -blu1) cor="${COLOR[9]}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -verd) cor="${COLOR[2]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -bra) cor="${COLOR[0]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  # -bar) cor="${COLOR[1]}===============================================" && echo -e "${SEMCOR}${cor}${SEMCOR}" ;;
  -bar) cor="${COLOR[1]}┌──────────────────────────────────────────────┐" && echo -e "${SEMCOR}${cor}${SEMCOR}" ;;
  -bar0) cor="${COLOR[1]}└──────────────────────────────────────────────┘" && echo -e "${SEMCOR}${cor}${SEMCOR}" ;;
  -bar2) cor="${COLOR[7]}===============================================" && echo -e "${SEMCOR}${cor}${SEMCOR}" ;;
  #-bar3) cor="${COLOR[1]}-----------------------------------------------" && echo -e "${SEMCOR}${cor}${SEMCOR}" ;;
  -bar3) cor="${COLOR[1]} ──────────────────────────────────────────────" && echo -e "${SEMCOR}${cor}${SEMCOR}" ;;
  -bar4) cor="${COLOR[7]}-----------------------------------------------" && echo -e "${SEMCOR}${cor}${SEMCOR}" ;;
  esac
}

# 🔹text centering
print_center() {
  if [[ -z $2 ]]; then
    text="$1"
  else
    col="$1"
    text="$2"
  fi

  while read line; do
    unset space
    x=$(((45 - ${#line}) / 2))
    for ((i = 0; i < $x; i++)); do
      space+=' '
    done
    space+="$line"
    if [[ -z $2 ]]; then
      msg -azu "$space"
    else
      msg "$col" "$space"
    fi
  done <<<$(echo -e "$text")
}

print_title() {
  if [[ -z $2 ]]; then
    text="$1"
  else
    col="$1"
    text="$2"
  fi

  while read line; do
    unset space
    x=$(((53 - ${#line}) / 2))
    for ((i = 0; i < $x; i++)); do
      space+=' '
    done
    space+="$line"
    if [[ -z $2 ]]; then
      msg -azu "$space"
    else
      msg "$col" "$space"
    fi
  done <<<$(echo -e "$text")
}

sub_title() {
  if [[ -z $2 ]]; then
    text="$1"
  else
    col="$1"
    text="$2"
  fi

  while read line; do
    unset space
    x=$(((54 - ${#line}) / 2))
    for ((i = 0; i < $x; i++)); do
      space+=' '
    done
    space+="$line"
    if [[ -z $2 ]]; then
      msg -azu "$space"
    else
      msg "$col" "$space"
    fi
  done <<<$(echo -e "$text")
}

# 🔹titles and headings
title() {
  clear
  msg -bar
  if [[ -z $2 ]]; then
    print_center -blu1 "$1"
  else
    print_center "$1" "$2"
  fi
  msg -bar0
}

main_title() {
  clear
  msg -bar
  if [[ -z $2 ]]; then
    print_title -blu1 "$1"
  else
    print_title "$1" "$2"
  fi
  msg -bar0
}

title_sub() {
  clear
  msg -bar
  if [[ -z $2 ]]; then
    sub_title -blu1 "$1"
  else
    sub_title "$1" "$2"
  fi
  msg -bar0
}

# completion of tasks🔹home
enter() {
  msg -bar
  text="►► ${a_enter:-Press enter to continue} ◄◄"
  if [[ -z $1 ]]; then
    print_center -ama "$text"
  else
    print_center "$1" "$text"
  fi
  read
}

# option, return back/back🔹option, go back go back
back() {
  msg -bar
  echo -ne "$(msg -verd " [0]") $(msg -verm2 ">") " && msg -bra "\033[1;41m${a_back:-GO BACK}"
  msg -bar0
}

exit2home() {
  msg -bar
  echo -ne "$(msg -verd " [0]") $(msg -verm2 ">") " && msg -bra "\033[1;41m${a_back:-EXIT}"
  msg -bar0
}

inst() {
  print_center -verm2 "${a9:-❗ Please goto Github and reinstall the tool}"
  print_center -verm2 "${a9:-❗ Please goto Github and reinstall the tool}"
  print_center -verm2 "${a9:-❗ Please goto Github and reinstall the tool}"
}

# menu maker (options 1, 2, 3,...)
menu_func() {
  local options=${#@}
  local array
  for ((num = 1; num <= $options; num++)); do
    echo -ne "$(msg -verd " [$num]") $(msg -verm2 ">") "
    array=(${!num})
    case ${array[0]} in
    "-vd") echo -e "\033[1;33m[!]\033[1;32m ${array[@]:1}" ;;
    "-vm") echo -e "\033[1;33m[!]\033[1;31m ${array[@]:1}" ;;
    "-fi") echo -e "${array[@]:2} ${array[1]}" ;;
    -bar | -bar2 | -bar3 | -bar4) echo -e "\033[1;37m${array[@]:1}\n$(msg ${array[0]})" ;;
    *) echo -e "\033[1;37m${array[@]}" ;;
    esac
  done
}

# 🔹Numerical selection option
function selection_fun() {
  local selection="null"
  local range

  if [[ -z $2 ]]; then
    option=$1
    col="-nazu"
  else
    option=$2
    col=$1
  fi

  # Check if option is too large
  if ((option > 13)); then
    echo " ⇢ Option is too large. Please enter a smaller number."
    return 1
  fi

  # Initialize range array
  range=($(seq 0 $option))

  while true; do
    # Ask for selection
    a_selection_fun=" ⇢  Enter your selection: "
    msg "$col" "${a_selection_fun} " >&2
    read selection

    # Check if input is within range
    if [[ $selection == [0-$option] ]]; then
      break
    fi

    # Handle invalid input
    echo "Invalid input, please enter a number between 0 and $option."
    tput cuu1 >&2 && tput dl1 >&2
  done

  echo $selection
}

in_option() {
  unset option
  if [[ -z $2 ]]; then
    msg -nazu " $1: " >&2
  else
    msg $1 " $2: " >&2
  fi
  read option
  echo "$option"
}

in_option_down() {
  dat=$1
  length=${#dat}
  cal=$((22 - $length / 2))
  line=''
  for ((i = 0; i < $cal; i++)); do
    line+='╼'
  done
  echo -e " $(msg -verm3 "╭$line╼[")$(msg -azu "$dat")$(msg -verm3 "]")"
  echo -ne " $(msg -verm3 "╰╼")\033[37;1m> " && read option
}

del() {
  for ((i = 0; i < $1; i++)); do
    tput cuu1 && tput dl1
  done
}

export -f msg
export -f selection_fun
export -f menu_func
export -f print_center
export -f title
export -f back
export -f inst
export -f enter
export -f in_option
export -f in_option_down
export -f del
export -f exit2home
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

request_public_ip=$(grep -m 1 -oE '^[0-9]{1,3}(\.[0-9]{1,3}){3}$' <<<"$(wget -T 10 -t 1 -4qO- "http://ip1.dynupdate.no-ip.com/" || curl -m 10 -4Ls "http://ip1.dynupdate.no-ip.com/")")

#======= multi-login limiter =====

limiter() {
  ltr() {
    clear
    msg -bar

    # Check if limiter is already running and remove from scheduled tasks if so
    for i in $(atq | awk '{print $1}'); do
      if [[ ! $(at -c $i | grep '/etc/limiter.sh') = "" ]]; then
        atrm $i
        sed -i '/etc/limiter.sh/d' /var/spool/cron/crontabs/root
        print_center -verd "Limiter stopped"
        enter
        return
      fi
    done

    # Prompt user to configure limiter
    print_center -ama "CONFIGURE LIMITER"
    msg -bar
    print_center -ama "Block users when they exceed the maximum number of connections"
    msg -bar

    # Set interval for running limiter
    unset option
    while [[ -z $option ]]; do
      msg -nama "Run limiter every (in minutes): "
      read option

      if [[ ! $option =~ ^[0-9]+$ ]]; then
        del 1
        print_center -verm2 "Only numbers are allowed"
        sleep 2
        del 1
        unset option && continue
      elif [[ $option -le 0 ]]; then
        del 1
        print_center -verm2 "Minimum time is 1 minute"
        sleep 2
        del 1
        unset option && continue
      fi

      del 1
      echo -e "$(msg -nama "Run limiter every: ") $(msg -verd "$option minutes")"
      echo "$option" >${udp_dir}/limit
    done

    msg -bar

    # Set interval for automatically unblocking users blocked by the limiter
    print_center -ama "Users blocked by the limiter will be unlocked automatically (enter 0 for manual unlock)"
    msg -bar

    unset option
    while [[ -z $option ]]; do
      msg -nama "Unblock users every (in minutes): "
      read option

      if [[ ! $option =~ ^[0-9]+$ ]]; then
        tput cuu1 && tput dl1
        print_center -verm2 "Only numbers are allowed"
        sleep 2
        tput cuu1 && tput dl1
        unset option && continue
      fi

      tput cuu1 && tput dl1
      [[ $option -le 0 ]] && echo -e "$(msg -nama "Unblock: ") $(msg -verd "manual")" || echo -e "$(msg -nama "Unblock users every: ") $(msg -verd "$option minutes")"
      echo "$option" >${udp_dir}/unlimit
    done

    # Start limiter with new settings
    nohup ${udp_dir}/limiter.sh &>/dev/null &
    msg -bar
    print_center -verd "Limiter started"
    enter
  }

  l_exp() {
    clear
    msg -bar
    l_cron=$(cat /var/spool/cron/crontabs/root | grep -w 'limiter.sh' | grep -w 'ssh')
    if [[ -z "$l_cron" ]]; then
      print_center -ama '0 1 * * * /etc/limiter.sh --ssh' >>/var/spool/cron/crontabs/root
      print_center -verd "${a82:-scheduled expiration limiter\nwill be executed every day at 1 am\naccording to the time scheduled on the server}"
    else
      sed -i '/limiter.sh --ssh/d' /var/spool/cron/crontabs/root
      print_center -verm2 "${a83:-expired limiter stopped}"
    fi
    enter
    return
  }

  log() {
    clear
    msg -bar
    print_center -ama "${a84:-LIMITER REGISTRY}"
    msg -bar
    [[ ! -e /etc/limit.log ]] && touch /etc/limit.log
    if [[ -z $(cat /etc/limit.log) ]]; then
      print_center -ama "${a85:-no account limiter record}"
      msg -bar
      sleep 2
      return
    fi
    msg -teal "$(cat /etc/limit.log)"
    msg -bar
    print_center -ama "►► ${a86:-Press enter to continue...} ◄◄"
    print_center -ama "►► ${a87:-0 to clear record} ◄◄"
    read option
    [[ $option = "0" ]] && print_center -ama "" >/etc/limit.log
  }

  [[ $(cat /var/spool/cron/crontabs/root | grep -w 'limiter.sh' | grep -w 'ssh') ]] && lim_e=$(msg -verd "[ON]") || lim_e=$(msg -verm2 "[OFF]")

  clear
  msg -bar
  print_center -ama "${a11:-ACCOUNT LIMITER}"
  msg -bar
  menu_func "${a64:-MULTI-LOGIN LIMITER}" "${a65:-EXPIRED LIMITER} $lim_e" "${a66:-LIMITER LOG}"
  back
  msg -ne " ${a67:-option}: "
  read option
  case $option in
  1) ltr ;;
  2) l_exp ;;
  3) log ;;
  0) return ;;
  esac
}

#======= CONFIGURATION OF SSH UDP ACCOUNTS =======

data_user() {
  cat_users=$(cat "/etc/passwd" | grep 'home' | grep 'false' | grep -v 'syslog' | grep -v '::/' | grep -v 'hwid\|token')
  [[ -z "$(echo "${cat_users}" | head -1)" ]] && print_center -verm2 "${a96:-NO REGISTERED SSH USERS}" && return 1
  dat_us=$(printf '%-13s%-14s%-10s%-4s%-6s%s' "${a48:-User}" "${a49:-Pass}" "${a97:-Date}" "${a98:-Days}" 'Lmt' 'Stat')
  msg -azu "  $dat_us"
  msg -bar

  i=1

  while read line; do
    u=$(echo "$line" | awk -F ':' '{print $1}')

    fecha=$(chage -l "$u" | sed -n '4p' | awk -F ': ' '{print $2}')

    mes_dia=$(echo $fecha | awk -F ',' '{print $1}' | sed 's/ //g')
    ano=$(echo $fecha | awk -F ', ' '{printf $2}' | cut -c 3-)
    us=$(printf '%-12s' "$u")

    pass=$(echo "$line" | awk -F ':' '{print $5}' | cut -d ',' -f2)
    [[ "${#pass}" -gt '12' ]] && pass="${a99:-Discount}"
    pass="$(printf '%-12s' "$pass")"

    unset stat
    if [[ $(passwd --status $u | cut -d ' ' -f2) = "P" ]]; then
      stat="$(msg -verd "ULK")"
    else
      stat="$(msg -verm2 "BLK")"
    fi

    Limit=$(echo "$line" | awk -F ':' '{print $5}' | cut -d ',' -f1)
    [[ "${#Limit}" = "1" ]] && Limit=$(printf '%2s%-4s' "$Limit") || Limit=$(printf '%-6s' "$Limit")

    echo -ne "$(msg -verd "$i")$(msg -verm2 "-")$(msg -azu "${us}") $(msg -azu "${pass}")"
    if [[ $(echo $fecha | awk '{print $2}') = "" ]]; then
      exp="$(printf '%8s%-2s' '[X]')"
      exp+="$(printf '%-6s' '[X]')"
      echo " $(msg -verm2 "$fecha")$(msg -verd "$exp")$(echo -e "$stat")"
    else
      if [[ $(date +%s) -gt $(date '+%s' -d "${fecha}") ]]; then
        exp="$(printf '%-5s' "Exp")"
        echo " $(msg -verm2 "$mes_dia/$ano")  $(msg -verm2 "$exp")$(msg -ama "$Limit")$(echo -e "$stat")"
      else
        EXPTIME="$(($(($(date '+%s' -d "${fecha}") - $(date +%s))) / 86400))"
        [[ "${#EXPTIME}" = "1" ]] && exp="$(printf '%2s%-3s' "$EXPTIME")" || exp="$(printf '%-5s' "$EXPTIME")"
        echo " $(msg -verm2 "$mes_dia/$ano")  $(msg -verd "$exp")$(msg -ama "$Limit")$(echo -e "$stat")"
      fi
    fi
    let i++
  done <<<"$cat_users"
}

# ======== user Details ====

detail_user() {
  clear
  active_users=('' $(show_users))
  if [[ -z ${active_users[@]} ]]; then
    msg -bar
    print_center -verm2 "${a62:-No registered user}"
    msg -bar
    sleep 3
    return
  else
    msg -bar
    print_center -ama "${a63:-DETAILS OF USERS}"
    msg -bar
  fi
  data_user
  msg -bar
  enter
}

#======== user block ======

block_user() {
  clear
  active_users=('' $(show_users))
  msg -bar
  print_center -ama "${a9:-BLOCK/UNBLOCK USERS}"
  msg -bar
  data_user
  back

  print_center -ama "${a52:-Type a Username from the list}"
  msg -bar
  unset selection
  while [[ ${selection} = "" ]]; do
    msg -nazu "${a53:-Please type a username}: " && read selection
    del 1
  done

  [[ ${selection} = "0" ]] && return
  if [[ ! $(print_center -ama "${selection}" | egrep '[^0-9]') ]]; then
    user_del="${active_users[$selection]}"
  else
    user_del="$selection"
  fi
  [[ -z $user_del ]] && {
    msg -verm "${a54:-Error, Invalid User}"
    msg -bar
    return 1
  }
  [[ ! $(echo ${active_users[@]} | grep -w "$user_del") ]] && {
    msg -verm "${a54:-Error, Invalid User}"
    msg -bar
    return 1
  }

  msg -nama "   ${a48:-Username}: $user_del >>>> "

  if [[ $(passwd --status $user_del | cut -d ' ' -f2) = "P" ]]; then
    pkill -u $user_del &>/dev/null
    droplim=$(droppids | grep -w "$user_del" | awk '{print $2}')
    kill -9 $droplim &>/dev/null
    usermod -L $user_del &>/dev/null
    sleep 2
    msg -verm2 "${a60:-Blocked}"
  else
    usermod -U $user_del
    sleep 2
    msg -verd "${a61:-Unblocked}"
  fi
  msg -bar
  sleep 3
}

#======== user remover =========

renew_user_fun() {
  #nome dias
  datexp=$(date "+%F" -d " + $2 days") && valid=$(date '+%C%y-%m-%d' -d " + $2 days")
  if chage -E $valid $1; then
    print_center -ama "${a100:-Renewed User Successfully}"
  else
    print_center -verm "${a101:-Error, Renewal failed!}"
  fi
}

renew_user() {
  clear
  active_users=('' $(show_users))
  msg -bar
  print_center -ama "${a8:-RENEW USERS}"
  msg -bar
  data_user
  back

  print_center -ama "${a52:-Type a Username from the list}"
  msg -bar
  unset selection
  while [[ -z ${selection} ]]; do
    msg -nazu "${a53:-Select an Option}: " && read selection
    del 1
  done

  [[ ${selection} = "0" ]] && return
  if [[ ! $(print_center -ama "${selection}" | egrep '[^0-9]') ]]; then
    useredit="${active_users[$selection]}"
  else
    useredit="$selection"
  fi

  [[ -z $useredit ]] && {
    msg -verm "${a54:-Error, Invalid User}"
    msg -bar
    sleep 3
    return 1
  }

  [[ ! $(print_center -ama ${active_users[@]} | grep -w "$useredit") ]] && {
    msg -verm "${a54:-Error, Invalid User}"
    msg -bar
    sleep 3
    return 1
  }

  while true; do
    msg -ne "${a58:-New Duration}: $useredit"
    read -p ": " userdays
    if [[ -z "$userdays" ]]; then
      print_center -ama -e '\n\n\n'
      err_fun 7 && continue
    elif [[ "$userdays" != +([0-9]) ]]; then
      print_center -ama -e '\n\n\n'
      err_fun 8 && continue
    elif [[ "$userdays" -gt "360" ]]; then
      print_center -ama -e '\n\n\n'
      err_fun 9 && continue
    fi
    break
  done
  msg -bar
  renew_user_fun "${useredit}" "${userdays}"
  msg -bar
  sleep 3
}

#======== remove client =========

droppids() {
  port_dropbear=$(ps aux | grep 'dropbear' | awk NR==1 | awk '{print $17;}')
  log=/var/log/auth.log
  loginsukses='Password auth succeeded'
  pids=$(ps ax | grep 'dropbear' | grep " $port_dropbear" | awk -F " " '{print $1}')
  for pid in $pids; do
    pidlogs=$(grep $pid $log | grep "$loginsukses" | awk -F" " '{print $3}')
    i=0
    for pidend in $pidlogs; do
      let i=i+1
    done
    if [ $pidend ]; then
      login=$(grep $pid $log | grep "$pidend" | grep "$loginsukses")
      PID=$pid
      user=$(print_center -ama $login | awk -F" " '{print $10}' | sed -r "s/'/ /g")
      waktu=$(print_center -ama $login | awk -F" " '{print $2"-"$1,$3}')
      while [ ${#waktu} -lt 13 ]; do
        waktu=$waktu" "
      done
      while [ ${#user} -lt 16 ]; do
        user=$user" "
      done
      while [ ${#PID} -lt 8 ]; do
        PID=$PID" "
      done
      print_center -ama "$user $PID $waktu"
    fi
  done
}

rm_user() {
  pkill -u $1
  droplim=$(droppids | grep -w "$1" | awk '{print $2}')
  kill -9 $droplim &>/dev/null
  userdel --force "$1" &>/dev/null
  msj=$?
}

show_users() {
  for u in $(cat /etc/passwd | grep 'home' | grep 'false' | grep -v 'syslog' | grep -v 'hwid' | grep -v 'token' | grep -v '::/' | awk -F ':' '{print $1}'); do
    print_center -ama "$u"
  done
}

remove_user() {
  clear
  active_users=('' $(show_users))
  msg -bar
  print_center -ama "${a7:-REMOVE USERS}"
  msg -bar
  data_user
  back

  print_center -ama "${a52:-Type or Select a User}"
  msg -bar
  unset selection
  while [[ -z ${selection} ]]; do
    msg -nazu "${a53:-Please type a username}: " && read selection
    tput cuu1 && tput dl1
  done
  [[ ${selection} = "0" ]] && return
  if [[ ! $(print_center -ama "${selection}" | egrep '[^0-9]') ]]; then
    user_del="${active_users[$selection]}"
  else
    user_del="$selection"
  fi
  [[ -z $user_del ]] && {
    msg -verm "${a54:-Error, Invalid User}"
    msg -bar
    return 1
  }
  [[ ! $(echo ${active_users[@]} | grep -w "$user_del") ]] && {
    msg -verm "${a54:-Error, Invalid User}"
    msg -bar
    return 1
  }

  print_center -ama "${a55:-Selected User}: $user_del"
  rm_user "$user_del"
  if [[ $msj = 0 ]]; then
    print_center -verd "[${a56:-Removed}]"
  else
    print_center -verm "[${a57:-Not Removed}]"
  fi
  enter
}

#========create client =============

add_user() {
  Fecha=$(date +%d-%m-%y-%R)
  [[ $(cat /etc/passwd | grep $1: | grep -vi [a-z]$1 | grep -v [0-9]$1 >/dev/null) ]] && return 1
  valid=$(date '+%C%y-%m-%d' -d " +$3 days")
  osl_v=$(openssl version | awk '{print $2}')
  osl_v=${osl_v:0:5}
  if [[ $osl_v = '1.1.1' ]]; then
    pass=$(openssl passwd -6 $2)
  else
    pass=$(openssl passwd -1 $2)
  fi
  useradd -M -s /bin/false -e ${valid} -K PASS_MAX_DAYS=$3 -p ${pass} -c $4,$2 $1 &>/dev/null
  msj=$?
}

new_user() {
  clear
  active_users=('' $(show_users))
  msg -bar
  print_center -ama "${a6:-CREATE USER ACCOUNT}"
  msg -bar
  data_user
  back

  while true; do
    msg -ne " ${a41:-Username}: "
    read nameuser
    nameuser="$(echo $nameuser | sed 'y/áÁàÀãÃâÂéÉêÊíÍóÓõÕôÔúÚñÑçÇªº/aAaAaAaAeEeEiIoOoOoOuUnNcCao/')"
    nameuser="$(echo $nameuser | sed -e 's/[^a-z0-9 -]//ig')"
    if [[ -z $nameuser ]]; then
      err_fun 1 && continue
    elif [[ "${nameuser}" = "0" ]]; then
      return
    elif [[ "${#nameuser}" -lt "4" ]]; then
      err_fun 2 && continue
    elif [[ "${#nameuser}" -gt "12" ]]; then
      err_fun 3 && continue
    elif [[ "$(echo ${active_users[@]} | grep -w "$nameuser")" ]]; then
      err_fun 14 && continue
    fi
    break
  done

  while true; do
    msg -ne " ${a42:-Password}"
    read -p ": " userpass
    userpass="$(echo $userpass | sed 'y/áÁàÀãÃâÂéÉêÊíÍóÓõÕôÔúÚñÑçÇªº/aAaAaAaAeEeEiIoOoOoOuUnNcCao/')"
    if [[ -z $userpass ]]; then
      err_fun 4 && continue
    elif [[ "${#userpass}" -lt "4" ]]; then
      err_fun 5 && continue
    elif [[ "${#userpass}" -gt "12" ]]; then
      err_fun 6 && continue
    fi
    break
  done

  while true; do
    msg -ne " ${a43:-Number of Days}"
    read -p ": " userdays
    if [[ -z "$userdays" ]]; then
      err_fun 7 && continue
    elif [[ "$userdays" != +([0-9]) ]]; then
      err_fun 8 && continue
    elif [[ "$userdays" -gt "360" ]]; then
      err_fun 9 && continue
    fi
    break
  done

  while true; do
    msg -ne " ${a44:-Connection Limit}"
    read -p ": " limiteuser
    if [[ -z "$limiteuser" ]]; then
      err_fun 11 && continue
    elif [[ "$limiteuser" != +([0-9]) ]]; then
      err_fun 12 && continue
    elif [[ "$limiteuser" -gt "999" ]]; then
      err_fun 13 && continue
    fi
    break
  done

  add_user "${nameuser}" "${userpass}" "${userdays}" "${limiteuser}"
  clear
  msg -bar
  if [[ $msj = 0 ]]; then
    print_center -verd "${a45:-User Created Successfully}"
  else
    print_center -verm2 "${a46:-Error, user not created}"
    enter
    return 1
  fi
  msg -bar
  msg -ne " ${a47:-Server IP}: " && msg -ama "    $request_public_ip"
  msg -ne " ${a47:-Port Range}: " && msg -ama "    1-65535"
  msg -ne " ${a48:-Username}: " && msg -ama "         $nameuser"
  msg -ne " ${a49:-Password}: " && msg -ama "         $userpass"
  msg -ne " ${a50:-Number of Days}: " && msg -ama "   $userdays"
  msg -ne " ${a44:-Connection Limit}: " && msg -ama " $limiteuser"
  msg -ne " ${a51:-Expiration Date}: " && msg -ama "$(date "+%F" -d " + $userdays days")"
  enter
}

#======= CONFIGURATION OF UDP-CUSTOM & UDP-REQUEST ========

make_service() {
  ip_nat=$(ip -4 addr | grep inet | grep -vE '127(\.[0-9]{1,3}){3}' | cut -d '/' -f 1 | grep -oE '[0-9]{1,3}(\.[0-9]{1,3}){3}' | sed -n 1p)
  interfas=$(ip -4 addr | grep inet | grep -vE '127(\.[0-9]{1,3}){3}' | grep "$ip_nat" | awk {'print $NF'})
  ip_publica=$(grep -m 1 -oE '^[0-9]{1,3}(\.[0-9]{1,3}){3}$' <<<"$(wget -T 10 -t 1 -4qO- "http://ip1.dynupdate.no-ip.com/" || curl -m 10 -4Ls "http://ip1.dynupdate.no-ip.com/")")

  cat <<EOF >/etc/systemd/system/udp-request.service
[Unit]
Description=UDP Request Service
After=network.target

[Service]
Type=simple
User=root
WorkingDirectory=/root
ExecStart=/usr/bin/udp-request -ip=$ip_publica -net=$interfas$Port -mode=system
Restart=always
RestartSec=3s

[Install]
WantedBy=multi-user.target
EOF

  systemctl enable udp-request &>/dev/null
  systemctl start udp-request &>/dev/null
  if [[ $(systemctl is-active udp-request) = 'active' ]]; then
    # msg -verd 'OK'
    systemctl enable udp-request &>/dev/null
  else
    msg -verm2 'fail'
  fi
  if [[ $(systemctl is-active udp-request) = 'active' ]]; then
    # msg -verd 'OK'
    systemctl enable udp-request &>/dev/null
  else
    msg -verm2 'fail'
  fi

}

uninstall_udp_manager() {
  title "${a32:-Uninstall UDP-Manager & Binaries}"
  read -rp " $(msg -ama "${a33:-Do you wish to continue? [Y/n]}:") " -e -i Y UNINS
  [[ $UNINS != @(Y|y|S|s) ]] && return
  systemctl stop udp-custom &>/dev/null
  systemctl disable udp-custom &>/dev/null
  # systemctl stop udp-request &>/dev/null
  # systemctl disable udp-request &>/dev/null
  # systemctl stop autostart &>/dev/null
  # systemctl disable autostart &>/dev/null
  rm -rf /etc/systemd/system/udp-custom.service
  # rm -rf /etc/systemd/system/udp-request.service
  # rm -rf /etc/systemd/system/autostart.service
  rm -rf /usr/bin/udp-custom
  rm -rf /root/udp/udp-custom
  # rm -rf /root/udp/udp-request
  # rm -rf /usr/bin/udp-request
  rm -rf /root/udp/config.json
  rm -rf /etc/UDPCustom/udp-custom
  # rm -rf /usr/bin/udp-request
  # rm -rf /etc/UDPCustom/autostart.service
  # rm -rf /etc/UDPCustom/autostart
  # rm -rf /etc/autostart.service
  # rm -rf /etc/autostart
  rm -rf /usr/bin/udpgw
  rm -rf /etc/systemd/system/udpgw.service
  systemctl stop udpgw &>/dev/null
  del 1
  print_center -ama "${a34:-Uninstallation completed!}"
  rm -rf /usr/bin/udp
  enter
  exit
}

reset_udp_request() {
  if [[ $(systemctl is-active udp-request) = 'active' ]]; then
    systemctl stop udp-request &>/dev/null
    systemctl disable udp-request &>/dev/null
    print_center -ama "${a35:-UDP-Request reset done!}"
  else
    systemctl start udp-request &>/dev/null
    if [[ $(systemctl is-active udp-request) = 'active' ]]; then
      systemctl enable udp-request &>/dev/null
      print_center -verd "${a36:-UDP-Request started!}"
    else
      print_center -verm2 "${a37:-failed to start udp-request.service!}"
    fi
  fi
  enter
}

reset_udp_custom() {
  if [[ $(systemctl is-active udp-custom) = 'active' ]]; then
    systemctl stop udp-custom &>/dev/null
    systemctl disable udp-custom &>/dev/null
    print_center -ama "${a35:-UDP-Custom reset done!}"
  else
    systemctl start udp-custom &>/dev/null
    if [[ $(systemctl is-active udp-custom) = 'active' ]]; then
      systemctl enable udp-custom &>/dev/null
      print_center -verd "${a36:-UDP-Custom started!}"
    else
      print_center -verm2 "${a37:-failed to start udp-custom.service!}"
    fi
  fi
  enter
}

exclude() {
  title "${a20:-Exclude UDP ports}"
  print_center -ama "${a21:-UDP-Request covers full range of ports,}"
  print_center -ama "${a22:-However, you can exclude UDP ports.}"
  msg -bar3
  print_center -ama "${a23:-Examples of ports you can exclude:}:"
  print_center -ama "dnstt (slowdns) udp 53 5300"
  print_center -ama "wireguard udp 51820"
  print_center -ama "openvpn udp 1194"
  msg -bar
  print_center -verd "${a24:-enter the ports separated by spaces}"
  print_center -verd "${a25:-Example}: 53 5300 51820 1194"
  msg -bar3
  in_opcion_down "${a26:-type ports or hit enter to skip}"
  del 2
  tmport=($opcion)
  for ((i = 0; i < ${#tmport[@]}; i++)); do
    num=$((${tmport[$i]}))
    if [[ $num -gt 0 ]]; then
      echo "$(msg -ama " ${a27:-port to exclude} >") $(msg -azu "$num") $(msg -verd "OK")"
      Port+=" $num"
    else
      msg -verm2 " ${a28:-not a port} > ${tmport[$i]}?"
      continue
    fi
  done

  if [[ -z $Port ]]; then
    unset Port
    print_center -ama "${a29:-no ports excluded}"
  else
    Port=" -exclude=$(echo "$Port" | sed "s/ /,/g" | sed 's/,//')"
  fi
  msg -bar3
}

add_exclude() {
  title "${a20:-Exclude UDP ports}"
  print_center -ama "${a21:-UDP-Request covers full range of ports,}"
  print_center -ama "${a22:-However, you can exclude UDP ports.}"
  msg -bar3
  print_center -ama "${a23:-Examples of ports you can exclude:}:"
  print_center -ama "dnstt (slowdns) udp 53 5300"
  print_center -ama "wireguard udp 51820"
  print_center -ama "openvpn udp 1194"
  msg -bar
  print_center -verd "${a24:-enter the ports separated by spaces}"
  print_center -verd "${a25:-Example}: 53 5300 51820 1194"
  in_opcion_down "${a26:-type ports or hit enter to skip}"
  del 4
  tmport=($opcion)
  unset Port
  for ((i = 0; i < ${#tmport[@]}; i++)); do
    num=$((${tmport[$i]}))
    if [[ $num -gt 0 ]]; then
      echo "$(msg -ama " ${a27:-port to exclude} >") $(msg -azu "$num") $(msg -verd "OK")"
      Port+=" $num"
    else
      msg -verm2 " ${a28:-not a port} > ${tmport[$i]}?"
      continue
    fi
  done
  if [[ $Port = "" ]]; then
    unset Port
    print_center -ama "${a29:-no ports excluded}"
  else
    exclude=$(cat /etc/systemd/system/udp-request.service | grep 'exclude')
    if systemctl is-active udp-request &>/dev/null; then
      systemctl stop udp-request &>/dev/null
      systemctl disable udp-request &>/dev/null
      iniciar=1
    fi
    if [[ -z $exclude ]]; then
      Port=" -exclude=$(echo "$Port" | sed "s/ /,/g" | sed 's/,//')"
      sed -i "s/ -mode/$Port -mode/" /etc/systemd/system/udp-request.service
    else
      exclude_port=$(echo $exclude | awk '{print $4}' | cut -d '=' -f2)
      Port="-exclude=$exclude_port$(echo "$Port" | sed "s/ /,/g")"
      sed -i "s/-exclude=$exclude_port/$Port/" /etc/systemd/system/udp-request.service
    fi
    if [[ $iniciar = 1 ]]; then
      systemctl start udp-request &>/dev/null
      systemctl enable udp-request &>/dev/null
    fi
  fi
  enter
}

quit_exclude() {
  title "${a88:-REMOVE EXCLUSION PORT}"
  exclude=$(cat /etc/systemd/system/udp-request.service | grep 'exclude' | awk '{print $4}')
  ports=($port)
  for ((i = 0; i < ${#ports[@]}; i++)); do
    a=$(($i + 1))
    echo "             $(msg -verd "[$a]") $(msg -verm2 '>') $(msg -azu "${ports[$i]}")"
  done
  if [[ ! ${#ports[@]} = 1 ]]; then
    let a++
    msg -bar
    echo "             $(msg -verd "[0]") $(msg -verm2 ">") $(msg -bra "\033[1;41m${a89:-GO BACK}")  $(msg -verd "[$a]") $(msg -verm2 "> ${a90:-REMOVE ALL}")"
    msg -bar
  else
    msg -bar
    echo "             $(msg -verd "[0]") $(msg -verm2 ">") $(msg -bra "\033[1;41m${a89:-GO BACK}")"
    msg -bar
  fi
  option=$(selection_fun $a)
  [[ $option = 0 ]] && return
  if systemctl is-active udp-request &>/dev/null; then
    systemctl stop udp-request &>/dev/null
    systemctl disable udp-request &>/dev/null
    iniciar=1
  fi
  if [[ $option = $a ]]; then
    sed -i "s/$exclude /" /etc/systemd/system/udp-request.service
    print_center -ama "${a91:-Removed all excluded ports}"
  else
    let option--
    unset Port
    for ((i = 0; i < ${#ports[@]}; i++)); do
      [[ $i = $option ]] && continue
      echo "$(msg -ama " ${a27:-Port to exclude} >") $(msg -azu "${ports[$i]}") $(msg -verd "OK")"
      Port+=" ${ports[$i]}"
    done
    Port=$(echo $Port | sed 's/ /,/g')
    sed -i "s/$exclude/-exclude=$Port/" /etc/systemd/system/udp-request.service
  fi
  if [[ $iniciar = 1 ]]; then
    systemctl start udp-request &>/dev/null
    systemctl enable udp-request &>/dev/null
  fi
  enter
}

# [Tweak UDP Speed]
tweak_udp_speed() {
  # WARNING!!!
  clear
  echo ""
  msg -bar
  echo "$(msg -verm2 "${a3:-  A RISK TO YOUR SYSTEM}")"
  echo "$(msg -verm2 "${a8:-  ⇢ ... this may or may-not work,}")"
  echo "$(msg -verm2 "${a8:-    depending on your OS Image!}")"
  sleep 2
  echo "$(msg -verm2 "${a8:-  ⇢ patching...}")"
  sleep 2
  # Turn off TCP Timestamps to improve UDP throughput
  echo 0 >/proc/sys/net/ipv4/tcp_timestamps

  # Increase the maximum amount of memory available for network buffers
  echo 4194304 >/proc/sys/net/core/wmem_max
  echo 4194304 >/proc/sys/net/core/rmem_max

  # Increase the default network buffer sizes
  echo 16384 87380 16777216 >/proc/sys/net/ipv4/tcp_wmem
  echo 16384 87380 16777216 >/proc/sys/net/ipv4/tcp_rmem

  # Increase the maximum size of the receive buffer queue
  echo 4096 >/proc/sys/net/ipv4/tcp_max_syn_backlog

  # Increase the maximum number of open files per process
  ulimit -n 65535

  # Reboot networking interface
  sudo systemctl restart NetworkManager &>/dev/null

  sleep 2
  echo "${a6:-  ⇢ You may see network speed improvement on this Server.}"
  echo "${a6:-  ⇢ Done!}"
  msg -bar0
  sleep 3
}

vps_info() {
  # ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  #information
  # ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  if [[ "$(grep -c "Ubuntu" /etc/issue.net)" = "1" ]]; then
    system=$(cut -d' ' -f1 /etc/issue.net)
    system+=$(echo ' ')
    system+=$(cut -d' ' -f2 /etc/issue.net | awk -F "." '{print $1}')
  else
    system=$(cut -d' ' -f1 /etc/issue.net)
  fi
  _system=$(printf '%-14s' "$system")
  os_arch=$(uname -i)
  ip=$(wget -qO- ipinfo.io/ip)
  region=$(wget -qO- ipinfo.io/region)
  isp=$(wget -qO- ipinfo.io/org)
  timezone=$(wget -qO- ipinfo.io/timezone)
  ossys=$(neofetch | grep "OS" | cut -d: -f2 | sed 's/ //g')
  host=$(neofetch | grep "Host" | cut -d: -f2 | sed 's/ //g')
  kernel=$(neofetch | grep "Kernel" | cut -d: -f2 | sed 's/ //g')
  uptime=$(neofetch | grep "Uptime" | cut -d: -f2 | sed 's/ //g')
  cpu=$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')
  _core=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
  memory=$(neofetch | grep "Memory" | cut -d: -f2 | sed 's/ //g')
  ram=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')

  clear
  title_sub "\033[3;40m${a10:-•UDP CUSTOM SCRIPT} by @CAT"
  print_center -ama ' Version: ⇢ 1.0 CAT'
  print_center -ama ' VPS Info'
  msg -bar
  echo " "
  echo -e "$CLAY  ⇢ Operating System :$NC $system $NC"
  echo -e "$CLAY  ⇢ Arch :$NC $os_arch $NC"
  echo -e "$CLAY  ⇢ IP Address :$NC $ip $NC"
  echo -e "$CLAY  ⇢ Region :$NC $region $NC"
  echo -e "$CLAY  ⇢ ISP :$NC $isp $NC"
  echo -e "$CLAY  ⇢ Date :$NC $(date +%A) $(date +%m-%d-%Y)"
  echo -e "$CLAY  ⇢ Up Time :$NC $uptime $NC"
  echo -e "$CLAY  ⇢ CPU Load :$NC $cpu $NC"
  echo -e "$CLAY  ⇢ CPU Cores :$NC $_core $NC"
  echo -e "$CLAY  ⇢ Memory Usage :$NC $memory $NC"
  echo -e "$CLAY  ⇢ Ram Usage :$NC $ram $NC"
  msg -bar0
  enter
}

# [UDP - Request]
menu_udp_request() {
  make_service
  title "\033[3;40m${a10:-•UDP Custom | UDP Request Manager} by @voltssh•"
  print_center -ama ' Version: ⇢ 2.5-Lite'
  print_center -ama ' UDP REQUEST'
  print_center -ama ' Tunnel App : SocksIP'
  msg -bar
  if [[ $(systemctl is-active udp-request) = 'active' ]]; then
    port=$(cat /etc/systemd/system/udp-request.service | grep 'exclude')
    if [[ ! $port = "" ]]; then
      port=$(echo $port | awk '{print $4}' | cut -d '=' -f2 | sed 's/,/ /g')
      print_center -ama "${a2:-EXCLUDED PORTS} $port"
      msg -bar0
      msg -bar
    fi
  fi
  ram=$(printf '%-8s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
  cpu=$(printf '%-1s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
  # print_center -ama " $(msg -verd 'IP:') $(msg -azu "$request_public_ip")  $(msg -verd 'Ram:') $(msg -azu "$ram") $(msg -verd 'CPU:') $(msg -azu "$cpu")"
  echo " $(msg -verd ' ⇢  IP:') $(msg -azu "$request_public_ip")  $(msg -verd 'Ram:') $(msg -azu "$ram") $(msg -verd 'CPU:') $(msg -azu "$cpu")"
  msg -bar

  if [[ $(systemctl is-active udp-request) == 'active' ]]; then
    state=$(echo -e "\e[1m\e[32m[ON]")
  else
    systemctl start udp-request &>/dev/null
    if [[ $(systemctl is-active udp-request) == 'active' ]]; then
      state=$(echo -e "\e[1m\e[32m[ON]")
    else
      state=$(echo -e "\e[1m\e[31m[OFF]")
    fi
  fi

  echo -e " $(msg -verd "[1]") $(msg -verm2 '>') $(msg -azu "${a2:-Activate/Deactivate UDP-Request}") $state"
  msg -bar0
  msg -bar3
  print_center -ama "${a12:-QUICK MENU}"
  msg -bar3
  echo " $(msg -verd "[2]") $(msg -verm2 '>') $(msg -verd "${a6:-Create User}")"
  echo " $(msg -verd "[3]") $(msg -verm2 '>') $(msg -verm2 "${a7:-Remove User}")"
  echo " $(msg -verd "[4]") $(msg -verm2 '>') $(msg -ama "${a8:-Renew User}")"
  echo " $(msg -verd "[5]") $(msg -verm2 '>') $(msg -blu "${a9:-Block/Unlock User}")"
  echo " $(msg -verd "[6]") $(msg -verm2 '>') $(msg -verm3 "${a10:-User Details}")"
  echo " $(msg -verd "[7]") $(msg -verm2 '>') $(msg -teal "${a11:-Limit Accounts}")"
  msg -bar3
  print_center -ama "${a12:-Port Exclusion List}"
  msg -bar3
  echo " $(msg -verd "[8]") $(msg -verm2 '>') $(msg -verd "${a13:-Add Port To The Exclusion List}")"
  num=8
  if [[ ! $port = "" ]]; then
    echo " $(msg -verd "[9]") $(msg -verm2 '>') $(msg -verm2 "${a14:-Port Exclusion List}")"
    num=9
  fi
  back
  option=$(selection_fun $num)

  case $option in
  1) reset_udp_request ;;
  2) new_user ;;
  3) remove_user ;;
  4) renew_user ;;
  5) block_user ;;
  6) detail_user ;;
  7) limiter ;;
  8) add_exclude ;;
  9) quit_exclude ;;
  0) menu_main ;;
  esac
}
# INSTALAR install_udp
install_udp() {
  #=== setup ===
  cd
  rm -rf /root/udp
  mkdir -p /root/udp
  rm -rf /etc/UDPCustom
  mkdir -p /etc/UDPCustom
  sudo touch /etc/UDPCustom/udp-custom
  udp_dir='/etc/UDPCustom'
  udp_file='/etc/UDPCustom/udp-custom'

  sudo apt update -y
  sudo apt upgrade -y
  sudo apt install -y wget
  sudo apt install -y curl
  sudo apt install -y dos2unix
  sudo apt install -y neofetch

  source <(curl -sSL 'https://raw.githubusercontent.com/Redjoker256/Udpcustom/main/module/module')

  time_reboot() {
    print_center -ama "${a92:-System/Server Reboot In} $1 ${a93:-Seconds}"
    REBOOT_TIMEOUT="$1"

    while [ $REBOOT_TIMEOUT -gt 0 ]; do
      print_center -ne "-$REBOOT_TIMEOUT-\r"
      sleep 1
      : $((REBOOT_TIMEOUT--))
    done
    rm /home/ubuntu/install.sh &>/dev/null
    rm /root/install.sh &>/dev/null
    echo -e "\033[01;31m\033[1;33m More Updates, Follow Us On \033[1;31m(\033[1;36mTelegram\033[1;31m): \033[1;37m@voltssh\033[0m"
    reboot
  }

  # Check Ubuntu version
  if [ "$(lsb_release -rs)" = "8*|9*|10*|11*|16.04*|18.04*" ]; then
    clear
    print_center -ama -e "\e[1m\e[31m=====================================================\e[0m"
    print_center -ama -e "\e[1m\e[33m${a94:-this script is not compatible with your operating system}\e[0m"
    print_center -ama -e "\e[1m\e[33m ${a95:-Use Ubuntu 20 or higher}\e[0m"
    print_center -ama -e "\e[1m\e[31m=====================================================\e[0m"
    rm /home/ubuntu/install.sh
    exit 1
  else
    clear
    echo ""
    print_center -ama "A Compatible OS/Environment Found"
    print_center -ama " ⇢ Installation begins...! <"
    sleep 3

    # [change timezone to UTC +0]
    echo ""
    echo " ⇢ Change timezone to UTC +0"
    echo " ⇢ for Africa/Accra [GH] GMT +00:00"
    ln -fs /usr/share/zoneinfo/Africa/Accra /etc/localtime
    sleep 3

    # [+clean up+]
    rm -rf $udp_file &>/dev/null
    rm -rf /etc/UDPCustom/udp-custom &>/dev/null
    # rm -rf /usr/bin/udp-request &>/dev/null
    rm -rf /etc/limiter.sh &>/dev/null
    rm -rf /etc/UDPCustom/limiter.sh &>/dev/null
    rm -rf /etc/UDPCustom/module &>/dev/null
    rm -rf /usr/bin/udp &>/dev/null
    rm -rf /etc/UDPCustom/udpgw.service &>/dev/null
    rm -rf /etc/udpgw.service &>/dev/null
    systemctl stop udpgw &>/dev/null
    systemctl stop udp-custom &>/dev/null
    # systemctl stop udp-request &>/dev/null

    # [+get files ⇣⇣⇣+]

    wget "https://raw.githubusercontent.com/Redjoker256/Udpcustom/main/bin/udp-custom-linux-amd64" -O /root/udp/udp-custom &>/dev/null
    # wget "https://raw.githubusercontent.com/prjkt-nv404/UDP-Custom-Installer-Manager/main/bin/udp-request-linux-amd64" -O /usr/bin/udp-request &>/dev/null
    chmod +x /root/udp/udp-custom
    # chmod +x /usr/bin/udp-request

    wget -O /etc/limiter.sh 'https://raw.githubusercontent.com/Redjoker256/Udpcustom/main/module/module/limiter.sh'
    cp /etc/limiter.sh /etc/UDPCustom
    chmod +x /etc/limiter.sh
    chmod +x /etc/UDPCustom

    # [+udpgw+]
    wget -O /etc/udpgw 'https://raw.githubusercontent.com/Redjoker256/Udpcustom/main/module/module/udpgw'
    mv /etc/udpgw /bin
    chmod +x /bin/udpgw

    # [+service+]
    wget -O /etc/udpgw.service 'https://raw.githubusercontent.com/Redjoker256/Udpcustom/main/config/udpgw.service'
    wget -O /etc/udp-custom.service 'https://raw.githubusercontent.com/Redjoker256/Udpcustom/main/config/udp-custom.service'

    mv /etc/udpgw.service /etc/systemd/system
    mv /etc/udp-custom.service /etc/systemd/system

    chmod 640 /etc/systemd/system/udpgw.service
    chmod 640 /etc/systemd/system/udp-custom.service

    systemctl daemon-reload &>/dev/null
    systemctl enable udpgw &>/dev/null
    systemctl start udpgw &>/dev/null
    systemctl enable udp-custom &>/dev/null
    systemctl start udp-custom &>/dev/null

    # [+config+]
    wget "https://raw.githubusercontent.com/Redjoker256/Udpcustom/main/config/config.json" -O /root/udp/config.json &>/dev/null
    chmod +x /root/udp/config.json

    # [+menu+]
    chmod +x /usr/bin/udp
    ufw disable &>/dev/null
    sudo apt-get remove --purge ufw firewalld -y
    apt remove netfilter-persistent -y
    clear
    echo ""
    echo ""
    print_center -ama "${a103:-setting up, please wait...}"
    sleep 3
    title "${a102:-Instalación exitosa}"
    print_center -ama "${a103:-  To show menu type: \nudp\n}"
    udp
    msg -bar
  fi
}

# [UDP - Custom]
menu_udp_custom() {
  # title "\033[3;40m${a10:-•UDP Custom | UDP Request Manager} by @voltssh•"
  title_sub "\033[3;40m${a10:-•UDP Custom Manager} by @CAT"
  print_center -ama ' Version: 1.0 CAT'
  print_center -ama ' UDP CUSTOM'
  print_center -ama ' Tunnel App : HTTP Custom'
  msg -bar

  ram=$(printf '%-8s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
  cpu=$(printf '%-1s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
  echo " $(msg -verd ' ⇢  IP:') $(msg -azu "$request_public_ip")  $(msg -verd 'Ram:') $(msg -azu "$ram") $(msg -verd 'CPU:') $(msg -azu "$cpu")"
  msg -bar

  if [[ $(systemctl is-active udp-custom) = 'active' ]]; then
    state="\e[1m\e[32m[ON]"
  else
    state="\e[1m\e[31m[OFF]"
  fi
  echo -e " $(msg -verd "[1]") $(msg -verm2 '>') $(msg -azu "${a2:-Activar/Desactivar UDP-Custom}") $state"
  msg -bar0
  msg -bar3
  print_center -ama "${a12:-QUICK MENU}"
  msg -bar3
  echo " $(msg -verd "[2]") $(msg -verm2 '>') $(msg -verd "${a6:-Crear usuario}")"
  echo " $(msg -verd "[3]") $(msg -verm2 '>') $(msg -verm2 "${a7:-Eliminar usuario}")"
  echo " $(msg -verd "[4]") $(msg -verm2 '>') $(msg -ama "${a8:-Renovar usuario}")"
  echo " $(msg -verd "[5]") $(msg -verm2 '>') $(msg -blu "${a9:-Bloquear/Desbloquear usuario}")"
  echo " $(msg -verd "[6]") $(msg -verm2 '>') $(msg -verm3 "${a10:-Detalles del usuario}")"
  echo " $(msg -verd "[7]") $(msg -verm2 '>') $(msg -teal "${a11:-Cuentas limitadas}")"
  msg -bar3
  back
  # option=$(selection_fun $num)
  read -p " ⇢  Enter your selection: " option

  case $option in
  1) reset_udp_custom ;;
  2) new_user ;;
  3) remove_user ;;
  4) renew_user ;;
  5) block_user ;;
  6) detail_user ;;
  7) limiter ;;
  0) menu_main ;;
  esac
}

# [MAIN MENU]A
menu_main() {
  # title "\033[3;40m${a10:-• UDP Custom | UDP Request Manager} •"
  main_title "\033[3;40m${a10:-• UDP Custom Manager} •"
  print_center -ama 'Version: ⇢ 1.0 CAT'
  print_center -ama 'by @CAT'
  msg -bar

  # calculate RAM and CPU usage
  ram=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')
  cpu=$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')

  # print system information
  echo " $(msg -verd ' ⇢  IP:') $(msg -azu "$request_public_ip")  $(msg -verd 'Ram:') $(msg -azu "$ram") $(msg -verd 'CPU:') $(msg -azu "$cpu")"
  msg -bar0

  # print options menu
  if [[ $(systemctl is-active udp-custom) = 'active' ]]; then
    state="\e[1m\e[32m[ON]"
  else
    state="\e[1m\e[31m[OFF]"
  fi
  echo -e " $(msg -verm2 '>') $(msg -azu "${a2:-UDP-Custom}") $state"
  msg -bar3
  print_center -ama "${a12:-ELIJA EL NÚCLEO UDP}"
  msg -bar3
  echo " $(msg -verd "[1]") $(msg -verm2 '>') $(msg -verd "${a6:- INSTALAR UDP Custom}")"
  msg -bar3
  echo " $(msg -verd "[2]") $(msg -verm2 '>') $(msg -verd "${a6:-UDP Personalizado}")"
  # echo " $(msg -verd "[2]") $(msg -verm2 '>') $(msg -ama "${a8:-UDP Request}")"
  msg -bar3
  echo " $(msg -verd "[3]") $(msg -verm2 '>') $(msg -teal "${a11:-Ajustar la velocidad UDP $(msg -verm2 '[!Caution!]')}")"
  echo " $(msg -verd "[4]") $(msg -verm2 '>') $(msg -teal "${a10:-Información de VPS}")"
  msg -bar3
  echo " $(msg -verd "[10]") $(msg -verm2 '>') $(msg -verm2 "${a3:-Desinstalar UDP}")"
  exit2home

  # prompt user for option selection
  read -p " ⇢  Enter your selection: " option

  # handle option selection
  case $option in
  1)
    install_udp
    ;;
  2)
    menu_udp_custom
    ;;
  # 2)
  #   menu_udp_request
  #   ;;
  3)
    tweak_udp_speed
    ;;
  4)
    vps_info
    ;;
  10)
    uninstall_udp_manager
    ;;
  0)
    exit
    ;;
  esac
}

while [[ $? -eq 0 ]]; do
  menu_main
done
