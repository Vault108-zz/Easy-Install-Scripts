# Script to create menus and take action according to that selected menu item.
#
#
while :
  do
  clear
  echo "---------------------------------------------------------"
  echo " * * * * * * * Vault's Easy Install * * * * * * * * * * "
  echo "---------------------------------------------------------"
  echo "[1] Install VIM"
  echo "[2] View the Source"
  echo "[3] Show calendar"
  echo "[4] Start editor to write letters"
  echo "[5] Show IP's scanned by Nessus"
  echo "[6] Produce a Tabular Nessus Report"
  echo "[7] Produce a non-scan Tabular Nessus Report"
  echo "[8] Exit/stop"
  echo "----------------------------------------------"
  echo -n "Enter your menu choice [1-5]:"
  read yourch
  case $yourch in
    1) echo "Enter Your Password Below  To Install Vim";  sudo apt-get install vim ; read -n 1 ;;
    2) echo "Opening Source" ; nano ./men.sh ; echo "Press a key. . ." ; read -n 1 ;;
    3) cal ; echo "Press a key. . ." ; read -n 1 ;;
    4) vi ;;
    5) echo "Enter your NBE file(s): \c"
       read FNAME
       for F in $FNAME; do
         awk -F"|" '/results/ {print $3}' "$F" | sort | uniq
       done
       ;;
    6) echo "Enter your NBE file(s): \c"
       read FNAME
       for F in $FNAME; do
         cat "$F" | awk -F"|" '$1 == "results" {gsub (/\n/,"",$7} printf {"%s\t%s\t%s\t%s\t%s\n", $3,$4,$5,$6,$7}' > ${F}_rawresults.txt
       done
       ;;
    7) echo "Enter your NBE file(s): \c";
       read FNAME; cat "$FNAME" | awk -F"|" '$1 != "results" {gsub (/\n/,"",$7); printf "%s\t%s\t%s\n", $1,$2,$3,&$7}' > non_results.txt
       ;;
    8) exit 0
       ;;
    *) echo "Opps!!! Please select choice 1,2,3,4,5,6,7 or 8"
       echo "Press a key. . ."
       read -n 1
       ;;
  esac
done
