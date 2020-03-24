if (!isDedicated) then {
    disableSerialization;

	_respawnTickets_w = [west] call BIS_fnc_respawnTickets;
	_respawnTickets_e = [east] call BIS_fnc_respawnTickets;
	if(isNil "_respawnTickets_w" || _respawnTickets_w < 0) then {
        _respawnTickets_w = 0;
    };
	if(isNil "_respawnTickets_e" || _respawnTickets_e < 0) then {
        _respawnTickets_e = 0;
    };

    _hudText = format ["<t size='1.2' color='#0000ff'>%1</t> : <t size='1.2' color='#ff0000'>%2</t>",
    _respawnTickets_w, _respawnTickets_e];

    "ticketslayer" cutRsc ["TicketsHud","PLAIN"];
    _ui = uiNameSpace getVariable "TicketsHud";
    _TicketsHud = _ui displayCtrl 5000;
    _TicketsHud ctrlSetStructuredText parseText _hudText;
    _TicketsHud ctrlCommit 0;
};
true;