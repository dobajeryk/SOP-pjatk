#!/bin/bash

# Treść
#Napisz skrypt, który pobierze dwa argumenty PLIKWEJSCIOWY, PLIKWYJSCIOWY.
#W pliku wejściowym mamy dane liczby lub słowa. Dla wszystich liczb dodatnich powinna zostać wyznaczona
#silnia tej liczby. Słowa i liczby ujemne mają być zignorowane. Mamy dodatkowo policzyć i wyświetlić
#liczbę znaków we wszystkich wyznaczonych silniach.
#PLIKWEJSCIOWY:
#1 2 3 ala
#4 5 6 ola
#-1 7 8
#
#PLIKWYJSCIOWY:
#1 2 6 ala
#24 120 720 ola
#-1 5040 40320
#Liczb cyfr w liczbach, które są silniami to: 20
#Liczba liczb ujemnych to: 1

# Jak odaplić?
#./zadanie03.sh zadanie03/plik-wejsciowy.txt zadanie03/plik-wyjsciowy.txt

SILNIA=1

silnia() {
  SILNIA=1
  for ((i = 2; i <= $1; i++)); do
    SILNIA=$(($SILNIA * $i))
  done
}

PLIK_WEJSCIOWY=$1
PLIK_WYJSCIOWY=$2

ZAWAROSC_PLIKU=$(cat $PLIK_WEJSCIOWY)

RE_DODATNIA="^[0-9]*$"
RE_UJEMNA="^-[0-9]*$"

ILE_UJEMNYCH=0
LICZBA_CYFR=0

for WYRAZ in $ZAWAROSC_PLIKU; do
  if [[ $WYRAZ =~ $RE_DODATNIA ]]; then
    silnia "$WYRAZ" >>"$PLIK_WYJSCIOWY"
    LICZBA_CYFR=$((LICZBA_CYFR + ${#SILNIA}))
    echo "$SILNIA" >> "$PLIK_WYJSCIOWY"
  elif [[ $WYRAZ =~ $RE_UJEMNA ]]; then
    ILE_UJEMNYCH=$(($ILE_UJEMNYCH + 1))
    echo "$WYRAZ" >>"$PLIK_WYJSCIOWY"
  else
    echo "$WYRAZ" >>"$PLIK_WYJSCIOWY"
  fi
done

echo "Liczb cyfr w liczbach, które są silniami to: $LICZBA_CYFR" >>"$PLIK_WYJSCIOWY"
echo "Liczba liczb ujemnych to: $ILE_UJEMNYCH" >>"$PLIK_WYJSCIOWY"

exit 0
