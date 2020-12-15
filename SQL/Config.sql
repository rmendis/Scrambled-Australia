-- Config
-- Author: blkbutterfly74
-- DateCreated: 1/16/2018 11:33:10 AM
--------------------------------------------------------------
INSERT INTO Maps (File, Domain, Name, Description)
VALUES 
	('{21195CC0-B731-4D44-9C6F-F30F1493B5B4}Maps/Australia.lua', 'StandardMaps', 'LOC_MAP_AUSTRALIA_NAME', 'LOC_MAP_AUSTRALIA_DESCRIPTION'),
	('{21195CC0-B731-4D44-9C6F-F30F1493B5B4}Maps/Australia.lua', 'Maps:CivRoyalScenarioMaps', 'LOC_MAP_AUSTRALIA_NAME', 'LOC_MAP_AUSTRALIA_DESCRIPTION'),
	('{21195CC0-B731-4D44-9C6F-F30F1493B5B4}Maps/Australia_XP2.lua', 'Maps:Expansion2Maps', 'LOC_MAP_AUSTRALIA_NAME', 'LOC_MAP_AUSTRALIA_DESCRIPTION');

INSERT INTO DomainValueFilters (Domain, Value, Filter)
VALUES 
	('Maps:Expansion2Maps', '{21195CC0-B731-4D44-9C6F-F30F1493B5B4}Maps/Australia.lua', 'difference');

INSERT INTO Parameters (Key1, Key2, ParameterId, Name, Description, Domain, DefaultValue, ConfigurationGroup, ConfigurationId, GroupId, SortIndex)
VALUES
	-- rainfall
	('Map', '{21195CC0-B731-4D44-9C6F-F30F1493B5B4}Maps/Australia.lua', 'Rainfall', 'LOC_MAP_RAINFALL_NAME', 'LOC_MAP_RAINFALL_DESCRIPTION', 'Rainfall', 2, 'Map', 'rainfall', 'MapOptions', 250),

	-- world age
	('Map', '{21195CC0-B731-4D44-9C6F-F30F1493B5B4}Maps/Australia.lua', 'WorldAge', 'LOC_MAP_WORLD_AGE_NAME', 'LOC_MAP_WORLD_AGE_DESCRIPTION', 'WorldAge', 2, 'Map', 'world_age', 'MapOptions', 230),

	-- rainfall
	('Map', '{21195CC0-B731-4D44-9C6F-F30F1493B5B4}Maps/Australia_XP2.lua', 'Rainfall', 'LOC_MAP_RAINFALL_NAME', 'LOC_MAP_RAINFALL_DESCRIPTION', 'Rainfall', 2, 'Map', 'rainfall', 'MapOptions', 250),

	-- world age
	('Map', '{21195CC0-B731-4D44-9C6F-F30F1493B5B4}Maps/Australia_XP2.lua', 'WorldAge', 'LOC_MAP_WORLD_AGE_NAME', 'LOC_MAP_WORLD_AGE_DESCRIPTION', 'WorldAge', 2, 'Map', 'world_age', 'MapOptions', 230);