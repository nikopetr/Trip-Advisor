% By Nick Petrou


% connection/3
connection(edinburgh,london,
       [flight(edinburgh,london,9-40,10-50,ba4733,[mo,tu,we,th,fr,sa,su]),
	flight(edinburgh,london,13-40,14-50,ba4773,[mo,tu,we,th,fr,sa,su]),
	flight(edinburgh,london,19-40,20-50,ba4833,[mo,tu,we,th,fr,su])]).

connection(london,edinburgh,
       [flight(london,edinburgh,9-40,10-50,ba4732,[mo,tu,we,th,fr,sa,su]),
	flight(london,edinburgh,11-40,12-50,ba4752,[mo,tu,we,th,fr,sa,su]),
	flight(london,edinburgh,18-40,19-50,ba4822,[mo,tu,we,th,fr])]).

connection(london,athens,
       [flight(london,athens,13-20,16-20,oa212,[mo,tu,we,fr,su]),
	flight(london,athens,16-30,19-30,ba473,[mo,we,th,sa])]).

connection(london,zurich,
       [flight(london,zurich,9-10,11-45,ba614,[mo,tu,we,th,fr,sa,su]),
	flight(london,zurich,14-45,17-20,sr805,[mo,tu,we,th,fr,sa,su])]).

connection(london,milan,
       [flight(london,milan,8-30,11-20,ba510,[mo,tu,we,th,fr,sa,su]),
	flight(london,milan,11-00,13-50,az459,[mo,tu,we,th,fr,sa,su])]).

connection(athens,zurich,
        [flight(athens,zurich,11-30,13-10,oa322,[tu,th])]).

connection(athens,london,
       [flight(athens,london,11-10,14-20,oa211,[mo,tu,we,fr,su]),
	flight(athens,london,20-00,23-10,ba472,[mo,we,th,sa])]).

connection(milan,london,
       [flight(milan,london,9-10,11-00,az458,[mo,tu,we,th,fr,sa,su]),
	flight(milan,london,12-20,14-20,ba511,[mo,tu,we,th,fr,sa,su])]).

connection(milan,zurich,
       [flight(milan,zurich,9-25,10-15,sr621,[mo,tu,we,th,fr,sa,su]),
	flight(milan,zurich,12-45,13-35,sr623,[mo,tu,we,th,fr,sa,su])]).

connection(zurich,athens,
       [flight(zurich,athens,13-30,15-10,oa323,[tu,th])]).

connection(zurich,london,
       [flight(zurich,london,9-00,10-40,ba613,[mo,tu,we,th,fr,sa]),
	flight(zurich,london,16-10,16-55,sr806,[mo,tu,we,th,fr,su])]).

connection(zurich,milan,
       [flight(zurich,milan,7-55,8-45,sr620,[mo,tu,we,th,fr,sa,su])]).

connection(thessaloniki,athens,
       [flight(thessaloniki,athens,6-30,7-00,oa3333,[mo,tu,we,th,fr,sa,su]),
	flight(thessaloniki,athens,9-30,10-00,oa3334,[mo,tu,we,th,fr,sa,su]),
	flight(thessaloniki,athens,13-30,14-00,oa3335,[mo,tu,we,th,fr,sa,su]),
	flight(thessaloniki,athens,18-30,19-00,oa3336,[mo,tu,we,th,fr,sa,su])]).

connection(athens,thessaloniki,
       [flight(athens,thessaloniki,8-00,8-30,oa3343,[mo,tu,we,th,fr,sa,su]),
	flight(athens,thessaloniki,11-00,11-30,oa3353,[mo,tu,we,th,fr,sa,su]),
	flight(athens,thessaloniki,15-00,15-30,oa3363,[mo,tu,we,th,fr,sa,su]),
	flight(athens,thessaloniki,20-00,20-30,oa3373,[mo,tu,we,th,fr,sa,su])]).

connection(thessaloniki,zurich,
       [flight(thessaloniki,zurich,12-00,13-15,oa888,[mo,tu,we,th,fr,sa,su])]).

connection(zurich,thessaloniki,
       [flight(zurich,thessaloniki,15-30,16-45,oa889,[mo,tu,we,th,fr,sa,su])]).
