read -p "What's your name? " NAME
read -p "How old are you? " AGE

cowsay -f tux "You are $NAME, and you are $AGE years old" | lolcat
