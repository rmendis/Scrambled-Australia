------------------------------------------------------------------------------
--	FILE:	 Australia.lua
--	AUTHOR:  Firaxis, blkbutterfly74
--	PURPOSE: Creates a Tiny & Large map shaped like real-world Australia
------------------------------------------------------------------------------

include "MapEnums"
include "MapUtilities"
include "MountainsCliffs"
include "RiversLakes"
include "FeatureGenerator"
include "TerrainGenerator"
include "NaturalWonderGenerator"
include "ResourceGenerator"
include "AssignStartingPlots"

-- tiny map data
local g_Minor = {
	centerX = 28,
	centerY = 24,
	width = 56,
	height = 47,
	xOffset = 1,
	yOffset = 1,
	landStrips = {
		{1, 42, 43},
		{2, 41, 44},
		{3, 41, 45},
		{4, 40, 44},
		{5, 45, 45},
		{7, 37, 43},
		{8, 35, 46},
		{9, 35, 46},
		{10, 34, 46},
		{11, 6, 9},
		{11, 34, 48},
		{12, 5, 9},
		{12, 29, 29},
		{12, 32, 48},
		{13, 6, 15},
		{13, 29, 31},
		{13, 33, 49},
		{14, 5, 16},
		{14, 28, 49},
		{15, 5, 20},
		{15, 26, 50},
		{16, 4, 50},
		{17, 4, 51},
		{18, 4, 51},
		{19, 3, 52},
		{20, 2, 51},
		{21, 2, 52},
		{22, 2, 51},
		{23, 2, 52},
		{24, 1, 51},
		{25, 1, 51},
		{26, 1, 49},
		{27, 1, 49},
		{28, 2, 47},
		{29, 4, 47},
		{30, 6, 46},
		{31, 10, 46},
		{32, 11, 43},
		{33, 12, 44},
		{34, 12, 43},
		{35, 12, 12},
		{35, 14, 34},
		{35, 38, 43},
		{36, 15, 32},
		{36, 38, 42},
		{37, 16, 30},
		{37, 38, 43},
		{38, 16, 19},
		{38, 22, 29},
		{38, 38, 42},
		{39, 18, 18},
		{39, 22, 30},
		{39, 38, 40},
		{40, 22, 30},
		{40, 38, 40},
		{41, 23, 31},
		{41, 39, 40},
		{42, 26, 26},
		{42, 38, 39},
		{43, 39, 39}},
};

-- large map data
local g_Major = {
	centerX = 46,
	centerY = 31,
	width = 90,
	height = 75,
	xOffset = 0,
	yOffset = -1,
	landStrips = {
		{73, 63, 63},
		{72, 63, 63},
		{71, 42, 43},
		{71, 51, 51},
		{71, 63, 64},
		{70, 37, 40},
		{70, 42, 44},
		{70, 50, 51},
		{70, 62, 64},
		{69, 42, 46},
		{69, 49, 51},
		{69, 62, 65},
		{68, 39, 51},
		{68, 62, 65},
		{67, 38, 51},
		{67, 62, 65},
		{66, 37, 49},
		{66, 62, 65},
		{65, 29, 32},
		{65, 37, 49},
		{65, 51, 51},
		{65, 62, 66},
		{64, 28, 33},
		{64, 36, 49},
		{64, 62, 66},
		{63, 27, 33},
		{63, 35, 49},
		{63, 62, 67},
		{63, 69, 69},
		{62, 26, 50},
		{62, 62, 69},
		{61, 26, 52},
		{61, 62, 69},
		{60, 24, 53},
		{60, 57, 57},
		{60, 61, 68},
		{59, 22, 56},
		{59, 61, 70},
		{58, 21, 57},
		{58, 60, 70},
		{57, 21, 71},
		{56, 21, 71},
		{55, 20, 71},
		{54, 19, 72},
		{53, 18, 74},
		{52, 14, 76},
		{51, 9, 76},
		{50, 8, 77},
		{49, 6, 78},
		{48, 4, 79},
		{47, 4, 80},
		{46, 3, 80},
		{45, 3, 81},
		{44, 3, 82},
		{43, 3, 83},
		{42, 3, 84},
		{41, 3, 85},
		{40, 3, 85},
		{39, 2, 85},
		{38, 3, 85},
		{37, 4, 86},
		{36, 4, 86},
		{35, 5, 86},
		{34, 5, 87},
		{33, 6, 87},
		{32, 6, 86},
		{31, 6, 86},
		{30, 6, 86},
		{29, 7, 85},
		{28, 7, 85},
		{27, 8, 34},
		{27, 42, 85},
		{26, 8, 28},
		{26, 45, 84},
		{25, 7, 26},
		{25, 46, 83},
		{24, 7, 24},
		{24, 48, 52},
		{24, 53, 82},
		{23, 6, 23},
		{23, 48, 51},
		{23, 54, 81},
		{22, 6, 15},
		{22, 49, 50},
		{22, 53, 81},
		{21, 8, 13},
		{21, 49, 49},
		{21, 52, 53},
		{21, 56, 81},
		{20, 55, 80},
		{19, 52, 53},
		{19, 55, 79},
		{18, 58, 79},
		{17, 58, 79},
		{16, 58, 79},
		{15, 59, 78},
		{14, 61, 74},
		{13, 64, 66},
		{13, 70, 72},
		{10, 67, 67},
		{10, 75, 76},
		{9, 76, 76},
		{8, 68, 74},
		{7, 69, 75},
		{6, 69, 76},
		{5, 70, 76},
		{4, 70, 75},
		{3, 71, 73}},
};

