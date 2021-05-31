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

silnia=1

oblicz_silnie() {
  silnia=1
  for ((i = 2; i <= $1; i++)); do
    silnia=$(($silnia * $i))
  done
}

PLIK_WEJSCIOWY=$1
PLIK_WYJSCIOWY=$2

rm "$PLIK_WYJSCIOWY"

RE_DODATNIA="^[0-9]*$"
RE_UJEMNA="^-[0-9]*$"

ilosc_ujemnych=0
ilosc_cyfr=0

while read linia; do
  for wyraz in $linia; do
    if [[ $wyraz =~ $RE_DODATNIA ]]; then
      oblicz_silnie "$wyraz" >>"$PLIK_WYJSCIOWY"
      ilosc_cyfr=$((ilosc_cyfr + ${#silnia}))
      echo -n "$silnia " >>"$PLIK_WYJSCIOWY"
    elif [[ $wyraz =~ $RE_UJEMNA ]]; then
      ilosc_ujemnych=$(($ilosc_ujemnych + 1))
      echo -n "$wyraz " >>"$PLIK_WYJSCIOWY"
    else
      echo -n "$wyraz " >>"$PLIK_WYJSCIOWY"
    fi
  done
  echo >>"$PLIK_WYJSCIOWY"
done <"$PLIK_WEJSCIOWY"

echo "Liczb cyfr w liczbach, które są silniami to: $ilosc_cyfr" >>"$PLIK_WYJSCIOWY"
echo "Liczba liczb ujemnych to: $ilosc_ujemnych" >>"$PLIK_WYJSCIOWY"

exit 0
