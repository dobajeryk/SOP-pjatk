#!/bin/bash

# Treść
#Napisz skrypt, który wypisze nazwy tych katalogów z katalogu podanego jako argument, w których
#są przynajmniej trzy pliki zaczynające się na dużą literę z rozszerzeniem exe lub sh lub bez
#rozszerzenia, które można uruchomić.

#Jak odpalić?
#./zadanie01.sh zadanie01

KATALOG=$1
KATALOGI=$(find $KATALOG -type d)

for podkatalog in $KATALOGI; do
  RE="[A-Z].*[.sh|.exe]?$"
  pliki=$(ls $podkatalog)
  licznik=0
  for plik in $pliki; do
    if [[ $plik =~ $RE ]]; then
      licznik=$((licznik + 1))
    fi
  done
  if ((licznik >= 3)); then
    echo "W katalogu o nazwie $podkatalog znajduja się przynajmniej trzy takie pliki"
  else
    echo "W katalogu o nazwie $podkatalog NIE znajduja się przynajmniej trzy takie pliki"
  fi
done

exit 0
