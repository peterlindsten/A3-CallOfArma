COA_fnc_end = {
	"End triggered" call BIS_fnc_log;
	_west_tickets = [west] call BIS_fnc_respawnTickets;
	_east_tickets = [east] call BIS_fnc_respawnTickets;
	format ["tickets: %1, %2", _west_tickets, _east_tickets] call BIS_fnc_log;
	if (_west_tickets <= 0 && _east_tickets > 0) then {
		"east won" call BIS_fnc_log;
		["east"] call COA_fnc_endPlayers;
	} else {
		if (_west_tickets > 0 && _east_tickets <= 0) then {
			"west won" call BIS_fnc_log;
			["west"] remoteExec ["COA_fnc_endPlayers"];
		} else {
			if  (_west_tickets <= 0 && _east_tickets <= 0) then {
				"draw" call BIS_fnc_log;
				["draw"] remoteExec ["COA_fnc_endPlayers"];
			} else {
				"End got wrongly triggered!" call BIS_fnc_log;
			};
		};
	};
};

TICKETS = ("TICKETS" call BIS_fnc_getParamValue);

_trg = createTrigger ["EmptyDetector", [0, 0]];
_trg setTriggerStatements ["([west] call BIS_fnc_respawnTickets) <= 0 
|| ([east] call BIS_fnc_respawnTickets) <= 0", "[] call COA_fnc_end", ""];

{
    _x addEventHandler ["Hit", COA_fnc_hit];
} forEach allUnits;
[west, TICKETS] call BIS_fnc_respawnTickets;
[east, TICKETS] call BIS_fnc_respawnTickets;

[west, "Blufor_Rifle"] call BIS_fnc_addRespawnInventory; 
[west, "Blufor_Marksman"] call BIS_fnc_addRespawnInventory; 
[west, "Blufor_Teamleader"] call BIS_fnc_addRespawnInventory; 
[west, "Blufor_Pilot"] call BIS_fnc_addRespawnInventory; 
[east, "Opfor_Rifle"] call BIS_fnc_addRespawnInventory; 
[east, "Opfor_Marksman"] call BIS_fnc_addRespawnInventory; 
[east, "Opfor_Teamleader"] call BIS_fnc_addRespawnInventory; 
[east, "Opfor_Pilot"] call BIS_fnc_addRespawnInventory; 
"Initserver done" call BIS_fnc_log;