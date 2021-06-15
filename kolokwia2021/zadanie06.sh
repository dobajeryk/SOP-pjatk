#!/bin/bash

# Treść
# Napisz skrypt, który pobierze trzy argumenty PLIKWEJSCIOWY, PLIKWYJSCIOWY1, PLIKWYJSCIOWY2. Jak argumenty sa poprawne
# to skrypt ma przepisać wszystkie linie zawierajace ciągi rosnące do PLIKWYJSCIOWY1, o ciągi malejące do PLIKWYJSCIOWY2.
# Linie które nie są poprawnymi ciągami rosnacymi lub malejącymi ignorujemy, ale wyświetlamy ile takich ciągów było.
# Podaj wielkość plików wyjściowych w bajtach.
#
# Przykład:
# Mamy PLIKWEJSCIOWY jak poniżej:
# 1 2 3 a 4 5
# 1 2 3 4 5
# 9 2 3 b
# 54 45 33
# 1 2 a l a i o l a
# 9 2 c
# 5 5 5
# 1 2 3 4
# 4 3 2 1
# 1 1 1 2
#
# Przykład:
# PLIKWYJSCIOWY1
# 1 2 3 4 5
# 1 2 3 4
#
# PLIKWYJSCIOWY2
# 54 45 33
# 4 3 2 1

PLIK_WEJSCIOWY=$1
PLIK_WYJSCIOWY_1=$2 #rosnace
PLIK_WYJSCIOWY_2=$3 #malejace

RE_LICZBY="^[0-9 ]*$"

while read linia; do
  if [[ $linia =~ $RE_LICZBY ]]; then # linie zawierajace same liczby
    IFS=' ' read -ra my_array <<<"$linia"
    poprzedni="${my_array[0]}"
    index=0
    rosnace=0
    malejace=0
    for i in "${my_array[@]}"; do
      if ((index != 0)); then
        if ((poprzedni > i)); then
          rosnace=1
        else
          rosnace=0
        fi

        if ((poprzedni < i)); then
          malejace=1
        else
          malejace=0
        fi
      fi

      index=$((index + 1))
      poprzedni=$i
    done

    if ((rosnace == 1)); then
      echo "$linia" >>"$PLIK_WYJSCIOWY_2"
    fi

    if ((malejace == 1)); then
      echo "$linia" >>"$PLIK_WYJSCIOWY_1"
    fi

  fi
done <"$PLIK_WEJSCIOWY"
