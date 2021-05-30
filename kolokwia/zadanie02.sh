#!/bin/bash

# Treść
#Napisz skrypt, który zapisze do pliku P te spośród swoich argumentow, które są nazwami niepustych
#plików zwykłych. W pliku P powinniśmy zapisać W JEDNEJ lini nazwę pliku, liczbę znaków w pliku i
#uprawnienia, które posiadamy do tego pliku w formacie "rwx". Nazwa pliku P musi być podana z
#klawiatury.

# Jak odpalić?
# ./zadanie02.sh zadanie02/katalog1/ zadanie02/katalog2 zadanie02/niepusty.txt zadanie02/PlikZZawartoscia700 zadanie02/pustyPlik.txt zadanie02/RowniezPusty

read -p "Podaj nazwę pliku P " PLIK_P
USER=$(whoami)

for ARGUMENT in "$@"; do
  if [ -s "$ARGUMENT" ] && [ -f "$ARGUMENT" ]; then
    LICZBA_ZNAKOW=$(wc -w < $ARGUMENT)
    UPRAWNIENIA=$(ls -l $ARGUMENT | cut -c 2-4) # Przyjmuje, ze mam wypisac uprawnienia wlasciciela
    echo "Nazwa pliku: $ARGUMENT, liczba znakow $LICZBA_ZNAKOW, posiadane uprawnienia $UPRAWNIENIA" >> $PLIK_P
  fi
done

exit 0
