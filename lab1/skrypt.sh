#!/bin/bash -eu

#ZADANIE 1 zapytania 1,2,3,5

#Znajdź w pliku access_log unikalnych 10 adresów IP w access_log
grep -o -E "^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" access_log | sort --unique | head -n 10
#Znajdź w pliku access_log zapytania, które mają frazę ""denied"" w linku
grep -E "\"[GET,POST].*denied.*\"" access_log
#Znajdź w pliku access_log zapytania wysłane z IP: 64.242.88.10
grep -E "^64\.242\.88\.10\ " access_log 
#Znajdź w pliku access_log unikalne zapytania typu DELETE
grep -E "\"DELETE" access_log | sort --unique 

#ZADANIE 2 zapytania 2 i 3
#Z pliku yolo.csv wypisz imię każdego, kto jest wart dokładnie $2.99 lub $5.99 lub $9.99. Nie wazne czy milionów, czy miliardów (tylko nazwisko i wartość). Wyniki zapisz na standardowe wyjście błędów
grep -E '\$(2\.99|5\.99|9\.99)' yolo.csv | cut -d, -f2,7 >&2
#Z pliku yolo.csv wypisz każdy numer IP, który w pierwszym i drugim oktecie ma po jednej cyfrze. Wyniki zapisz na standardowe wyjście błędów"
grep -E "\,[0-9]\.[0-9]\.[0-9]{1,3}\.[0-9]{1,3}" yolo.csv | cut -d, -f6 >&2

#ZADANIE 3 podpunkty 1,3
for FILE in $(find "groovies" -mindepth 1 -depth)
do
  #We wszystkich plikach w katalogu ‘groovies’ zamień $HEADER$ na /temat/  
  sed 's/$HEADER/\/temat\//' ${FILE}
  #We wszystkich plikach w katalogu ‘groovies’ usuń linijki zawierające frazę 'Help docs:'"
  sed '/Help docs:/d' ${FILE}
done

#ZADANIE 4 zapytania 1, 2, 4
#Uruchom skrypt fakaping.sh, wszystkie linijki mające zakończenie .conf zachowaj. Wypisz na ekran i do pliku find_results.log. Odfiltruj błędy do pliku: errors.log.
./fakaping.sh 2> >(grep -vE '\.conf' > errors.log) | tee >(grep -E '\.conf' > find_results.log)
#Uruchom skrypt fakaping.sh, standardowe wyjście przekieruj do nicości, a błedy posortuj (nie usuwaj duplikatów).
./fakaping.sh 2>/dev/null | sort
#Uruchom skrypt fakaping.sh i wszystkie unikalne linijki zapisz do pliku all.log i na konsolę
./fakaping.sh 2>&1 | sort -u | uniq | tee all.log