local g_iW, g_iH;
local g_iFlags = {};
local g_continentsFrac = nil;
local g_iNumTotalLandTiles = 0; 
local g_CenterX;
local g_CenterY;
local g_landStrips;
local g_xOffset = 0;
local g_yOffset = 0;

-------------------------------------------------------------------------------
function GenerateMap()
	print("Generating Australia Map");
	local pPlot;

	-- Set globals
	g_iW, g_iH = Map.GetGridSize();
	g_iFlags = TerrainBuilder.GetFractalFlags();
	local temperature = 0;
	
	plotTypes = GeneratePlotTypes();
	terrainTypes = GenerateTerrainTypesAustralia(plotTypes, g_iW, g_iH, g_iFlags, true);

	for i = 0, (g_iW * g_iH) - 1, 1 do
		pPlot = Map.GetPlotByIndex(i);
		if (plotTypes[i] == g_PLOT_TYPE_HILLS) then
			terrainTypes[i] = terrainTypes[i] + 1;
		end
		TerrainBuilder.SetTerrainType(pPlot, terrainTypes[i]);
	end

	-- Temp
	AreaBuilder.Recalculate();
	local biggest_area = Areas.FindBiggestArea(false);
	print("After Adding Hills: ", biggest_area:GetPlotCount());

	-- Place lakes before rivers so they may act as sources of rivers
	AddLakes();

	-- River generation is affected by plot types, originating from highlands and preferring to traverse lowlands.
	AddRivers();

	AddFeatures();
	
	print("Adding cliffs");
	AddCliffs(plotTypes, terrainTypes);
	
	local args = {
		numberToPlace = GameInfo.Maps[Map.GetMapSize()].NumNaturalWonders,
	};

	local nwGen = NaturalWonderGenerator.Create(args);

	AreaBuilder.Recalculate();
	TerrainBuilder.AnalyzeChokepoints();
	TerrainBuilder.StampContinents();
	
	local resourcesConfig = MapConfiguration.GetValue("resources");
	local startConfig = MapConfiguration.GetValue("start");-- Get the start config

	local args = {
		resources = resourcesConfig,
		LuxuriesPerRegion = 7,
		START_CONFIG = startConfig,
	}
	local resGen = ResourceGenerator.Create(args);

	print("Creating start plot database.");
	-- START_MIN_Y and START_MAX_Y is the percent of the map ignored for major civs' starting positions.
	local args = {
		MIN_MAJOR_CIV_FERTILITY = 300,
		MIN_MINOR_CIV_FERTILITY = 50, 
		MIN_BARBARIAN_FERTILITY = 1,
		START_MIN_Y = 15,
		START_MAX_Y = 15,
		START_CONFIG = startConfig,
		LAND = true,
	};
	local start_plot_database = AssignStartingPlots.Create(args)

	local GoodyGen = AddGoodies(g_iW, g_iH);
end

