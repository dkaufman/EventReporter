- Recurring command prompt that allows the following commands:
	Done- load <filename>, default is event_attendees.csv
	Done- help
	Done- help <command>
	Done- queue count
	Done- queue clear
	Done- queue print
	Done- queue print by <attribute> i.e. zipcode
	Done- queue save to <filename.csv>
	Done- find <attribute> <criteria>
	Done- quit


Extensions

Improve queue print
	Print in left-aligned columns, longest entry determines column width
	Pause at each 10 lines until space or enter
Improve find
	Done - Make searches case insensitive
	Done - Allow compound searches with single and
Improve queue save to
	Respect filename extensions for csv, txt, json, xml
Implement queue math
	subtract find
	add find
Nightmare-mode find
	Allow multiple criteria
	Support an or operation
	Support find only within the queue (queue find last_name Johnson)