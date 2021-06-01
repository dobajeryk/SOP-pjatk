#!/bin/bash

# Tresc
#Napisz skrypt, który wyświetli liczbę słów o parzystej liczbie znaków, zaczynających się na samogłoskę w plikach,
#które są w katalogach podanych jako argumenty.

# Jak odpalić?
#./zadanie04.sh zadanie04/

KATALOGI="$@"
REGEX="^[AaEeIiOoUuYy].*"

wynik=0

for katalog in $KATALOGI; do
  pliki=$(find $katalog -type f)
  for plik in $pliki; do
    zawartosc_pliku=$(cat $plik)
    for slowo in $zawartosc_pliku; do
      if [[ $slowo =~ $REGEX ]]; then
        liczba_znakow=$((${#slowo} % 2))
        if (($liczba_znakow == 0)); then
          wynik=$((wynik + 1))
        fi
      fi
    done
  done
done

echo "Liczba slow, ktore spelniaja wymagane warunki to: $wynik"