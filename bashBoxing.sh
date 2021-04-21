#!/bin/bash  


echo -e "\nWelcome to the Thacker Arena, today we have the bash boxing event!"

echo -e "\nEnter the name of your opponent :   "

read cpu

echo -e "\nEnter the name of your player :   "

read player

echo -e "\n"
read -p "OPPONENT: Enter weight " cpuweight
echo -e "\n"
read -p "OPPONENT : Enter height " cpuheight
echo -e "\n"
read -p "PLAYER : Enter weight " playerweight
echo -e "\n"
read -p "PLAYER : Enter height " playerheight
echo -e "\n"
read -p "PLAYER : Enter HP " playerHP
echo -e "\n"
read -p "CPU : Enter HP " cpuHP
echo -e "\n"
echo -e "\n\n----------------------\n\n WELCOME EVERYONE TO THE MATCHUP WE HAVE FOR YOU TODAY! \n In the red corner we have $player weighing in at $playerweight pounds and standing $playerheight inches tall! \n\n In the blue corner we have $cpu weighing in at $cpuweight pounds and standing at $cpuheight inches tall!"
sleep 6

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
    elif [ "$cpuchoice" -ne "$cointoss" -a "$playerchoice" -ne "$cointoss" ]; then
        continue
    else
        #player goes first
        turn=2
    fi
    if [ "$turn" -ne 0 ]; then
        while true; do
            echo -e "\n\n"
            if [ "$turn" -eq 1 ]; then
                echo -e "\ncpu is choosing the attack"
                sleep 2
                cpuchoice=$(shuf -i 0-3 -n 1)
                case "$cpuchoice" in

                    0)
                        #does this
                        #0 - critical damage, 1 - normal block 2 - strong block 3 - counter
                        echo -e "\n CPU chooses Leg kick"
                        sleep 1
                        playerchoice=$(shuf -i 0-3 -n 1)
                        case $playerchoice in
                            0)
                                echo -e "\n$player misses block attempt, $cpu lands critical leg kick!"
                                sleep 1
                                playerHP=$((playerHP - 35))
                                if [ "$playerHP" -le 0 ]; then
                                    echo "Knocked out, $cpu wins!"
                                    exit 0
                                fi
                                echo -e "\nPLAYERHP : $playerHP"
                                sleep 1
                                turn=2
                                ;;
                            1)
                                echo -e "\n$player blocks leg kick normally"
                                playerHP=$((playerHP - 20))
                                if [ "$playerHP" -le 0 ]; then
                                    echo "TKO, $cpu wins!"
                                    exit 0
                                fi
                                echo -e "\nPLAYERHP : $playerHP"
                                sleep 1
                                turn=2
                                ;;
                            2)
                                echo -e "\n$player blocks leg kick strongly"
                                sleep 1
                                playerHP=$((playerHP - 10))
                                if [ "$playerHP" -le 0 ]; then
                                    echo "Knocked out, $cpu wins!"
                                    exit 0
                                fi
                                echo -e "\nPLAYERHP : $playerHP"
                                sleep 1
                                turn=2
                                ;;
                            3) 
                                echo -e "\n$cpu's leg kick is countered by $player!"
                                sleep 1
                                countered=1
                                cpucounterturn=0
                                while [ "$countered" -eq 1 ]; do
                                    #echo "inside leg kick while loop"
                                    if [ "$cpucounterturn" -eq 0 ]; then
                                        cpuchoice=$(shuf -i 0-3 -n 1)
                                        case $cpuchoice in
                                            0)
                                                echo -e "\n$player lands critical leg kick on $cpu with counter!"
                                                sleep 1
                                                cpuHP=$((cpuHP - 35))
                                                if [ "$cpuHP" -le 0 ]; then
                                                    echo "Knocked out, $player wins!"
                                                    exit 0
                                                fi
                                                echo -e "\nCPUHP: $cpuHP"
                                                sleep 1
                                                turn=2
                                                countered=0
                                                cpucounterturn=2
                                                ;;
                                            1)
                                                echo -e "\n$cpu blocks $player's leg kick counter normally"
                                                sleep 1
                                                cpuHP=$((cpuHP - 20))
                                                if [ "$cpuHP" -le 0 ]; then
                                                    echo "TKO, $player wins!"
                                                    exit 0
                                                fi
                                                echo -e "\nCPUHP : $cpuHP"
                                                sleep 1
                                                turn=2
                                                countered=0
                                                cpucounterturn=2
                                                ;;
                                            2)
                                                echo -e "\n$cpu blocks $player's leg kick strongly"
                                                sleep 1
                                                cpuHP=$((cpuHP - 10))
                                                if [ "$cpuHP" -le 0 ]; then
                                                    echo "TKO, $player wins!"
                                                    exit 0
                                                fi
                                                echo -e "\nCPUHP : $cpuHP"
                                                sleep 1
                                                turn=2
                                                countered=0
                                                cpucounterturn=2
                                                ;;
                                            3)
                                                echo -e "\n$cpu counters $player's leg kick counter"
                                                sleep 1
                                                cpucounterturn=1
                                                ;;
                                        esac
                                    else
                                        #echo -e "\n$cpu's counter to $player's leg kick counter"
                                        playerchoice=$(shuf -i 0-3 -n 1)
                                        case $cpuchoice in
                                            0)
                                                echo -e "\n$cpu lands critical counter leg kick on $player"
                                                sleep 1
                                                playerHP=$((playerHP - 35))
                                                if [ "$playerHP" -le 0 ]; then
                                                    echo "Knockout, $cpu wins!"
                                                    exit 0
                                                fi
                                                echo -e "\nPLAYERHP : $playerHP"
                                                sleep 1
                                                turn=2
                                                cpucounterturn=2
                                                countered=0
                                                ;;
                                            1)
                                                echo -e "\n$player blocks $cpu's leg kick counter to $player's counter normally"
                                                sleep 1
                                                playerHP=$((playerHP - 20))
                                                if [ "$playerHP" -le 0 ]; then
                                                    echo "TKO, $cpu wins!"
                                                    exit 0
                                                fi
                                                echo -e "\nPLAYERHP : $playerHP"
                                                sleep 1
                                                turn=2
                                                cpucounterturn=2
                                                countered=0
                                                ;;
                                            2)
                                                echo -e "\n$player blocks $cpu's leg kick counter to $player's counter strongly"
                                                sleep 1
                                                playerHP=$((playerHP - 10))
                                                if [ "$playerHP" -le 0 ]; then
                                                    echo "TKO, $cpu wins!"
                                                    exit 0
                                                fi
                                                echo -e "PLAYERHP : $playerHP"
                                                sleep 1
                                                turn=2
                                                cpucounterturn=2
                                                countered=0
                                                ;;
                                            3)
                                                echo -e "\n$player counters $cpu's leg kick counter to $player's counter"
                                                sleep 1
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
                          echo -e "\n$cpu chooses uppercut"
                          sleep 1
                          playerchoice=$(shuf -i 0-3 -n 1)
                          case $playerchoice in
                              0)
                                  echo -e "\n$player misses block agains $cpu's uppercut, $cpu lands critical uppercut!"
                                  playerHP=$((playerHP - 45))
                                  if [ "$playerHP" -le 0 ]; then
                                      echo "Knocked out, $cpu wins"
                                      exit 0
                                  fi
                                  echo -e "\nPLAYERHP : $playerHP"
                                  sleep 2
                                  turn=2
                                  ;;
                              1)
                                  echo -e "\n$player blocks normally against $cpu's uppercut"
                                  playerHP=$((playerHP - 30))
                                  if [ "$playerHP" -le 0 ]; then
                                      echo "TKO, $cpu wins"
                                      exit 0
                                  fi
                                  echo -e "\nPLAYERHP : $playerHP"
                                  sleep 2
                                  turn=2
                                  ;;
                              2)
                                  echo -e "\n$player blocks strongly against $cpu's uppercut"
                                  playerHP=$((playerHP - 15))
                                  if [ "$playerHP" -le 0 ]; then
                                      echo "TKO, $cpu wins"
                                      exit 0
                                  fi
                                  echo -e "\nPLAYERHP : $playerHP"
                                  sleep 2
                                  turn=2
                                  ;;
                              3)
                                  echo -e "\n$player counters $cpu's uppercut"
                                  sleep 2
                                  countered=1
                                  cpucounterturn=0
                                  while [ "$countered" -eq 1 ]; do
                                      #echo "inside uppercut while loop"
                                      if [ "$cpucounterturn" -eq 0 ]; then
                                          cpuchoice=$(shuf -i 0-3 -n 1)
                                          case $cpuchoice in
                                              0)
                                                  echo -e "\n$cpu misses the block against $player's uppercut counter"
                                                  cpuHP=$((cpuHP - 45))
                                                  if [ "$cpuHP" -le 0 ]; then
                                                      echo "Knockout, $player wins"
                                                      exit 0
                                                  fi
                                                  echo -e "\nCPUHP : $cpuHP"
                                                  sleep 2
                                                  turn=2
                                                  cpucounterturn=2
                                                  countered=0
                                                  ;;
                                              1)
                                                  echo -e "\n$cpu blocks normally against $player's uppercut counter"
                                                  cpuHP=$((cpuHP - 30))
                                                  if [ "$cpuHP" -le 0 ]; then
                                                      echo "TKO, $player wins"
                                                      exit 0
                                                  fi
                                                  echo -e "\nCPUHP : $cpuHP"
                                                  sleep 2
                                                  turn=2
                                                  cpucounterturn=2
                                                  countered=0
                                                  ;;
                                              2)
                                                  echo -e "\n$cpu blocks strongly against $player's uppercut counter"
                                                  cpuHP=$((cpuHP - 15))
                                                  if [ "$cpuHP" -le 0 ]; then
                                                      echo "TKO, $player wins"
                                                      exit 0
                                                  fi
                                                  echo -e "\nCPUHP : $cpuHP"
                                                  sleep 2
                                                  turn=2
                                                  cpucounterturn=2
                                                  countered=0
                                                  ;;
                                              3)
                                                  echo -e "$cpu counters $player's uppercut counter"
                                                  cpucounterturn=1
                                                  ;;
                                          esac
                                      else
                                          playerchoice=$(shuf -i 0-3 -n 1)
                                          case $playerchoice in
                                              0)
                                                  echo -e "\n$player misses block attempt on $cpu's uppercut counter to $player's counter"
                                                  playerHP=$((playerHP - 45))
                                                  if [ "$playerHP" -le 0 ]; then
                                                      echo "Knockout, $cpu wins"
                                                      exit 0
                                                  fi
                                                  echo -e "\nPLAYERHP : $playerHP"
                                                  sleep 2
                                                  turn=2
                                                  cpucounterturn=2
                                                  countered=0
                                                  ;;
                                              1)
                                                  echo -e "\n$player blocks normally against $cpu's uppercut counter to $player's counter"
                                                  playerHP=$((playerHP - 30))
                                                  if [ "$playerHP" -le 0 ]; then
                                                      echo "TKO, $cpu wins"
                                                      exit 0
                                                  fi
                                                  echo -e "\nPLAYERHP : $playerHP"
                                                  sleep 2
                                                  turn=2
                                                  cpucounterturn=2
                                                  countered=0
                                                  ;;
                                              2)
                                                  echo -e "\n$player blocks strongly against $cpu's uppercut counter to $player's counter"
                                                  playerHP=$((playerHP - 15))
                                                  if [ "$playerHP" -le 0 ]; then
                                                      echo "TKO, $cpu wins"
                                                      exit 0
                                                  fi
                                                  echo -e "\nPLAYERHP : $playerHP"
                                                  sleep 2
                                                  turn=2
                                                  cpucounterturn=2
                                                  countered=0
                                                  ;;
                                              3)
                                                  echo -e "\n$player counters $cpu's uppercut counter to $player's counter"
                                                  sleep 2
                                                 cpucounterturn=0
                                                 ;;
                                         esac
                                      fi
                                  done
                                  ;;
                          esac
                          ;;
                      2)
                          ##jab
                          echo -e "\ncpu chooses jab"
                          sleep 2
                          playerchoice=$(shuf -i 0-3 -n 1)
                          case $playerchoice in
                              0)
                                  echo -e "\n$player misses block attempt on $cpu's jab, $cpu lands critical jab!"
                                  sleep 2
                                  playerHP=$((playerHP - 15))
                                  if [ "$playerHP" -le 0 ]; then
                                      echo "Knockout, $cpu wins!"
                                      exit 0
                                  fi
                                  echo -e "\nplayerHP = $playerHP"
                                  sleep 1
                                  turn=2
                                  ;;
                              1)
                                  echo -e "\n$player blocks normally against $cpu's jab"
                                  playerHP=$((playerHP - 10))
                                  if [ "$playerHP" -le 0 ]; then
                                      echo "TKO, $cpu wins!"
                                      exit 0
                                  fi
                                  echo -e "\nplayerHP = $playerHP"
                                  sleep 1
                                  turn=2
                                  ;;
                              2)
                                  echo -e "\n$player blocks strongly against $cpu's jab"
                                  playerHP=$((playerHP - 5))
                                  if [ "$playerHP" -le 0 ]; then
                                      echo "TKO, $cpu wins!"
                                      exit 0
                                  fi
                                  echo -e "\nplayerHP = $playerHP"
                                  sleep 1
                                  turn=2
                                  ;;
                              3)
                                  echo -e "\n$player counters $cpu's jab attempt"
                                  cpuchoice=$(shuf -i 0-3 -n 1)
                                  countered=1
                                  while [ "$countered" -eq 1 ]; do
                                      echo "inside jab while loop"
                                      case $cpuchoice in
                                          0)
                                              echo -e "\n$cpu misses block attempt on $player's jab counter"
                                              cpuHP=$((cpuHP - 15))
                                              if [ "$cpuHP" -le 0 ]; then
                                                  echo "Knocked out, $player wins!"
                                                  exit 0
                                              fi
                                              echo -e "\ncpuHP = $cpuHP"
                                              sleep 1
                                              turn=2
                                              countered=0
                                              ;;
                                          1)
                                              echo -e "\n$cpu blocks normally against $player's jab counter"
                                              cpuHP=$((cpuHP - 10))
                                              if [ "$cpuHP" -le 0 ]; then
                                                  echo "TKO, $player wins!"
                                                  exit 0
                                              fi
                                              echo -e "\ncpuHP = $cpuHP"
                                              sleep 1
                                              turn=2
                                              countered=0
                                              ;;
                                          2)
                                              echo -e "\n$cpu blocks strongly against $player's jab counter"
                                              cpuHP=$((cpuHP - 5))
                                              if [ "$cpuHP" -le 0 ]; then
                                                  echo "TKO, $player wins!"
                                                  exit 0
                                              fi
                                              echo -e "\ncpuHP = $cpuHP"
                                              sleep 1
                                              turn=2
                                              countered=0
                                              ;;
                                          3)
                                              echo -e "\n$cpu counters $player's jab counter"
                                              sleep 2
                                              playerchoice=$(shuf -i 0-3 -n 1)
                                              case $playerchoice in
                                                  0)
                                                      echo -e "\n$player misses block attempt on $cpu's jab counter to $player's counter"
                                                      playerHP=$((playerHP - 15))
                                                      if [ "$playerHP" -le 0 ]; then
                                                          echo "Knocked out, $cpu wins!"
                                                          exit 0
                                                      fi
                                                      echo -e "\nplayerHP = $playerHP"
                                                      sleep 1
                                                      turn=2
                                                      countered=0
                                                      ;;
                                                  1)
                                                      echo -e "\n$player blocks normally against $cpu's jab counter to $player's counter"
                                                      playerHP=$((playerHP - 10))
                                                      if [ "$playerHP" -le 0 ]; then
                                                          echo "TKO, $cpu wins!"
                                                          exit 0
                                                      fi
                                                      echo -e "\nplayerHP = $playerHP"
                                                      sleep 1
                                                      turn=2
                                                      countered=0
                                                      ;;
                                                  2)
                                                      echo -e "\n$player blocks strongly against $cpu's jab counter to $player's counter"
                                                      playerHP=$((playerHP - 5))
                                                      if [ "$playerHP" -le 0 ]; then
                                                          echo "TKO, $cpu wins!"
                                                          exit 0
                                                      fi
                                                      echo -e "\nplayerHP = $playerHP"
                                                      sleep 1
                                                      turn=2
                                                      countered=0
                                                      ;;
                                                  3)
                                                      echo -e "\n$player counters $cpu's jab counter to $player's counter"
                                                      countered=1
                                                      continue
                                                      ;;
                                              esac
                                              ;;
                                      esac
                                  done
                                  ;;
                          esac
                          ;;
                      3)
                          ## wheel kick
                          echo -e "\nCpu chooses wheel kick"
                          sleep 2
                          playerchoice=$(shuf -i 0-3 -n 1)
                          case $playerchoice in
                              0)
                                  echo -e "\n$player misses block attempt on $cpu's wheel kick, $cpu lands critical wheel kick!"
                                  playerHP=$((playerHP - 100))
                                  if [ "$playerHP" -le 0 ]; then
                                    echo "Knockout, $cpu wins!"
                                  fi
                                  echo -e "\nPLAYERHP : $playerHP"
                                  sleep 1
                                  turn=2
                                  ;;
                              1)
                                  echo -e "\n$player blocks normally against $cpu's wheel kick attempt"
                                  playerHP=$((playerHP - 50))
                                  if [ "$playerHP" -le 0 ]; then
                                      echo "TKO, $cpu wins!"
                                      exit 0
                                  fi
                                  echo -e "\nplayerHP = $playerHP"
                                  sleep 1
                                  turn=2
                                  ;;
                              2)
                                  echo -e "\n$player blocks strongly against $cpu's wheel kick attempt"
                                  playerHP=$((playerHP - 10))
                                  if [ "$playerHP" -le 0 ]; then
                                      echo "TKO, $cpu wins!"
                                      exit 0
                                  fi
                                  echo -e "\nplayerHP = $playerHP"
                                  sleep 1
                                  turn=2
                                  ;;
                              3)
                                  echo -e "\n$player counters $cpu's wheel kick attempt"
                                  sleep 2
                                  countered=1
                                  while [ "$countered" -eq 1 ]; do
                                    cpuchoice=$(shuf -i 0-3 -n 1)
                                    #echo "inside wheel kick while loop"
                                    case $cpuchoice in
                                        0)
                                            echo -e "\n$cpu misses block attempt against $player's wheel kick counter"
                                            sleep 2
                                            cpuHP=$((cpuHP - 100))
                                            if [ "$cpuHP" -le 0 ]; then
                                                echo "Knockout, $player wins!"
                                                exit 0
                                            fi
                                            echo -e "\nCPUHP : $cpuHP"
                                            sleep 1
                                            countered=0
                                            turn=2
                                            ;;
                                        1)
                                            echo -e "\n$cpu blocks normally against $player's wheel kick counter"
                                            cpuHP=$((cpuHP - 50))
                                            if [ "$cpuHP" -le 0 ]; then
                                                echo "TKO, $player wins!"
                                                exit 0
                                            fi
                                            echo -e "\ncpuHP = $cpuHP"
                                            sleep 1
                                            countered=0
                                            turn=2
                                            ;;
                                        2)
                                            echo -e "\n$cpu blocks strongly against $player's wheel kick counter"
                                            cpuHP=$((cpuHP - 10))
                                            if [ "$cpuHP" -le 0 ]; then
                                                echo "TKO, $player wins!"
                                            fi
                                            echo -e "\ncpuHP = $cpuHP"
                                            sleep 1
                                            countered=0
                                            turn=2
                                            ;;
                                        3)
                                            echo -e "\n$cpu counters $player's wheel kick counter"
                                            sleep 2
                                            playerchoice=$(shuf -i 0-3 -n 1)
                                            case $playerchoice in
                                                0)
                                                    echo -e "\n$player misses block attempt on $cpu's wheel kick counter to $player's counter"
                                                    sleep 2
                                                    playerHP=$((playerHP - 100))
                                                    if [ "$playerHP" -le 0 ]; then
                                                        echo "Knockout, $cpu wins"
                                                        exit 0
                                                    fi
                                                    echo -e "\nPLAYERHP : $playerHP"
                                                    sleep 1
                                                    countered=0
                                                    turn=2
                                                    ;;
                                                1)
                                                    echo -e "\n$player blocks normally against $cpu's wheel kick counter to $player's counter"
                                                    sleep 2
                                                    playerHP=$((playerHP - 50))
                                                    if [ "$playerHP" -le 0 ]; then
                                                        echo "TKO, $cpu wins!"
                                                        exit 0
                                                    fi
                                                    echo -e "\nPlayer HP = $playerHP"
                                                    sleep 1
                                                    countered=0
                                                    turn=2
                                                    ;;
                                                2)
                                                    echo -e "\n$player blocks strongly against $cpu's wheel kick counter to $player's counter"
                                                    sleep 2
                                                    playerHP=$((playerHP - 10))
                                                    if [ "$playerHP" -le 0 ]; then
                                                        echo "TKO, $cpu wins!"
                                                        exit 0
                                                    fi
                                                    echo -e "\nPlayer HP = $playerHP" 
                                                    sleep 1
                                                    turn=2
                                                    countered=0
                                                    ;;
                                                3)
                                                    echo -e "\n$player counters $cpu's wheel kick counter to $player's counter"
                                                    countered=1
                                                    ;;
                                            esac
                                            ;;

                                    esac
                                  done

                                  ;;
                          esac
                          ;;
                  esac
              else
                  echo -e "\n\nPlayer HP : $playerHP \n Cpu HP : $cpuHP\n"
                  sleep 2
                  echo -e "\n Choices : \n0) Leg Kick\n1)Uppercut\n2)Jab\n3)Wheel Kick"
                  read val
                  case $val in
                      0)
                          playerchoice=$(shuf -i 0-3 -n 1)
                          case $playerchoice in
                              0)
                                  cpuHP=$((cpuHP - 35))
                                  if [ "$cpuHP" -le 0 ]; then
                                      echo "Knocked out, $player wins!"
                                      exit 0
                                  fi
                                  echo -e "\nCPUHP : $cpuHP"
                                  sleep 1
                                  turn=1
                                  ;;
                              1)
                                  cpuHP=$((cpuHP - 20))
                                  if [ "$cpuHP" -le 0 ]; then
                                      echo "TKO, $player wins!"
                                      exit 0
                                  fi
                                  echo -e "\nCPUHP : $cpuHP"
                                  sleep 1
                                  turn=1
                                  ;;
                              2)
                                  cpuHP=$((cpuHP - 10))
                                  if [ "$cpuHP" -le 0 ]; then
                                      echo "TKO, $player wins!"
                                      exit 0
                                  fi
                                  echo -e "\nCPUHP : $cpuHP"
                                  sleep 1
                                  turn=1
                                  ;;
                              3)
                                  countered=1
                                  cpucounterturn=0
                                  while [ "$countered" -eq 1 ]; do
                                      echo "Player leg kick countered"
                                      if [ "$cpucounterturn" -eq 0 ]; then
                                          playerchoice=$(shuf -i 0-3 -n 1)
                                          case $cpuchoice in 
                                              0)
                                                  playerHP=$((playerHP - 35))
                                                  if [ "$playerHP" -le 0 ]; then
                                                      echo "Knocked out, $cpu wins!"
                                                      exit 0
                                                  fi
                                                  echo -e "\nPLAYERHP : $playerHP"
                                                  sleep 1
                                                  turn=1
                                                  countered=0
                                                  cpucounterturn=2
                                                  ;;
                                              1)
                                                  playerHP=$((playerHP - 20))
                                                  if [ "$playerHP" -le 0 ]; then
                                                      echo "TKO, $cpu wins!"
                                                      exit 0
                                                  fi
                                                  echo -e "\nPLAYERHP : $playerHP"
                                                  sleep 1
                                                  turn=1
                                                  countered=0
                                                  cpucounterturn=2
                                                  ;;
                                              2)
                                                  playerHP=$((playerHP - 10))
                                                  if [ "$playerHP" -le 0 ]; then
                                                      echo "TKO, $cpu wins!"
                                                      exit 0
                                                  fi
                                                  echo -e "\nPLAYERHP : $playerHP"
                                                  sleep 1
                                                  turn=1
                                                  countered=0
                                                  cpucounterturn=2
                                                  ;;
                                              3)
                                                  echo -e "\nPlayer countered cpu counter\n"
                                                  sleep 1
                                                  cpucounterturn=1
                                                  ;;
                                          esac
                                      else
                                          cpuchoice=$(shuf -i 0-3 -n 1)
                                          case $cpuchoice in
                                              0)
                                                  cpuHP=$((cpuHP - 35))
                                                  if [ "$cpuHP" -le 0]; then
                                                      echo "Knocked out, $player wins!"
                                                      exit 0
                                                  fi
                                                  echo -e "\nCPUHP : $cpuHP"
                                                  sleep 1
                                                  turn=1
                                                  cpucounterturn=2
                                                  countered=0
                                                  ;;
                                              1)
                                                  cpuHP=$((cpuHP - 20))
                                                  if [ "$cpuHP" -le 0 ]; then
                                                      echo "TKO, $player wins!"
                                                      exit 0
                                                  fi
                                                  echo -e "\nCPUHP: $cpuHP"
                                                  sleep 1
                                                  turn=1
                                                  cpucounterturn=2
                                                  countered=0
                                                  ;;
                                              2)
                                                  cpuHP=$((cpuHP - 10))
                                                  if [ "$cpuHP" -le 0 ]; then
                                                      echo "TKO, $player wins!"
                                                      exit 0
                                                  fi
                                                  echo -e "\nCPUHP : $cpuHP"
                                                  sleep 1
                                                  turn=1
                                                  cpucounterturn=2
                                                  countered=0
                                                  ;;
                                              3)
                                                  echo -e "\nPlayers counter to the cpu counter countered"
                                                  sleep 1
                                                  cpucounterturn=0
                                                  ;;
                                          esac
                                      fi
                                  done
                                  ;;
                          esac
                          ;;
                      1)
                          ## player chooses uppercut
                          cpuchoice=$(shuf -i 0-3 -n 1)
                          case $cpuchoice in
                              0)
                                  cpuHP=$((cpuHP - 45))
                                  if [ "$cpuHP" -le 0 ]; then
                                      echo "Knockout, $player wins!"
                                      exit 0
                                  fi
                                  echo -e "\nCPUHP: $cpuHP"
                                  sleep 1
                                  turn=1
                                  ;;
                              1)
                                  cpuHP=$((cpuHP - 30))
                                  if [ "$cpuHP" -le 0 ]; then
                                      echo "TKO, $player wins!"
                                      exit 0
                                  fi
                                  echo -e "\nCPUHP : $cpuHP"
                                  sleep 1
                                  turn=1
                                  ;;
                              2)
                                  cpuHP=$((cpuHP - 15))
                                  if [ "$cpuHP" -le 0 ]; then
                                      echo "TKO, $player wins!"
                                      exit 0
                                  fi
                                  echo -e "\nCPUHP : $cpuHP"
                                  sleep 1
                                  turn=1
                                  ;;
                              3)
                                  countered=1
                                  cpucounterturn=0
                                  while [ "$countered" -eq 1 ]; do
                                      echo "Uppercut countered"
                                      if [ "$cpucounterturn" -eq 0 ]; then
                                          playerchoice=$(shuf -i 0-3 -n 1)
                                          case $playerchoice in
                                              0)
                                                  playerHP=$((playerHP - 45))
                                                  if [ "$playerHP" -le 0 ]; then
                                                      echo "Knocked out, $cpu wins!"
                                                      exit 0
                                                  fi
                                                  echo -e "\nPLAYERHP : $playerHP"
                                                  sleep 1
                                                  turn=1
                                                  countered=0
                                                  cpucounterturn=2
                                                  ;;
                                              1)
                                                  playerHP=$((playerHP - 30))
                                                  if [ "$playerHP" -le 0 ]; then
                                                      echo "TKO, $cpu wins!"
                                                      exit 0
                                                  fi
                                                  echo -e "\nPLAYERHP : $playerHP"
                                                  sleep 1
                                                  turn=1
                                                  countered=0
                                                  cpucounterturn=2
                                                  ;;
                                              2)
                                                  playerHP=$((playerHP - 15))
                                                  if [ "$playerHP" -le 0 ]; then
                                                      echo "TKO, $cpu wins!"
                                                      exit 0
                                                  fi
                                                  echo -e "\nPLAYERHP : $playerHP"
                                                  sleep 1
                                                  turn=1
                                                  countered=0
                                                  cpucounterturn=2
                                                  ;;
                                              3)
                                                  echo -e "\nCpu counter countered by player"
                                                  cpucounterturn=1
                                                  ;;
                                          esac
                                      else
                                          cpuchoice=$(shuf -i 0-3 -n 1)
                                          case $cpuchoice in
                                              0)
                                                  cpuHP=$((cpuHP - 45))
                                                  if [ "$cpuHP" -le 0 ]; then
                                                      echo "Knockout, $player wins!"
                                                      exit 0
                                                  fi
                                                  echo -e "\nCPUHP : $cpuHP"
                                                  sleep 1
                                                  turn=1
                                                  cpucounterturn=2
                                                  countered=0
                                                  ;;
                                              1)
                                                  cpuHP=$((cpuHP - 30))
                                                  if [ "$cpuHP" -le 0 ]; then
                                                      echo "TKO, $player wins!"
                                                      exit 0
                                                  fi
                                                  echo -e "\nCPUHP : $cpuHP"
                                                  sleep 1
                                                  turn=1
                                                  cpucounterturn=0
                                                  countered=0
                                                  ;;
                                              2)
                                                  cpuHP=$((cpuHP - 15))
                                                  if [ "$cpuHP" -le 0 ]; then
                                                      echo "TKO, $player wins!"
                                                      exit 0
                                                  fi
                                                  echo -e "\nCPUHP : $cpuHP"
                                                  sleep 1
                                                  turn=1
                                                  cpucounterturn=0
                                                  countered=0
                                                  ;;
                                              3)
                                                  echo -e "Players counter to cpu counter, countered"
                                                  sleep 1
                                                  cpucounterturn=0
                                                  ;;
                                          esac
                                      fi
                                  done 
                                      ;;
                          esac
                          ;;
                      2)
                          ##chooses jab
                          cpuchoice=$(shuf -i 0-3 -n 1)
                          case $cpuchoice in
                              0)
                                  cpuHP=$((cpuHP - 15))
                                  if [ "$cpuHP" -le 0 ]; then
                                      echo "Knockout, $player wins!"
                                      exit 0
                                  fi
                                  echo -e "\nCPU HP : $cpuHP"
                                  sleep 1
                                  turn=1
                                  ;;
                              1)
                                  cpuHP=$((cpuHP - 10))
                                  if [ "$cpuHP" -le 0 ]; then
                                      echo "TKO, $player wins!"
                                      exit 0
                                  fi
                                  echo -e "\nCPU HP : $cpuHP"
                                  sleep 1
                                  turn=1
                                  ;;
                              2)
                                  cpuHP=$((cpuHP - 5))
                                  if [ "$cpuHP" -le 0 ]; then
                                      echo "TKO, $player wins!"
                                      exit 0
                                  fi
                                  echo -e "\nCPU HP : $cpuHP"
                                  sleep 1 
                                  turn=1
                                  ;;
                              3)
                                  countered=1
                                  cpucounterturn=0
                                  while [ "$countered" -eq 1 ]; do
                                      echo "Jab countered"
                                      if [ "$cpucounterturn" -eq 0 ]; then
                                          playerchoice=$(shuf -i 0-3 -n 1)
                                          case $playerchoice in
                                              0)
                                                  playerHP=$((playerHP - 15))
                                                  if [ "$playerHP" -le 0 ]; then
                                                      echo "Knockout, $cpu wins!"
                                                      exit 0
                                                  fi
                                                  echo -e "\nPLAYER HP : $playerHP"
                                                  sleep 1
                                                  turn=1
                                                  countered=0
                                                  cpucounterturn=2
                                                  ;;
                                              1)
                                                  playerHP=$((playerHP - 10))
                                                  if [ "$playerHP" -le 0 ]; then
                                                      echo "TKO, $cpu wins!"
                                                      exit 0
                                                  fi
                                                  echo -e "\nPLAYER HP : $playerHP"
                                                  sleep 1
                                                  turn=1
                                                  countered=0
                                                  cpucounterturn=2
                                                  ;;
                                              2)
                                                  playerHP=$((playerHP - 5))
                                                  if [ "$playerHP" -le 0 ]; then
                                                      echo "TKO, $cpu wins!"
                                                      exit 0
                                                  fi
                                                  echo -e "\nPLAYER HP : $playerHP"
                                                  sleep 1
                                                  turn=1
                                                  countered=0
                                                  cpucounterturn=2
                                                  ;;
                                              3)
                                                  echo -e "\nCpu counter countered by player"
                                                  cpucounterturn=1
                                                  ;;
                                          esac
                                      else
                                          cpuchoice=$(shuf -i 0-3 -n 1)
                                          case $cpuchoice in
                                              0)
                                                  cpuHP=$((cpuHP - 15))
                                                  if [ "$cpuHP" -le 0 ]; then
                                                      echo "Knockout, $player wins!"
                                                      exit 0
                                                  fi
                                                  echo -e "\n CPUHP : $cpuHP"
                                                  sleep 1
                                                  turn=1
                                                  cpucounterturn=2
                                                  countered=0
                                                  ;;
                                              1)
                                                  cpuHP=$((cpuHP - 10))
                                                  if [ "$cpuHP" -le 0 ]; then
                                                      echo "TKO, $player wins!"
                                                      exit 0
                                                  fi
                                                  echo -e "\n CPUHP : $cpuHP"
                                                  sleep 1
                                                  turn=1
                                                  cpucounterturn=2
                                                  countered=0
                                                  ;;
                                              2)
                                                  cpuHP=$((cpuHP - 5))
                                                  if [ "$cpuHP" -le 0 ]; then
                                                      echo "TKO, $player wins!"
                                                      exit 0
                                                  fi
                                                  echo -e "\nCPU HP : $cpuHP"
                                                  sleep 1
                                                  turn=1
                                                  cpucounterturn=2
                                                  countered=0
                                                  ;;
                                              3)
                                                  echo -e "\nPlayers counter to cpu counter, countered"
                                                  sleep 1
                                                  cpucounterturn=0
                                                  ;;
                                          esac
                                      fi
                                  done
                                  ;;
                          esac
                          ;;
                      3)
                          cpuchoice=$(shuf -i 0-3 -n 1)
                          case $cpuchoice in
                              0)
                                  cpuHP=$((cpuHP - 100))
                                  if [ "$cpuHP" -le 0 ]; then
                                      echo "Knockout, $player wins!"
                                      exit 0
                                  fi
                                  echo -e "\nCPUHP : $cpuHP"
                                  sleep 1
                                  turn=1
                                  ;;
                              1)
                                  cpuHP=$((cpuHP - 50))
                                  if [ "$cpuHP" -le 0 ]; then
                                      echo "TKO, $player wins!"
                                      exit 0
                                  fi
                                  echo -e "\nCPUHP : $cpuHP"
                                  sleep 1
                                  turn=1
                                  ;;
                              2)
                                  cpuHP=$((cpuHP - 10))
                                  if [ "$cpuHP" -le 0 ]; then
                                      echo "TKO, $player wins!"
                                      exit 0
                                  fi
                                  echo -e "\nCPUHP : $cpuHP"
                                  sleep 1
                                  turn=1
                                  ;;
                              3)
                                  countered=1
                                  cpucounterturn=1
                                  while [ "$countered" -eq 1 ]; do
                                    echo -e "\nWheel kick countered"
                                    if [ "$cpucounterturn" -eq 0 ]; then
                                        playerchoice=$(shuf -i 0-3 -n 1)
                                        case $playerchoice in
                                            0)
                                                playerHP=$((playerHP - 100))
                                                if [ "$playerHP" -le 0 ]; then
                                                    echo "Knockout, $cpu wins!"
                                                    exit 0
                                                fi
                                                echo -e "\nPLAYERHP : $playerHP"
                                                sleep 1
                                                turn=1
                                                countered=0
                                                cpucounterturn=2
                                                ;;
                                            1)
                                                playerHP=$((playerHP - 50))
                                                if [ "$playerHP" -le 0 ]; then
                                                    echo "TKO, $cpu wins!"
                                                    exit 0
                                                fi
                                                echo -e "\nPLAYER HP : $playerHP"
                                                sleep 1
                                                turn=1
                                                countered=0
                                                cpucounterturn=2
                                                ;;
                                            2)
                                                playerHP=$((playerHP - 10))
                                                if [ "$playerHP" -le 0 ]; then
                                                    echo "TKO, $cpu wins!"
                                                    exit 0
                                                fi
                                                echo -e "\nPLAYER HP : $playerHP"
                                                sleep 1
                                                turn=1
                                                countered=0
                                                cpucounterturn=2
                                                ;;
                                            3)
                                                echo -e "\nCpu counter countered by player"
                                                cpucounterturn=1
                                                ;;


                                        esac
                                    else
                                        cpuchoice=$(shuf -i 0-3 -n 1)
                                        case $cpuchoice in
                                            0)
                                                cpuHP=$((cpuHP - 100))
                                                if [ "$cpuHP" -le 0 ]; then
                                                    echo "Knockout, $player wins!"
                                                    exit 0
                                                fi
                                                echo -e "\nCPUHP : $cpuHP"
                                                sleep 1
                                                turn=1
                                                cpucounterturn=2
                                                countered=0
                                                ;;
                                            1)
                                                cpuHP=$((cpuHP - 50))
                                                if [ "$cpuHP" -le 0 ]; then
                                                    echo "TKO, $player wins!"
                                                fi
                                                echo -e "\nCPUHP : $cpuHP"
                                                sleep 1
                                                turn=1
                                                cpucounterturn=2
                                                countered=0
                                                ;;
                                            2)
                                                cpuHP=$((cpuHP - 10))
                                                if [ "$cpuHP" -le 0 ]; then
                                                    echo "TKO, $player wins!"
                                                    exit 0
                                                fi
                                                echo -e "\nCPUHP : $cpuHP"
                                                sleep 1
                                                turn=1
                                                cpucounterturn=2
                                                countered=0
                                                ;;
                                            3)
                                                echo -e "\nPlayers counter to cpu counter, countered"
                                                sleep 1
                                                cpucounterturn=0
                                                ;;
                                        esac
                                    fi
                                  done
                                  ;;
                          esac
                          ;;
                  esac
               fi
           done
        fi
    done

