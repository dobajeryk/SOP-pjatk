#!/bin/bash

# Treść
#Napisz skrypt, który wyświetli liczbę słów w nazwach plików z katalogu podanego jako argument, w których
#ani w nazwie ani w treści nie ma żadnej dużej litery.

# Jak odpalić?
# ./zadanie05.sh zadanie05/
KATALOG=$1
REGEX=".*[A-Z].*"
IFS=$'\n'

pliki=$(find $KATALOG -type f -printf "%f\n")
liczba_slow=0

for plik in $pliki; do
  if ! [[ "$plik" =~ $REGEX ]]; then
    zawartosc_pliku=$(cat "$KATALOG/$plik")
    if ! [[ "$zawartosc_pliku" =~ $REGEX ]]; then
      liczba_slow_w_nazwie_pliku=$(echo "$plik" | wc -w)
      liczba_slow=$(($liczba_slow + $liczba_slow_w_nazwie_pliku))
    fi
  fi
done

echo "Liczba slow w nazwach pliku spelniajacych warunki to: $liczba_slow"

exit 0