-- Input a Hash; Export width, height, and wrapX
-- and init map data
function GetMapInitData(MapSize)
	local size = GameInfo.Maps[MapSize].MapSizeType;
	local WrapX = false;

	if (size == "MAPSIZE_DUEL" or size == "MAPSIZE_TINY" or size == "MAPSIZE_SMALL") then
		g_CenterX = g_Minor.centerX;
		g_CenterY = g_Minor.centerY;
		g_landStrips = g_Minor.landStrips;
		g_xOffset = g_Minor.xOffset;
		g_yOffset = g_Minor.yOffset;

		return {Width = g_Minor.width, Height = g_Minor.height, WrapX = WrapX}
	else
		g_CenterX = g_Major.centerX;
		g_CenterY = g_Major.centerY;
		g_landStrips = g_Major.landStrips;
		g_xOffset = g_Major.xOffset;
		g_yOffset = g_Major.yOffset;

		return {Width = g_Major.width, Height = g_Major.height, WrapX = WrapX}
	end
end
-------------------------------------------------------------------------------
function GeneratePlotTypes()
	print("Generating Plot Types");
	local plotTypes = {};

	-- Start with it all as water
	for x = 0, g_iW - 1 do
		for y = 0, g_iH - 1 do
			local i = y * g_iW + x;
			local pPlot = Map.GetPlotByIndex(i);
			plotTypes[i] = g_PLOT_TYPE_OCEAN;
			TerrainBuilder.SetTerrainType(pPlot, g_TERRAIN_TYPE_OCEAN);
		end
	end

	-- Each land strip is defined by: Y, X Start, X End		
	for i, v in ipairs(g_landStrips) do
		local y = v[1] + g_yOffset;
		local xStart = v[2] + g_xOffset;
		local xEnd = v[3] + g_xOffset;
		for x = xStart, xEnd do
			local i = y * g_iW + x;
			local pPlot = Map.GetPlotByIndex(i);
			plotTypes[i] = g_PLOT_TYPE_LAND;
			TerrainBuilder.SetTerrainType(pPlot, g_TERRAIN_TYPE_DESERT);  -- temporary setting so can calculate areas
			g_iNumTotalLandTiles = g_iNumTotalLandTiles + 1;
		end
	end
		
	AreaBuilder.Recalculate();

	--	local world_age
	local world_age_new = 5;
	local world_age_normal = 3;
	local world_age_old = 2;

	local world_age = MapConfiguration.GetValue("world_age");
	if (world_age == 1) then
		world_age = world_age_new;
	elseif (world_age == 3) then
		world_age = world_age_old;
	else
		world_age = world_age_normal;	-- default
	end
	
	local args = {};
	args.world_age = world_age;
	args.iW = g_iW;
	args.iH = g_iH
	args.iFlags = g_iFlags;
	args.blendRidge = 10;
	args.blendFract = 1;
	args.extra_mountains = 4;
	plotTypes = ApplyTectonics(args, plotTypes);

	return plotTypes;
end

