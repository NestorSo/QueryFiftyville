-- Keep a log of any SQL queries you execute as you solve the mystery.

--consulta para encontrar al sospechoso segun si retiro dinero
SELECT name FROM people join bank_accounts on people.id=bank_accounts.person_id
join atm_transactions on bank_accounts.account_number= atm_transactions.account_number
WHERE month = 7 and day = 28 and transaction_type = 'withdraw' and atm_location='Leggett Street'


--consullta para ver quienes fueron los que salieron del estacionamiento en el lapso de tiempo despues del crimen
SELECT name FROM people join bakery_security_logs on people.license_plate= bakery_security_logs.license_plate
WHERE year = 2021 and month= 7 and day = 28 and minute>=15 and minute<= 25 and bakery_security_logs.activity='exit'

--consulta para ver los que hicieron llamadas de menos de un minuto al salir de la panaderia
SELECT name FROM people join phone_calls on people.phone_number=phone_calls.caller
WHERE month = 7 and day = 28 and duration >0 and duration <=60

--consulta para ver los que recibieron llamadas de menos de un minuto en el lapso de tiempo despues del robo
SELECT name FROM people join phone_calls on people.phone_number=phone_calls.receiver
WHERE month = 7 and day = 28 and duration > 0 and duration <=60


--consulta para saber quien o quienes de los involucrados y sospechosos de las pistas anteriores esta en el vuelo del dia siguiente
SELECT name FROM people join passengers on people.passport_number=passengers.passport_number
join flights on flights.id=passengers.flight_id
WHERE flights.origin_airport_id=8 and flights.day=29

SELECT name FROM people join passengers on people.passport_number=passengers.passport_number
join flights on flights.id=passengers.flight_id
WHERE flights.origin_airport_id=8 and flights.day=29 and hour >= 0 and hour <= 10
