% By Nick Petrou

% The data of the flights are in the flights.pl file


:-dynamic connection/3.

% flight_on_day_exists/6
flight_on_day_exists(Start,Dest,DeptTime,ArrTime,Code,Day):-
    connection(Start,Dest,Flights), 
    member(flight(Start,Dest,DeptTime,ArrTime,Code,Days),Flights), 
    member(Day,Days). 

% within_time_frame/2
within_time_frame(Prev,Next):-
    time_difference(Prev,Next,TM),
    TM >= 40.

% time_difference/3
time_difference(PrevH-PrevM,NextH-NextM,TM):-
    H is NextH - PrevH,
    M is NextM - PrevM,
    TM is H*60 + M.

% route/7
route(Place1,Place2,Day,Route,DeptTime,ArrTime,TotalLength) :-
    flight_on_day_exists(Place1,Dest,DeptTime,Arr,Code,Day),
    route_aux([flight(Place1,Dest,Code,DeptTime,Arr)],Place2,Day,ReversedRoute,ArrTime),
    time_difference(DeptTime,ArrTime,TotalLength),
    reverse(ReversedRoute,Route).

% route_aux/5
route_aux([flight(Previus,Current,Code,Dept,Arr)|Rest],Y,Day,Route,ArrTime) :-
    flight_on_day_exists(Current,New,DeptNew,ArrNew,CodeNew,Day), 
    New\=Previus, 
    not(member(flight(New,_,_,_,_),Rest)), 
    within_time_frame(Arr,DeptNew), 
    route_aux([flight(Current,New,CodeNew,DeptNew,ArrNew),flight(Previus,Current,Code,Dept,Arr)|Rest],Y,Day,Route,ArrTime). 

% best_route/7
best_route(Place1,Place2,Day,BestRoute,DeptTime,ArrTime,ShortestLength):-
    setof(Length-Route-A-D,route(Place1,Place2,Day,Route,D,A,Length),[ShortestLength-BestRoute-ArrTime-DeptTime|_]).


% run/0
% Runs the program and the menu
run :-
        nl,nl,
	write('Flight consultant'),nl,
        write('================='),nl,nl,
	write('1 - Load flight table'), nl, 
	write('2 - Flights between cities'), nl, 
	write('3 - Best flight between cities'), nl, 
	write('0 - Exit Program'), nl, nl, 
	write('Choose (0-3): '),
	read(Answer),nl, 
	do_on_choice(Answer). 

% do_on_choice/1
do_on_choice(1) :- !, 
	nl, write('Give me the name of the file that contains the flight table: '),
        read(FileName), 
	see(FileName),			
	repeat,				
        read(Fact),			
	insert_fact(Fact),		
	Fact == end_of_file, !,		
	nl,nl, write('File table loaded.'), nl,nl,
        seen,			        
        run.                            
do_on_choice(2) :- !, 
        get_flight_input(Departute,Arrival,Day), 
        write('From: '),write(Departute),write('  To: '),write(Arrival),write('  Day: '),write(Day),nl,
        find_all_routes(Departute,Arrival,Day),nl,nl, 
        run.
do_on_choice(3) :- !, 
        get_flight_input(Departure,Arrival,Day),
        write('From: '),write(Departure),write('  To: '),write(Arrival),write('  Day: '),write(Day),nl,
        find_best_route(Departure,Arrival,Day),nl,nl, 
        run.
do_on_choice(0) :- !, 
	write('Thank you for using the program!').
do_on_choice(_) :-
	nl, write('Please select a number between 0 and 3!'), nl,nl,
	run.

% insert_fact/1
insert_fact(end_of_file) :- !.  % end_of_file 
insert_fact(Fact) :-
    not(Fact),          
    assert(Fact).	

% get_flight_input/3
get_flight_input(Departure,Arrival,Day):-
	nl,write('Departure: '),
	read(Departure),		
	write('Arrival: '),
	read(Arrival),                  
        write('Day: '),
        read(Day),nl,nl.                

% find_all_routes/3
find_all_routes(Departure,Arrival,Day):-
    bagof(Route-DeptTime-ArrTime-Length,Departure^Arrival^Day^(route(Departure,Arrival,Day,Route,DeptTime,ArrTime,Length)),Routes),!,
    write_all_routes(Routes). 
find_all_routes(_,_,_):-
    write('No Routes found!'),nl.

% find_best_route/3
find_best_route(Departure,Arrival,Day):-  
    best_route(Departure,Arrival,Day,BestRoute,DeptTime,ArrTime,ShortestLength),!, 
    nl,write('Best Route: '),nl,
    write_route(BestRoute,DeptTime,ArrTime,ShortestLength).

find_best_route(_,_,_):- 
    write('No Route found!'),nl.

% write_flights/1
write_flights([]). 
write_flights([CurrentFlight|RestFlights]) :- 
    flight(Departure,Arrival,Code,DeptH-DeptM,ArrH-ArrM)=CurrentFlight, 
    write('   '),write(Departure), write(' -> '),write(Arrival),write(' ('),write(Code),write(')'),write('  dep: '),write(DeptH:DeptM),write('  arr: '),write(ArrH:ArrM),nl,
    write_flights(RestFlights).

% write_route/4
write_route(Route,DeptH-DeptM,ArrH-ArrM,Length):-
    write_flights(Route),
    write('Total Route:  Departure: '),write(DeptH:DeptM),write('  Arrival: '),write(ArrH:ArrM), write('  Flight length: '), write(Length),write(' min'),nl.

% write_all_routes/1
write_all_routes([]). 
write_all_routes([Route-(Dept)-(Arr)-Length|Rest]):-
    nl,write('Route: '),nl,
    write_route(Route,Dept,Arr,Length), 
    write_all_routes(Rest).