function InitFractal(args)

	if(args == nil) then args = {}; end

	local continent_grain = args.continent_grain or 2;
	local rift_grain = args.rift_grain or -1; -- Default no rifts. Set grain to between 1 and 3 to add rifts. - Bob
	local invert_heights = args.invert_heights or false;
	local polar = args.polar or true;
	local ridge_flags = args.ridge_flags or g_iFlags;

	local fracFlags = {};
	
	if(invert_heights) then
		fracFlags.FRAC_INVERT_HEIGHTS = true;
	end
	
	if(polar) then
		fracFlags.FRAC_POLAR = true;
	end
	
	if(rift_grain > 0 and rift_grain < 4) then
		local riftsFrac = Fractal.Create(g_iW, g_iH, rift_grain, {}, 6, 5);
		g_continentsFrac = Fractal.CreateRifts(g_iW, g_iH, continent_grain, fracFlags, riftsFrac, 6, 5);
	else
		g_continentsFrac = Fractal.Create(g_iW, g_iH, continent_grain, fracFlags, 6, 5);	
	end

	-- Use Brian's tectonics method to weave ridgelines in to the continental fractal.
	-- Without fractal variation, the tectonics come out too regular.
	--
	--[[ "The principle of the RidgeBuilder code is a modified Voronoi diagram. I 
	added some minor randomness and the slope might be a little tricky. It was 
	intended as a 'whole world' modifier to the fractal class. You can modify 
	the number of plates, but that is about it." ]]-- Brian Wade - May 23, 2009
	--
	local MapSizeTypes = {};
	for row in GameInfo.Maps() do
		MapSizeTypes[row.MapSizeType] = row.PlateValue;
	end
	local sizekey = Map.GetMapSize();

	local numPlates = MapSizeTypes[sizekey] or 4

	-- Blend a bit of ridge into the fractal.
	-- This will do things like roughen the coastlines and build inland seas. - Brian

	g_continentsFrac:BuildRidges(numPlates, {}, 1, 2);
end

function AddFeatures()
	print("Adding Features");

	-- Get Rainfall setting input by user.
	local rainfall = MapConfiguration.GetValue("rainfall");
	if rainfall == 4 then
		rainfall = 1 + TerrainBuilder.GetRandomNumber(3, "Random Rainfall - Lua");
	end
	
	local args = {rainfall = rainfall, iJunglePercent = 12, iMarshPercent = 11, iForestPercent = 12, iReefPercent = 25};
	local featuregen = FeatureGenerator.Create(args);

	featuregen:AddFeatures();
	
	-- Only keep floodplain far away from continent center
	for iX = 0, g_iW - 1 do
		for iY = 0, g_iH - 1 do
			local index = (iY * g_iW) + iX;
			local plot = Map.GetPlot(iX, iY);
			if (plot:GetFeatureType() == g_FEATURE_FLOODPLAINS) then
				local iDistanceFromCenter = Map.GetPlotDistance (iX, iY, g_CenterX, g_CenterY);

				-- 50/50 chance to add floodplains when get 20 tiles out.  Linear scale out to there
				if (TerrainBuilder.GetRandomNumber(40, "Resource Placement Score Adjust") >= iDistanceFromCenter) then
					TerrainBuilder.SetFeatureType(plot, -1);
				end
			end
		end
	end
end
------------------------------------------------------------------------------
function GenerateTerrainTypesAustralia(plotTypes, iW, iH, iFlags, bNoCoastalMountains)
	print("Generating Terrain Types");
	local terrainTypes = {};

	local fracXExp = -1;
	local fracYExp = -1;
	local grain_amount = 3;

	australia = Fractal.Create(iW, iH, 
									grain_amount, iFlags, 
									fracXExp, fracYExp);
									
	iDesertTop = australia:GetHeight(100);										
	local iDesertBottom;

	local iPlainsTop;	
	local iPlainsBottom;

	local iGrassTop;
	iGrassBottom = australia:GetHeight(0);

	for iX = 0, iW - 1 do
		for iY = 0, iH - 1 do
			local index = (iY * iW) + iX;
			if (plotTypes[index] == g_PLOT_TYPE_OCEAN) then
				if (IsAdjacentToLand(plotTypes, iX, iY)) then
					terrainTypes[index] = g_TERRAIN_TYPE_COAST;
				else
					terrainTypes[index] = g_TERRAIN_TYPE_OCEAN;
				end
			end
		end
	end

	if (bNoCoastalMountains == true) then
		plotTypes = RemoveCoastalMountains(plotTypes, terrainTypes);
	end

	for iX = 0, iW - 1 do
		for iY = 0, iH - 1 do
			local index = (iY * iW) + iX;

			local lat = (iY - iH/2)/(iH/2);

			local iDistanceFromCenter = Map.GetPlotDistance (iX, iY, g_CenterX, g_CenterY);

			-- Mainland
			if (lat > -0.7) then
				iDesertBottom = australia:GetHeight(iDistanceFromCenter/iW * 100);		-- more desert in the center
				iPlainsTop = australia:GetHeight(iDistanceFromCenter/iW * 100 + 7);
				iPlainsBottom = australia:GetHeight(7);
				iGrassTop = australia:GetHeight(7);

			-- Tasmania
			else
				iDesertBottom = australia:GetHeight(87);
				iPlainsTop = australia:GetHeight(87);
				iPlainsBottom = australia:GetHeight(70);
				iGrassTop = australia:GetHeight(70);
			end

			local desertVal = australia:GetHeight(iX, iY);
			local plainsVal = australia:GetHeight(iX, iY);
			local grassVal = australia:GetHeight(iX, iY);

			if (plotTypes[index] == g_PLOT_TYPE_MOUNTAIN) then
				if ((desertVal >= iDesertBottom) and (desertVal <= iDesertTop)) then
					terrainTypes[index] = g_TERRAIN_TYPE_DESERT_MOUNTAIN;
				elseif ((plainsVal >= iPlainsBottom) and (plainsVal <= iPlainsTop)) then
					terrainTypes[index] = g_TERRAIN_TYPE_PLAINS_MOUNTAIN;
				elseif ((grassVal >= iGrassBottom) and (grassVal <= iGrassTop)) then
					terrainTypes[index] = g_TERRAIN_TYPE_GRASS_MOUNTAIN;
				end
			elseif (plotTypes[index] ~= g_PLOT_TYPE_OCEAN) then			
				if ((desertVal >= iDesertBottom) and (desertVal <= iDesertTop)) then
					terrainTypes[index] = g_TERRAIN_TYPE_DESERT;
				elseif ((plainsVal >= iPlainsBottom) and (plainsVal <= iPlainsTop)) then
					terrainTypes[index] = g_TERRAIN_TYPE_PLAINS;
				elseif ((grassVal >= iGrassBottom) and (grassVal <= iGrassTop)) then
					terrainTypes[index] = g_TERRAIN_TYPE_GRASS;
				end
			end
		end
	end

	local bExpandCoasts = true;

	if bExpandCoasts == false then
		return
	end

	print("Expanding coasts");
	for iI = 0, 2 do
		local shallowWaterPlots = {};
		for iX = 0, iW - 1 do
			for iY = 0, iH - 1 do
				local index = (iY * iW) + iX;
				if (terrainTypes[index] == g_TERRAIN_TYPE_OCEAN) then
					-- Chance for each eligible plot to become an expansion is 1 / iExpansionDiceroll.
					-- Default is two passes at 1/4 chance per eligible plot on each pass.
					if (IsAdjacentToShallowWater(terrainTypes, iX, iY) and TerrainBuilder.GetRandomNumber(4, "add shallows") == 0) then
						table.insert(shallowWaterPlots, index);
					end
				end
			end
		end
		for i, index in ipairs(shallowWaterPlots) do
			terrainTypes[index] = g_TERRAIN_TYPE_COAST;
		end
	end
	
	return terrainTypes; 
end
------------------------------------------------------------------------------
function FeatureGenerator:AddIceAtPlot(plot, iX, iY)
	return false;
end

------------------------------------------------------------------------------
function CustomGetMultiTileFeaturePlotList(pPlot, eFeatureType, aPlots)

	-- First check this plot itself
	if (not TerrainBuilder.CanHaveFeature(pPlot, eFeatureType, true)) then
		return false;
	else
		table.insert(aPlots, pPlot:GetIndex());
	end

	-- Which type of custom placement is it?
	local customPlacement = GameInfo.Features[eFeatureType].CustomPlacement;

	-- 6 tiles in a straight line
	if (customPlacement == "PLACEMENT_REEF_EXTENDED") then

		for i = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
			local pPlots = {};
			local iNumFound = 1;	
			local bBailed = false;			
			pPlots[iNumFound] = Map.GetAdjacentPlot(pPlot:GetX(), pPlot:GetY(), i);
			if (pPlots[iNumFound] ~= nil and TerrainBuilder.CanHaveFeature(pPlots[iNumFound], eFeatureType, true)) then

				while iNumFound < 5 do
					iNumFound = iNumFound + 1;
					pPlots[iNumFound] = Map.GetAdjacentPlot(pPlots[iNumFound - 1]:GetX(), pPlots[iNumFound - 1]:GetY(), i);
					if (pPlots[iNumFound] == nil) then
						bBailed = true;
						break;
					elseif not TerrainBuilder.CanHaveFeature(pPlots[iNumFound], eFeatureType, true) then
						bBailed = true;
						break;
					end
				end

				if not bBailed then
					for j = 1, 5 do
						table.insert(aPlots, pPlots[j]:GetIndex());
					end
					print ("Found valid Extended Barrier Reef location at: " .. tostring(pPlot:GetX()) .. ", " .. tostring(pPlot:GetY()));
					return true;
				end
			end
		end
	end

	return false;
end

------------------------------------------------------------------------------

-- override: southern forest bias
function FeatureGenerator:AddForestsAtPlot(plot, iX, iY)
	--Forest Check. First see if it can place the feature.
	
	if(TerrainBuilder.CanHaveFeature(plot, g_FEATURE_FOREST)) then
		if(math.ceil(self.iForestCount * 100 / self.iNumLandPlots) <= self.iForestMaxPercent) then
			--Weight based on adjacent plots if it has more than 3 start subtracting
			local iScore = 3 * (1 - iY/g_iH) * 100;
			local iAdjacent = TerrainBuilder.GetAdjacentFeatureCount(plot, g_FEATURE_FOREST);

			if(iAdjacent == 0 ) then
				iScore = iScore;
			elseif(iAdjacent == 1) then
				iScore = iScore + 50;
			elseif (iAdjacent == 2 or iAdjacent == 3) then
				iScore = iScore + 150;
			elseif (iAdjacent == 4) then
				iScore = iScore - 50;
			else
				iScore = iScore - 200;
			end
				
			if(TerrainBuilder.GetRandomNumber(300, "Resource Placement Score Adjust") <= iScore) then
				TerrainBuilder.SetFeatureType(plot, g_FEATURE_FOREST);
				self.iForestCount = self.iForestCount + 1;
			end
		end
	end
end

-- override: more northern jungle
function FeatureGenerator:AddJunglesAtPlot(plot, iX, iY)
	--Jungle Check. First see if it can place the feature.
	if(TerrainBuilder.CanHaveFeature(plot, g_FEATURE_JUNGLE)) then
		if(math.ceil(self.iJungleCount * 100 / self.iNumLandPlots) <= self.iJungleMaxPercent) then

			--Weight based on adjacent plots if it has more than 3 start subtracting
			local iScore = 400 * iY;
			local iAdjacent = TerrainBuilder.GetAdjacentFeatureCount(plot, g_FEATURE_JUNGLE);

			if(iAdjacent == 0 ) then
				iScore = iScore;
			elseif(iAdjacent == 1) then
				iScore = iScore + 50;
			elseif (iAdjacent == 2 or iAdjacent == 3) then
				iScore = iScore + 150;
			elseif (iAdjacent == 4) then
				iScore = iScore - 50;
			else
				iScore = iScore - 200;
			end

			if(TerrainBuilder.GetRandomNumber(100, "Resource Placement Score Adjust") <= iScore) then
				TerrainBuilder.SetFeatureType(plot, g_FEATURE_JUNGLE);
				local terrainType = plot:GetTerrainType();

				if(terrainType == g_TERRAIN_TYPE_PLAINS_HILLS or terrainType == g_TERRAIN_TYPE_GRASS_HILLS) then
					TerrainBuilder.SetTerrainType(plot, g_TERRAIN_TYPE_PLAINS_HILLS);
				else
					TerrainBuilder.SetTerrainType(plot, g_TERRAIN_TYPE_PLAINS);
				end

				self.iJungleCount = self.iJungleCount + 1;
				return true;
			end

		end
	end

	return false
end

------------------------------------------------------------------------------
function FeatureGenerator:AddReefAtPlot(plot, iX, iY)

	--Reef Check. First see if it can place the feature.
	if(TerrainBuilder.CanHaveFeature(plot, g_FEATURE_REEF)) then
		self.iNumReefablePlots = self.iNumReefablePlots + 1;
		if(math.ceil(self.iReefCount * 100 / self.iNumReefablePlots) <= self.iReefMaxPercent) then
				--Weight based on adjacent plots
				local iScore  = 1.5 * (g_iH - iY);		-- more reef to north
				local iAdjacent = TerrainBuilder.GetAdjacentFeatureCount(plot, g_FEATURE_REEF);

				if(iAdjacent == 0 ) then
					iScore = iScore + 100;
				elseif(iAdjacent == 1) then
					iScore = iScore + 125;
				elseif (iAdjacent == 2) then
					iScore = iScore  + 150;
				elseif (iAdjacent == 3 or iAdjacent == 4) then
					iScore = iScore + 175;
				else
					iScore = iScore + 10000;
				end

				if(TerrainBuilder.GetRandomNumber(200, "Resource Placement Score Adjust") >= iScore) then
					TerrainBuilder.SetFeatureType(plot, g_FEATURE_REEF);
					self.iReefCount = self.iReefCount + 1;
				end
		end
	end
end