/*
Author: Kerkkoh
First Edit: 6.9.2016
*/
params ["_garage"];

{
	_veh = lbAdd [1500, [_x select 1] call Client_fnc_getVehicleName];
	lbSetData [1500, _veh, str _x];
}forEach _garage;

lbSetCurSel [1500, 0];