#!/bin/bash -x


echo -e "\nWelcome to the Thacker Arena, today we have the bash boxing event!"

echo -e "\nEnter the name of your opponent :   "

read cpu

echo -e "\nEnter the name of your player :   "

read player

read -p "OPPONENT: Enter weight " cpuweight

read -p "OPPONENT : Enter height " cpuheight

read -p "PLAYER : Enter weight " playerweight

read -p "PLAYER : Enter height " playerheight

read -p "PLAYER : Enter HP " playerHP

read -p "CPU : Enter HP " cpuHP

echo -e "\n\n----------------------\n\n WELCOME EVERYONE TO THE MATCHUP WE HAVE FOR YOU TODAY! \n In the red corner we have $player weighing in at $playerweight pounds and standing $playerheight inches tall! \n\n In the blue corner we have $cpu weighing in at $cpuweight pounds and standing at $cpuheight inches tall!"


while true; do
    # who starts first
    cointoss=$(shuf -i 1-2 -n 1)
    cpuchoice=$(shuf -i 1-2 -n 1)
    playerchoice=$(shuf -i 1-2 -n 1)
    sleep 1
    turn=0
    if [ "$cpuchoice" -eq "$cointoss" ]; then
        # cpu goes first
        turn=1
    elif [ "$cpucoice" -ne "$cointoss" -a "$playerchoice" -ne "$cointoss" ]; then
        continue
    else
        #player goes first
        turn=2
    fi
    if [ "$turn" -ne 0 ]; then
        while true; do
            if [ "$turn" -eq 1 ]; then
                echo -e "cpu is choosing the attack"
                sleep 1
                cpuchoice=$(shuf -i 0-4 -n 1)
                case "$cpuchoice" in

                    0)
                        #does this
                        #0 - critical damage, 1 - normal block 2 - strong block 3 - counter
                    
                        playerchoice=$(shuf -i 0-3 -n 1)
                        case $playerchoice in
                            0)
                                playerHP=$((playerHP - 35))
                                if [ "$playerHP" -le 0 ]; then
                                    echo "Knocked out, $cpu wins!"
                                    exit 0
                                fi
                                turn=2
                                ;;
                            1)
                                playerHP=$((playerHP - 20))
                                if [ "$playerHP" -le 0 ]; then
                                    echo "TKO, $cpu wins!"
                                    exit 0
                                fi
                                turn=2
                                ;;
                            2)
                                playerHP=$((playerHP - 10))
                                if [ "$playerHP" -le 0 ]; then
                                    echo "Knocked out, $cpu wins!"
                                    exit 0
                                fi
                                turn=2
                                ;;
                            3) 
                                countered=1
                                cpucounterturn=0
                                while [ "$countered" -eq 1 ]; do
                                    if [ "$cpucounterturn" -eq 0 ]; then
                                        cpuchoice=$(shuf -i 0-3 -n 1)
                                        case $cpuchoice in
                                            0)
                                                cpuHP=$((cpuHP - 35))
                                                if [ "$cpuHP" -le 0 ]; then
                                                    echo "Knocked out, $player wins!"
                                                    exit 0
                                                fi
                                                turn=2
                                                countered=0
                                                cpucounterturn=2
                                                ;;
                                            1)
                                                cpuHP=$((cpuHP - 20))
                                                if [ "$cpuHP" -le 0 ]; then
                                                    echo "TKO, $player wins!"
                                                    exit 0
                                                fi
                                                turn=2
                                                countered=0
                                                cpucounterturn=2
                                                ;;
                                            2)
                                                cpuHP=$((cpuHP - 10))
                                                if [ "$cpuHP" -le 0 ]; then
                                                    echo "TKO, $player wins!"
                                                    exit 0
                                                fi
                                                turn=2
                                                countered=0
                                                cpucounterturn=2
                                                ;;
                                            3)
                                                cpucounterturn=1
                                                ;;
                                        esac
                                    else
                                        playerchoice=$(shuf -i 0-3 -n 1)
                                        case $cpuchoice in
                                            0)
                                                playerHP=$((playerHP - 35))
                                                if [ "$playerHP" -le 0 ]; then
                                                    echo "Knockout, $cpu wins!"
                                                    exit 0
                                                fi
                                                turn=2
                                                cpucounterturn=2
                                                countered=0
                                                ;;
                                            1)
                                                playerHP=$((playerHP - 20))
                                                if [ "$playerHP" -le 0 ]; then
                                                    echo "TKO, $cpu wins!"
                                                    exit 0
                                                fi
                                                turn=2
                                                cpucounterturn=2
                                                countered=0
                                                ;;
                                            2)
                                                playerHP=$((playerHP - 10))
                                                if [ "$playerHP" -le 0 ]; then
                                                    echo "TKO, $cpu wins!"
                                                    exit 0
                                                fi
                                                turn=2
                                                cpucounterturn=2
                                                countered=0
                                                ;;
                                            3)
                                                cpucounterturn=0
                                                ;;
                                        esac
                                      fi
                                  done
                                  ;;
                          esac
                      ;;
                      1)
                          ## uppercut
                          playerchoice=$(shuf -i 0-3 -n 1)
                          case $playerchoice in
                              0)
                                  playerHP=$((playerHP - 45))
                                  if [ "$playerHP" -le 0 ]; then
                                      echo "Knocked out, $cpu wins"
                                      exit 0
                                  fi
                                  turn=2
                                  ;;
                              1)
                                  playerHP=$((playerHP - 30))
                                  if [ "$playerHP" -le 0 ]; then
                                      echo "TKO, $cpu wins"
                                      exit
                                  fi
                                  turn=2
                                  ;;
                              2)
                                  playerHP=$((playerHP - 15))
                                  if [ "$playerHP" -le 0 ]; then
                                      echo "TKO, $cpu wins"
                                      exit 0
                                  fi
                                  turn=2
                                  ;;
                              3)
                                  countered=1
                                  cpucounterturn=0
                                  while [ "$countered" -eq 1 ]; do
                                      if [ "$cpucounterturn" -eq 0 ]; then
                                          cpuchoice=$(shuf -i 0-3 -n 1)
                                          case $cpuchoice in
                                              0)
                                                  cpuHP=$((cpuHP - 45))
                                                  if [ "$cpuHP" -le 0 ]; then
                                                      echo "Knockout, $player wins"
                                                      exit 0
                                                  fi
                                                  turn=2
                                                  cpucounterturn=2
                                                  countered=0
                                                  ;;
                                              1)
                                                  cpuHP=$((cpuHP - 30))
                                                  if [ "$cpuHP" -le 0 ]; then
                                                      echo "TKO, $player wins"
                                                      exit 0
                                                  fi
                                                  turn=2
                                                  cpucounterturn=2
                                                  countered=0
                                                  ;;
                                              2)
                                                  cpuHP=$((cpuHP - 15))
                                                  if [ "$cpuHP" -le 0 ]; then
                                                      echo "TKO, $player wins"
                                                      exit 0
                                                  fi
                                                  turn=2
                                                  cpucounterturn=2
                                                  countered=0
                                                  ;;
                                              3)
                                                  cpucounterturn=1
                                                  ;;
                                          esac
                                      else
                                          playerchoice=$(shuf -i 0-3 -n 1)
                                          case $playerchoice in
                                              0)
                                                  playerHP=$((playerHP - 45))
                                                  if [ "$playerHP" -le 0 ]; then
                                                      echo "Knockout, $cpu wins"
                                                      exit 0
                                                  fi
                                                  turn=2
                                                  cpucounterturn=2
                                                  countered=0
                                                  ;;
                                              1)
                                                  playerHP=$((playerHP - 30))
                                                  if [ "$playerHP" -le 0 ]; then
                                                      echo "TKO, $cpu wins"
                                                      exit 0
                                                  fi
                                                  turn=2
                                                  cpucounterturn=2
                                                  countered=0
                                                  ;;
                                              2)
                                                  playerHP=$((playerHP - 15))
                                                  if [ "$playerHP" -le 0 ]; then
                                                      echo "TKO, $cpu wins"
                                                      exit 0
                                                  fi
                                                  turn=2
                                                  cpucounterturn=2
                                                  countered=0
                                                  ;;
                                              3)
                                                 cpucounterturn=0
                                                 ;;
                                         esac
                                      fi
                                  done
                                  ;;
                          esac
                          ;;
                      2)
                          ##jav
                          ;;
                  esac
               fi
           done
        fi
    done

