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
            echo "first loop"
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
                                    echo "inside leg kick while loop"
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
                                      echo "inside uppercut while loop"
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
                          ##jab
                          echo -e "\ncpu chooses jab"
                          sleep 2
                          playerchoice=$(shuf -i 0-3 -n 1)
                          case $playerchoice in
                              0)
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
                                  cpuchoice=$(shuf -i 0-3 -n 1)
                                  countered=1
                                  while [ "$countered" -eq 1 ]; do
                                      echo "inside jab while loop"
                                      case $cpuchoice in
                                          0)
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
                                              playerchoice=$(shuf -i 0-3 -n 1)
                                              case $playerchoice in
                                                  0)
                                                      playerHP=$((playerHP - 15))
                                                      if [ "$playerHP" -le 0 ]; then
                                                          echo "Knocked out, $player wins!"
                                                          exit 0
                                                      fi
                                                      echo -e "\nplayerHP = $playerHP"
                                                      sleep 1
                                                      turn=2
                                                      countered=0
                                                      ;;
                                                  1)
                                                      playerHP=$((playerHP - 10))
                                                      if [ "$playerHP" -le 0 ]; then
                                                          echo "TKO, $player wins!"
                                                          exit 0
                                                      fi
                                                      echo -e "\nplayerHP = $playerHP"
                                                      sleep 1
                                                      turn=2
                                                      countered=0
                                                      ;;
                                                  2)
                                                      playerHP=$((playerHP - 5))
                                                      if [ "$playerHP" -le 0 ]; then
                                                          echo "TKO, $player wins!"
                                                          exit 0
                                                      fi
                                                      echo -e "\nplayerHP = $playerHP"
                                                      sleep 1
                                                      turn=2
                                                      countered=0
                                                      ;;
                                                  3)
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
                                  playerHP=0
                                  echo "Knockout, $cpu wins!"
                                  exit 0
                                  ;;
                              1)
                                  playerHP=$((playerHP - 50))
                                  if [ "$playerHP" -le 0 ]; then
                                      echo "TKO, $cpu wins!"
                                      exit 0
                                  fi
                                  echo "\nplayerHP = $playerHP"
                                  sleep 1
                                  turn=2
                                  ;;
                              2)
                                  playerHP=$((playerHP - 10))
                                  if [ "$playerHP" -le 0 ]; then
                                      echo "TKO, $cpu wins!"
                                      exit 0
                                  fi
                                  echo "\nplayerHP = $playerHP"
                                  sleep 1
                                  turn=2
                                  ;;
                              3)
                                  countered=1
                                  while [ "$countered" -eq 1 ]; do
                                    cpuchoice=$(shuf -i 0-3 -n 1)
                                    echo "inside wheel kick while loop"
                                    case $cpuchoice in
                                        0)
                                            echo "Knockout, $player wins!"
                                            exit 0
                                            ;;
                                        1)
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
                                            playerchoice=$(shuf -i 0-3 -n 1)
                                            case $playerchoice in
                                                1)
                                                    echo "Knockout, $cpu wins"
                                                    exit 0
                                                    ;;
                                                2)
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
                                                3)
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
                  echo -e "\nPlayer HP : $playerHP \n Cpu HP : $cpuHP"
                  sleep 2
                  echo -e "\n Choices : 0) Leg Kick\n1)Uppercut\n2)Jab\n3)Wheel Kick"
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
                                                  echo -e "CPUHP : $cpuHP"
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
                                                  echo -e "CPUHP: $cpuHP"
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
                                                  echo -e "CPUHP : $cpuHP"
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
                                                  echo -e "CPUHP : $cpuHP"
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
                  esac
               fi
           done
        fi
    done

