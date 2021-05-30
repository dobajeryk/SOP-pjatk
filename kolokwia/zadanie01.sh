#!/bin/bash

#TRESC
#Napisz skrypt, który wypisze nazwy tych katalogów z katalogu podanego jako argument, w których
#są przynajmniej trzy pliki zaczynające się na dużą literę z rozszerzeniem exe lub sh lub bez
#rozszerzenia, które można uruchomić.

KATALOG=$1
KATALOGI=$(find $KATALOG -type d)

for PODKATALOG in $KATALOGI; do
  RE="[A-Z].*[.sh|.exe]?$"
  PLIKI=$(ls $PODKATALOG)
  LICZNIK=0
  for PLIK in $PLIKI; do
    if [[ $PLIK =~ $RE ]]; then
      LICZNIK=$(($LICZNIK + 1))
    fi
  done
  if (($LICZNIK >= 3)); then
    echo "W katalogu o nazwie $PODKATALOG znajduja się przynajmniej trzy takie pliki"
  else
    echo "W katalogu o nazwie $PODKATALOG NIE znajduja się przynajmniej trzy takie pliki"
  fi
done

exit 0
