#!/bin/bash

# Treść
#Napisz skrypt, który zapisze do pliku P te spośród swoich argumentow, które są nazwami niepustych
#plików zwykłych. W pliku P powinniśmy zapisać W JEDNEJ lini nazwę pliku, liczbę znaków w pliku i
#uprawnienia, które posiadamy do tego pliku w formacie "rwx". Nazwa pliku P musi być podana z
#klawiatury.

# Jak odpalić?
# ./zadanie02.sh zadanie02/katalog1/ zadanie02/katalog2 zadanie02/niepusty.txt zadanie02/PlikZZawartoscia700 zadanie02/pustyPlik.txt zadanie02/RowniezPusty

read -p "Podaj nazwę pliku P " PLIK_P

for argument in "$@"; do
  if [ -s "$argument" ] && [ -f "$argument" ]; then
    liczba_znakow=$(wc -c < $argument)
    uprawnienia=$(ls -l $argument | cut -c 2-4) # Przyjmuje, ze mam wypisac uprawnienia wlasciciela
    echo "Nazwa pliku: $argument, liczba znakow $liczba_znakow, posiadane uprawnienia $uprawnienia" >> $PLIK_P
  fi
done

exit 0
