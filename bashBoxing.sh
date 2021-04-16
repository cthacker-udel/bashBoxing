#!/bin/bash


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
                        0 - critical damage, 1 - normal block 2 - strong block 3 - counter
                        ;;
                    1)
                        #does this
                        ;;
                    2)
                        #does this
                        ;;
                    3)
                        #does this
                        ;;
                    4)
                        #does this
                        ;;
                    *)
                        #default case
                        ;;
                esac
            fi
        done
     fi


done
