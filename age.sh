#Guess the number - Shell Script#
read -p "What's your name? " NAME
read -p "How old are you? " AGE

cowsay -f tux "So, you're name is $NAME, and you are $AGE years old, huh?" | lolcat
read -p "" STOP
clear

echo "Cool, now let's play a game"
echo "Rules: You have to guess a number between 1 and 10 whitin 3 opportunities"

NUMBER=$(($RANDOM % 10 + 1))

LIVES=(1 2 3)

for LIFE in "${LIVES[@]}"; do
	LEFT=$((3 - $LIFE))
	read -p "Type your guess: " GUESSEDNUMBER
	if [ $GUESSEDNUMBER -eq $NUMBER ]; then
		cowsay -f dragon "Well done $NAME you got it" | lolcat
		break
	elif [ $GUESSEDNUMBER -gt $NUMBER ]; then
		if [ $LEFT -eq 0 ]; then
			cowsay "Sorry $NAME, you've lost. The number was $NUMBER" | lolcat
			break
		fi

		if [ $LEFT -eq 1 ]; then
			echo "No way, you have $LEFT life remaining"
		else
			echo "No way, you have $LEFT lives remaining"
		fi
		echo "Hint: the number is lower than $GUESSEDNUMBER"
	else
		if [ $LEFT -eq 0 ]; then
			cowsay "Sorry $NAME, you've lost. The number was $NUMBER" | lolcat
			break
		fi

		if [ $LEFT -eq 1 ]; then
			echo "No way, you have $LEFT life remaining"
		else
			echo "No way, you have $LEFT lives remaining"
		fi
		echo "Hint: the number is greater than $GUESSEDNUMBER"
	fi
done
