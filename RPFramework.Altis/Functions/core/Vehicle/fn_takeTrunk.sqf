/*
Author: Kerkkoh
First Edit: 23.9.2016
*/
params ["_veh"];

if ((lbCurSel 1500) == -1) exitWith {};
_classname = lbData [1500, lbCurSel 1500];

_trunkItem = _classname createVehicle [0,0,0];
_trunkItem setPos (getPos player);

[_trunkItem] call Client_fnc_pickUp;
RPF_ownedFurniture pushBack _trunkItem;

_trunk = _veh getVariable ["trunk", []];

_pia = -1;
{
	_class1 = _x select 0;
	_amount1 = _x select 1;
	if (_class1 == _classname) then {
		_amount1 = _amount1 - 1;
		if (_amount1 < 1) then {
			_pia = _forEachIndex;
		} else {
			_x set [1, _amount1];
		};
	};
}forEach _trunk;

if (_pia != -1) then {
	_trunk deleteAt _pia;
};

_veh setVariable ["trunk", _trunk, true];

closeDialog 0;
