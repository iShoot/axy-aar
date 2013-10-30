
class CfgPatches
{
	class axy_aar
		{
			units[] = { };
			weapons[] = { };
			requiredAddons[] = {"CBA_Extended_EventHandlers"};
			version = "0.4";
			versionStr = "0.4";
			versionDesc="Automated AAR Generator";
			versionAr[] = {0,4,0};
			author[] = {"axyl - craig.foley@gmail.com"};
		};
};

class Extended_PostInit_EventHandlers {
    class axy_aar {
        clientInit = "call compile preprocessFileLineNumbers '\axy_aar\init.sqf'";
    };
}; 

class CfgFunctions
{
	class axy
	{
		class aar
		{
			file= "axy_aar";
			class aarSectionInContact{};
			class aarSectionUnitFired{};
			class aarSectionUnitHit{};
			class aarSectionUnitKilled{};
			class aarUpdateSection{};
			class aarUpdateAllUnits{};
			class aarEnemyUnitsHit{};
			class aarEnemyUnitsKilled{};
			class aarEnemyHitInContact{};
			class aarContactSectionStats{};
			class aarContactEnemyStats{};
		};
	};
};
