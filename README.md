# AirwaysERM

The All Airways Association (AAA) is an association that brings together all airlines. This association plans to install a comprehensive information system for flight handling. An initial survey produces the following situation report:
When a passenger (passenger number, name, Mr/Mrs, title, etc.) wants to book a flight (or several), he or she first specifies the desired departure and destination airports, the desired flight date and possibly also a time frame when he or she wants to fly away or arrive.
There are various airlines (name, headquarters, etc.) that operate flights. Airlines are identified by a code of maximum three digits (e.g. PA for PanAm, FUA for Futura Air). Each airline operates aircraft (aircraft number, international registration number, name, date of entry into service, etc.) of different aircraft types (type identification, manufacturer, range, etc.).
The airports (name, city, country, capacity in aircraft, etc.) are also encrypted with a three-digit code (e.g. VIE for Vienna-Schwechat, JFK for New York - John F. Kennedy, IBZ for Ibiza). The distances between airports must be recorded in order to be able to take the range of the aircraft type into account when drawing up the flight plan.
Each flight has a departure airport and an arrival airport, the flights are numbered consecutively with a three-digit number within a company. (e.g. PA039 between VIE and JFK, FUA916 between IBZ and VIE) Each flight has a fixed scheduled departure and arrival time, and the days on which the flight takes place are also specified. (e.g. daily for scheduled flights, daily except Sat and Sun, weekly Mon, and the individual days for charter flights). The number of seats available in each class is determined in advance for each flight, the number of remaining free seats must also be determined on an ongoing basis. The flights booked by the passenger are summarized on one ticket (ticket number, date of issue, price, currency, sales office, etc.)
Before starting the flight, the passenger will be given a boarding card at the airport, on which in addition to the flight number, date, departure airport, destination airport and name of the passenger, the allocated seat
(row as number, seat as letter, e.g. 18D) and a smoking or non-smoking license plate appears. The non-smoking seats are assigned on each flight starting from the front of the aircraft, the smoking seats starting from the rear. Seating arrangements depend on the type of aircraft on which the flight is performed. For each seat the class (First Class 1 Economy) and location (window, aisle, middle) are
to hold on to.
For each flight, it must also be possible to record the actual take-off and landing time in order to be able to make evaluations of the punctuality of individual flights.

## ER-Model

![ER-Model](ermodel_airways.jpeg)

## Relational Model

* Passenger (**passenger-ID:int**, name:varchar(32), gender:varchar(32), title:varchar(32), date_of_birth:date)
* Reservation (**booking-nr:int**, departure:varchar(32), destination:varchar(32), date:date, timeframe_dep:time, timeframe_arr:time)
* Flight (**flight-nr.:varchar(32)**, date:date, departure:varchar(32), destination:varchar(32), dep_time:time, arr_time:time, actual_takeoff:time, actual_arrival:time, nr_of_seats:int, seats_taken:int)
* Boarding Card (**_flight-nr.:varchar(32)_**, _passenger-ID:int_, _departure_airport:char_, destination:varchar(32), passenger_name:varchar(32), seat:int, row:char, date:date)
* Ticket (**ticket-nr.:int**, date-of-issue:date, price:double, currency:char)
* Airport (**airport-ID:varchar(32)**, city:varchar(32), country:varchar(32), name:varchar(32), aircraft-capacity:int)
* Airline (**airline-ID:varchar(32)**, name:varchar(32), headquater:varchar(32))
* Aircraft (**international_registration_nr.:int**, aircraft-nr:int, name:varchar(32), date_of_service_entry:date)
* Aircraft Type (**type-ID:int**, _aircraft-nr.:int_, range:int)
* Seat (**number:int**, row:char, smoker:boolean, first_class:boolean)