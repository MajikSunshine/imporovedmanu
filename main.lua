-- trident building inventory tracker
-- created by mr_spuck
--updated for new builds by Archangel Pyriel
--bug fix by Rio
manu = {}

manu.version = "2.1.5 Rio"

RegisterEvent(manu, "PLAYER_ENTERED_GAME")

function manu:OnEvent(event, data)
	if event == "PLAYER_ENTERED_GAME" then
		print ("Improved Manufacturing v"..manu.version)
	end
end

local itemreqs = {			
	["Fluid Formable Silksteel Alloy"] = {		
		station = {	
			["Pelatus C-12"] = true
		},	
		reqs = {	
			["SyntheticSilksteel"] = 8,
			["OreHeliocene"] = 3,
			["OreLanthanic"] = 6,
			["Ore2Carbonic"] = 5,
			["Ore2VanAzek"] = 10,
			["Refined2Silksteel"] = 50
		}	
	},		
	["Fused Composite Plating"] = {		
		station = {	
			["Latos I-8"] = true
		},	
		reqs = {	
			["SyntheticSilksteel"] = 8,
			["OreHeliocene"] = 3,
			["OrePentric"] = 2,
			["OuterHullPlate"] = 15,
			["Refined2Plasteel"] = 5,
			["Refined2Silksteel"] = 8,
			["RefinedHydrocarbons"] = 15,
			["RefinedXiRite"] = 10
		}	
	},		
	["Merged Cybernetics Array"] = {		
		station = {	
			["Bractus M-14"] = true
		},	
		reqs = {	
			["Milanar_Neural_Nodule"] = 1,
			["Prosus_Neural_Nodule"] = 1,
			["Siepos_Neural_Nodule"] = 1,
			["OreLanthanic"] = 16,
			["OrePentric"] = 6,
			["CyberneticsGradeEE"] = 4,
			["DataLinkConnectors"] = 20,
			["Superconductors"] = 12,
			["ThermalInsulatorTiles"] = 15,
			["UnassembledCargoCrates"] = 1
		}	
	},		
	["Milanar_Optical_Sensor"] = {		
		station = {	
			["Bractus M-14"] = true
		},	
		reqs = {	
			["Milanar_Observer_Optics"] = 2,
			["OreApicene"] = 17,
			["OreDenic"] = 6,
			["IndustrialTargeting"] = 4,
			["DataLinkConnectors"] = 16,
			["Optics"] = 20,
			["Refined2Plasteel"] = 200,
			["ScannerCircuitBoards"] = 4,
			["ThermalImagers"] = 2,
			["ThermalInsulatorTiles"] = 10,
			["UnassembledCargoCrates"] = 1
		}	
	},		
	["Milanar Master Computing System"] = {		
		station = {	
			["Bractus M-14"] = true
		},	
		reqs = {	
			["Merged Cybernetics Array"] = 64,
			["CyberneticsGradeFF"] = 8,
			["Milanar_Data_Aggregator"] = 1,
			["OreLanthanic"] = 250,
			["Ore2Ishik"] = 9,
			["DataLinkConnectors"] = 256,
			["Superconductors"] = 64,
			["ThermalInsulatorTiles"] = 24,
			["UnassembledCargoCrates"] = 1
		}	
	},		
	["Reinforced Bulkhead"] = {		
		station = {	
			["Bractus M-14"] = true,
			["Nyrius F-6"] = true
		},	
		reqs = {	
			["Fluid Formable Silksteel Alloy"] = 5,
			["Fused Composite Plating"] = 2,
			["OreHeliocene"] = 2,
			["OreLanthanic"] = 4,
			["Ore2Ishik"] = 8,
			["Refined2Silksteel"] = 6
		}	
	},		
	["Internal Bulkhead Assembly"] = {		
		station = {	
			["Latos I-8"] = true
		},	
		reqs = {	
			["Fluid Formable Silksteel Alloy"] = 1,
			["Reinforced Bulkhead"] = 3,
			["OreHeliocene"] = 7,
			["OreLanthanic"] = 9,
			["Ore2Carbonic"] = 90,
			["Ore2Xithricite"] = 40,
			["DataLinkConnectors"] = 20,
			["Firesuppressionsystem"] = 1
		}	
	},		
	["External Hull Assembly"] = {		
		station = {	
			["Latos I-8"] = true
		},	
		reqs = {	
			["Fluid Formable Silksteel Alloy"] = 5,
			["Fused Composite Plating"] = 5,
			["Internal Bulkhead Assembly"] = 2,
			["OreDenic"] = 6,
			["OreHeliocene"] = 7,
			["OreLanthanic"] = 9,
			["Ore2Carbonic"] = 70,
			["Ore2VanAzek"] = 19,
			["HullPanels"] = 250
		}	
	},		
	["Engine Pylon Assembly"] = {		
		station = {	
			["Pelatus C-12"] = true
		},	
		reqs = {	
			["Fluid Formable Silksteel Alloy"] = 5,
			["Fused Composite Plating"] = 10,
			["Internal Bulkhead Assembly"] = 1,
			["OreHeliocene"] = 11,
			["OreLanthanic"] = 14,
			["Ore2Xithricite"] = 260,
			["DataLinkConnectors"] = 10,
			["EngineMounts"] = 32,
			["OuterHullPlate"] = 60,
			["RadiationContainmentKit"] = 16
		}	
	},		
	["Docking Bay Hanger Assembly"] = {		
		station = {	
			["Bractus M-14"] = true
		},	
		reqs = {	
			["Fluid Formable Silksteel Alloy"] = 2,
			["Fused Composite Plating"] = 5,
			["Internal Bulkhead Assembly"] = 2,
			["OreHeliocene"] = 4,
			["OreLanthanic"] = 10,
			["Ore2Ferric"] = 131,
			["DataLinkConnectors"] = 2,
			["OuterHullPlate"] = 10
		}	
	},		
	["200MW Reactor"] = {		
		station = {	
			["Pelatus C-12"] = true
		},	
		reqs = {	
			["Fluid Formable Silksteel Alloy"] = 20,
			["Fused Composite Plating"] = 16,
			["SyntheticSilksteel"] = 16,
			["OreHeliocene"] = 10,
			["OreLanthanic"] = 15,
			["Ore2Carbonic"] = 180,
			["Ore2Ferric"] = 220,
			["Ore2Ishik"] = 19,
			["Ore2Xithricite"] = 50,
			["Coolant"] = 500,
			["DataLinkConnectors"] = 64,
			["EnergyConversionModule"] = 128,
			["Refined2Plasteel"] = 60,
			["IndustrialPowerRegulators"] = 256,
			["RadiationContainmentKit"] = 30,
			["Samoflange"] = 1
		}	
	},		
	["80MW Engine"] = {		
		station = {	
			["Latos I-8"] = true
		},	
		reqs = {	
			["Fluid Formable Silksteel Alloy"] = 25,
			["Fused Composite Plating"] = 8,
			["SyntheticSilksteel"] = 8,
			["OreHeliocene"] = 8,
			["OreLanthanic"] = 22,
			["Ore2Carbonic"] = 240,
			["Ore2Ferric"] = 180,
			["Ore2Ishik"] = 16,
			["Ore2Xithricite"] = 50,
			["Coolant"] = 250,
			["DataLinkConnectors"] = 16,
			["EnergyConversionModule"] = 4,
			["HydraulicTappets"] = 16,
			["IndustrialPowerRegulators"] = 90,
			["RefinedHydrocarbons"] = 22
		}	
	},		
	["Trident Type M"] = {		
		station = {	
			["Latos M-7"] = true
		},	
		reqs = {	
			["Fluid Formable Silksteel Alloy"] = 20,
			["Fused Composite Plating"] = 30,
			["Milanar_Optical_Sensor"] = 1,
			["Milanar Master Computing System"] = 1,
			["Internal Bulkhead Assembly"] = 8,
			["External Hull Assembly"] = 8,
			["Engine Pylon Assembly"] = 2,
			["Docking Bay Hanger Assembly"] = 4,
			["200MW Reactor"] = 1,
			["80MW Engine"] = 2,
			["Ore2Silicate"] = 1000,
			["Ore2Carbonic"] = 2000,
			["Ore2Ferric"] = 600,
			["Ore2VanAzek"] = 200,
			["Ore2Ishik"] = 200,
			["Ore2Xithricite"] = 400,
			["OreHeliocene"] = 350,
			["OreLanthanic"] = 280,
			["OreApicene"] = 160,
			["OreDenic"] = 300,
			["OuterHullPlate"] = 100,
			["DataLinkConnectors"] = 512,
			["HullPanels"] = 200,
			["Firesuppressionsystem"] = 8,
			["IndustrialTargeting"] = 6,
			["IndustrialPowerRegulators"] = 100,
			["AirlockMaintenanceSupplies"] = 5,
			["CommercialTextiles"] = 10,
			["BearingGrease"] = 14,
			["DopplerArray"] = 4,
			["EscapeHatchSystem"] = 2,
			["ExhaustManifold"] = 8,
			["ExternalEquipmentMounts"] = 24,
			["ExternalThermalCouplers"] = 16,
			["ExtravehicularSuits"] = 2,
			["FlightAssistControlModule"] = 4,
			["FrequencyModulators"] = 6,
			["Gyroscopes"] = 2,
			["IndustrialCooling"] = 20,
			["IndustrialOxygenRecycler"] = 16,
			["IndustrialStabilizers"] = 64,
			["IndustrialTargeting2"] = 6,
			["InstrumentationPanel"] = 20,
			["LifeSupportSystem"] = 4,
			["NavigationUnit"] = 8,
			["PilotSafetyHarness"] = 8,
			["ShipPaint"] = 160
		}	
	},		
	["Siepos Master Computing System"] = {		
		station = {	
			["Pelatus C-12"] = true
		},	
		reqs = {	
			["OreIshik"] = 9,
			["OrePyronic"] = 250,
			["DataLinkConnectors"] = 256,
			["Superconductors"] = 64,
			["ThermalInsulatorTiles"] = 24,
			["UnassembledCargoCrates"] = 1,
			["Siepos_Data_Aggregator"] = 1,
			["CyberneticsGradeFF"] = 8,
			["Merged Cybernetics Array"] = 64
		}	
	},		
	["Siepos_Optical_Sensor"] = {		
		station = {	
			["Pelatus C-12"] = true
		},	
		reqs = {	
			["OreApicene"] = 17,
			["OreDenic"] = 6,
			["Refined2Plasteel"] = 200,
			["DataLinkConnectors"] = 16,
			["ThermalInsulatorTiles"] = 10,
			["UnassembledCargoCrates"] = 1,
			["Siepos_Observer_Optics"] = 2,
			["IndustrialTargeting"] = 4,
			["Optics"] = 20,
			["ThermalImagers"] = 2,
			["ScannerCircuitBoards"] = 4
		}	
	},		
	["Prosus Master Computing System"] = {		
		station = {	
			["Latos I-8"] = true
		},	
		reqs = {	
			["OreIshik"] = 9,
			["OreApicene"] = 250,
			["DataLinkConnectors"] = 256,
			["Superconductors"] = 64,
			["ThermalInsulatorTiles"] = 24,
			["UnassembledCargoCrates"] = 1,
			["Prosus_Data_Aggregator"] = 1,
			["CyberneticsGradeFF"] = 8,
			["Merged Cybernetics Array"] = 64
		}	
	},		
	["Prosus_Optical_Sensor"] = {		
		station = {	
			["Latos I-8"] = true
		},	
		reqs = {	
			["OreApicene"] = 17,
			["OreDenic"] = 6,
			["Refined2Plasteel"] = 200,
			["DataLinkConnectors"] = 16,
			["ThermalInsulatorTiles"] = 10,
			["UnassembledCargoCrates"] = 1,
			["Prosus_Observer_Optics"] = 2,
			["IndustrialTargeting"] = 4,
			["Optics"] = 20,
			["ThermalImagers"] = 2,
			["ScannerCircuitBoards"] = 4
		}	
	},		
	["RepairCannon03turret"] = {		
		station = {	
			["Latos I-8"] = true
		},	
		reqs = {	
			["IndustrialPowerRegulators"] = 1,
			["GuidedMissileCasings"] = 6,
			["SolidFuelPacks"] = 6,
			["IndustrialTargeting2"] = 1,
			["Refined2Plasteel"] = 2,
			["OreHeliocene"] = 4,
			["OrePentric"] = 2,
			["DentekProcessor"] = 1
		}	
	},		
	["MineLauncher03"] = {		
		station = {	
			["Latos I-8"] = true
		},	
		reqs = {	
			["IndustrialPowerRegulators"] = 16,
			["Ore2Carbonic"] = 280,
			["Ore2VanAzek"] = 50,
			["Ore2Ferric"] = 460,
			["Ore2Silicate"] = 80,
			["OrePentric"] = 40,
			["Ore2Xithricite"] = 60,
			["SolidExplosives"] = 22,
			["Refined2Plasteel"] = 4,
			["AmplificationModule"] = 20,
			["IndustrialPlasmaCore"] = 16,
			["RefinedXiRite"] = 10,
			["QueenProcessor"] = 4,
			["DentekProcessor"] = 4,
			["OuterHullPlate"] = 6,
			["HullPanels"] = 4,
			["GuardianProcessor"] = 16,
			["ArtemisProcessor"] = 24
		}	
	},		
	["centurionSuperlight"] = {		
		station = {	
			["Sedina D-14"] = true,
			["Odia J-9"] = true,
			["Odia K-12"] = true,
			["Odia M-14"] = true,
			["Bractus D-9"] = true
		},	
		reqs = {	
			["InstrumentationPanel"] = 2,
			["Ore2Carbonic"] = 70,
			["Ore2VanAzek"] = 50,
			["Ore2Ferric"] = 60,
			["Ore2Silicate"] = 19,
			["OrePentric"] = 10,
			["Ore2Xithricite"] = 45,
			["ThrustRegulators"] = 4,
			["ThermalInsulatorTiles"] = 15,
			["EngineMounts"] = 8,
			["DataLinkConnectors"] = 6,
			["PilotSafetyHarness"] = 1,
			["NavigationUnit"] = 2,
			["PropellantActuators"] = 4,
			["OuterHullPlate"] = 6,
			["HullPanels"] = 15,
			["GuardianProcessor"] = 4,
			["ArtemisProcessor"] = 8
		}	
	},		
	["FireCrackerTurret"] = {		
		station = {	
			["Bractus M-14"] = true
		},	
		reqs = {	
			["IndustrialPowerRegulators"] = 1,
			["GuidedMissileCasings"] = 6,
			["SolidFuelPacks"] = 6,
			["IndustrialTargeting2"] = 1,
			["Refined2Plasteel"] = 2,
			["OreHeliocene"] = 4,
			["OrePentric"] = 2,
			["SolidExplosives"] = 3,
			["DentekProcessor"] = 2
		}	
	},		
	["Blaster03MkIIIturret"] = {		
		station = {	
			["Pelatus C-12"] = true
		},	
		reqs = {	
			["IndustrialPowerRegulators"] = 1,
			["Ore2Carbonic"] = 15,
			["Ore2VanAzek"] = 10,
			["IndustrialTargeting2"] = 1,
			["OreHeliocene"] = 5,
			["OreLanthanic"] = 2,
			["Refined2Silksteel"] = 5,
			["IndustrialIonCore"] = 1,
			["DentekProcessor"] = 1
		}	
	},		
	["ConcussionRail"] = {		
		station = {	
			["Latos I-8"] = true,
			["Pelatus C-12"] = true,
			["Bractus M-14"] = true
		},	
		reqs = {	
			["IndustrialPowerRegulators"] = 2,
			["RefinedChemVolatile"] = 8,
			["Ore2Ferric"] = 15,
			["Ore2Ishik"] = 15,
			["Ore2Xithricite"] = 15,
			["SyntheticSilksteel"] = 5,
			["GuardianProcessor"] = 1
		}	
	},		
	["Blaster03MkV"] = {		
		station = {	
			["Sedina D-14"] = true,
			["Odia J-9"] = true,
			["Odia K-12"] = true,
			["Odia M-14"] = true,
			["Bractus D-9"] = true
		},	
		reqs = {	
			["IndustrialPowerRegulators"] = 2,
			["Ore2Carbonic"] = 15,
			["Ore2VanAzek"] = 10,
			["OreHeliocene"] = 15,
			["OreLanthanic"] = 15,
			["IndustrialIonCore"] = 1,
			["Refined2Silksteel"] = 10,
			["DentekProcessor"] = 2,
			["GuardianProcessor"] = 1
		}	
	},		
	["Stygian Furie"] = {		
		station = {	
			["Verasi E-14"] = true
		},	
		reqs = {	
			["Ore2Aquean"] = 40,
			["Ore2Xithricite"] = 30,
			["OreLanthanic"] = 20,
			["OreApicene"] = 10,
			["LCD"] = 6,
			["Gyroscopes"] = 6,
			["GuardianProcessor"] = 3,
			["AdvancedLogisticsSystem"] = 1
		}	
	},		
	["Goliath"] = {		
		station = {	
			["Latos M-7"] = true
		},	
		reqs = {	
			["200MW Reactor"] = 1,
			["80MW Engine"] = 1,
			["Docking Bay Hanger Assembly"] = 1,
			["Engine Pylon Assembly"] = 1,
			["External Hull Assembly"] = 2,
			["Fluid Formable Silksteel Alloy"] =8,
			["Fused Composite Plating"] = 10,
			["Internal Bulkhead Assembly"] = 2,
			["Milanar Master Computing System"] = 1,
			["Milanar_Optical_Sensor"] = 1,
			["ArtemisProcessor"] = 100,
			["OreApicene"] = 60,
			["OreDenic"] = 100,
			["OreHeliocene"] = 75,
			["OreLanthanic"] = 100,
			["Ore2Carbonic"] = 600,
			["Ore2Ferric"] = 300,
			["Ore2Ishik"] = 100,
			["Ore2Silicate"] = 400,
			["Ore2VanAzek"] = 80,
			["Ore2Xithricite"] = 150,
			["IndustrialTargeting2"] = 2,
			["AirlockMaintenanceSupplies"] = 3,
			["IndustrialTargeting"] = 3,
			["BearingGrease"] = 7,
			["CommercialTextiles"] =4,
			["IndustrialCooling"] = 12,
			["DataLinkConnectors"] = 140,
			["DopplerArray"] = 2,
			["EscapeHatchSystem"] = 1,
			["ExhaustManifold"] =2,
			["ExternalEquipmentMounts"] = 6,
			["ExternalThermalCouplers"] = 6,
			["ExtravehicularSuits"] = 1,
			["Firesuppressionsystem"] = 2,
			["FlightAssistControlModule"] = 1,
			["FrequencyModulators"] = 2,
			["Gyroscopes"] = 2,
			["HullPanels"] = 40,
			["InstrumentationPanel"] = 10,
			["LifeSupportSystem"] =  2,
			["NavigationUnit"] = 4,
			["OuterHullPlate"] = 25,
			["IndustrialOxygenRecycler"] = 6,
			["PilotSafetyHarness"] = 2,
			["IndustrialPowerRegulators"] = 30,
			["ShipPaint"] = 45,
			["IndustrialStabilizers"] = 22
		}	
			
	}		
}			

local itemtypes = {}
for item,iteminfo in pairs(itemreqs) do
	itemtypes[item] = true
	for req in pairs(iteminfo.reqs) do
		itemtypes[req] = true
	end
end

local SETTINGSYS = 387587842

local defaultsettings = {
	nearbystations = {
	},
	excludedstations = {
	},
	locationfilter = 3,
	locationfilter_custom = {
	},
	showitem = "Trident Type M",
	showitem_count = 1
}


local settings

local function load_settings()
	if GetPlayerName() then
		local notedata = unspickle(LoadSystemNotes(SETTINGSYS))
		for i in pairs(defaultsettings) do
			if not notedata[i] then
				settings = defaultsettings
				return
			end
		end
		settings = notedata
	end
end

local function save_settings()
	if GetPlayerName() then
		SaveSystemNotes(spickle(settings), SETTINGSYS)
	end
end

local function manuprint(str)
	print(str)
end

local function tablekeys(t)
--This function will not handle tables and should be updated
local ret = {}
	for i,v in pairs(t) do
		table.insert(ret, i)
	end
	return ret
end

local itemclasses = {
	[CLASSTYPE_GENERIC] = true,
	[CLASSTYPE_SHIP] = true,
	[CLASSTYPE_ADDON] = true
}

local function get_player_inventory()
	local items = {}
	for _,item in PlayerInventoryPairs() do

		if itemclasses[GetInventoryItemClassType(item)] then
			local internalname = InvManager.InventoryItemTypeToName(GetInventoryItemType(item))

			if itemtypes[internalname] then
				local location = GetInventoryItemLocation(item)
				local locationstr = (location ~= 0) and ShortLocationStr(SplitStationID(location)) or "[Space]"
				table.insert(items, {type=internalname,
						     station=locationstr,
						     count=GetInventoryItemQuantity(item)})
			end
		end
	end
	return items
end


local function _get_buildreqs_all(item, count, reqs)
	reqs = reqs or {}
	if itemreqs[item] then
		for i,v in pairs(itemreqs[item].reqs) do
			if reqs[i] then
				reqs[i] = reqs[i] + (v * count)
			else
				reqs[i] = v * count
			end
			_get_buildreqs_all(i, count * v, reqs)
		end
	else
		if reqs[item] then
			reqs[item] = reqs[item] + count
		else
			reqs[item] = count
		end
	end
	return reqs
end

local function get_buildreqs_all(item, count)
	local reqs = _get_buildreqs_all(item, count)
	reqs[item] = count

	return reqs
end


local function get_manu_stations()
	local stations = {}
	for _,iteminfo in pairs(itemreqs) do
		for station in pairs(iteminfo.station) do
			stations[station] = true
		end
	end
	return stations
end


-- really awkward way to get the location of all stations
-- TODO: find a better way or hardcode it
local function get_universe_stations()
	local stations = get_manu_stations()
	for i=1,30 do
		local sysinfo = dofile(string.format("lua/maps/system%02dmap.lua", i))
		for j,sectorinfo in ipairs(sysinfo[1]) do
			if sectorinfo.icon == "images/nav_station_wormhole.png" or sectorinfo.icon == "images/nav_station.png" then
				stations[ShortLocationStr(256 * (i - 1) + sectorinfo.id)] = true
			end
		end
	end

	return stations
end

local function itemid_to_invname(item)
	return InvManager.InventoryItemTypeToName(GetInventoryItemType(item))
end

local function invname_to_name(invname)
	return InvManager.GetInventoryItemParameter(InvManager.InventoryItemToType(invname), "Name") or invname
end

local function invname_sort(a, b)
	return invname_to_name(a) < invname_to_name(b)
end

local function load_cargo(item)
	if itemreqs[item] then
		local stationcargo = {}
		for _,stationitem in ipairs(GetStationCargoList()) do
			stationcargo[itemid_to_invname(stationitem)] = stationitem
		end

		local toload = {}
		for name,count in pairs(itemreqs[item].reqs) do
			local stationitem = stationcargo[name]
			if stationitem then
				table.insert(toload, {itemid = stationitem, quantity = count})
			end
		end
		LoadCargo(toload)
	else
		print("no such item")
	end
end


local function manu(target, count)

	local obj = {}

	local manunearbystations = {}
	local manuexcludedstations = {}
	
	local manutarget
	local manucount

	local inventory = {}
	local reducedinventory = {}
	local manuitemreqs = {}


	function obj:get_buildreq_item_count(item, target, count)
		target = target or manutarget
		count = count or manucount

		local reqs = self:get_buildreqs(target, count)
		return reqs[item] or 0
	end

	local function _get_buildreqs(item, count, reqs)
		reqs = reqs or {}
		if manuitemreqs[item] then
			for i,v in pairs(manuitemreqs[item].reqs) do
				if reqs[i] then
					reqs[i] = reqs[i] + (v * count)
				else
					reqs[i] = v * count
				end
				_get_buildreqs(i, count * v, reqs)
			end
		else
			reqs[item] = reqs[item] or count
		end
		return reqs
	end

	-- returns stuff needed to finish the target or for specified item
	-- recursive and includes specified item
	function obj:get_buildreqs(item, count)
		item = item or manutarget
		count = count or manucount

		local reqs = _get_buildreqs(item, count)
		reqs[item] = count
		return reqs
	end

	-- returns a copy of the itemreqs for the target or for specifed item
	function obj:get_itemreqs(item)
		item = item or manutarget
		
		local ret = {}
		if manuitemreqs[item] then
			for i,v in pairs(manuitemreqs[item].reqs) do
				ret[i] = v
			end
		end
		return ret
	end

	function obj:set_target(target, count)
		manuitemreqs = {}
		local reqs = get_buildreqs_all(target, count)
		
		for item,iteminfo in pairs(itemreqs) do
			if reqs[item] then
				manuitemreqs[item] = iteminfo
			end
		end

		manutarget = target
		manucount = count
		
		-- set_inventory rebuilds the reduced inventory
		self:set_inventory(inventory)
	end

	function obj:get_inventory_item_count(item)
		item = item or manutarget

		local ret = 0
		for _,iteminfo in pairs(inventory) do
			if iteminfo.type == item then
				ret = ret + iteminfo.count
			end
		end
		return ret
	end


	-- get table with number of items at station and nearby stations
	function obj:get_station_item_count(station, type)
		local count = 0
		local countnearby = 0

		local nearbystations = manunearbystations[station]

		for _,iteminfo in pairs(reducedinventory) do
			if iteminfo.type == type then
				if iteminfo.station == station then
					count = count + iteminfo.count
				end

				if nearbystations and nearbystations[iteminfo.station] then
					countnearby = countnearby + iteminfo.count
				end
			end
		end
		return { count, countnearby }
	end


	function obj:num_needed(item)
		-- how many of the specified items are needed for the target
		local neededcount = self:get_buildreq_item_count(item)

		-- substract finished items and ones that have been consumed by other parts
		for _,finisheditem in pairs(reducedinventory) do
			neededcount = neededcount - self:get_buildreq_item_count(item, finisheditem.type, finisheditem.count)
		end

		return neededcount
	end


	local function is_excluded(item, station)
		return manuexcludedstations[item] and manuexcludedstations[item][station]
	end
	
	-- TODO: the results of these 3 should be cached until the next :set_inventory call
	function obj:needed_at_station(station)
		local makes = {}
		for item,iteminfo in pairs(manuitemreqs) do
			if iteminfo.station[station] and not is_excluded(item, station) then
				makes[item] = true
			end
		end
		
		local needed = {}
		for item in pairs(makes) do
			local neededcount = self:num_needed(item)
			for req,count in pairs(manuitemreqs[item].reqs) do
				needed[req] = (needed[req] or 0) + (neededcount * count)
			end
		end

		return needed
	end

	function obj:stored_at_station(station)
		local stored = {}
		for item,iteminfo in pairs(manuitemreqs) do
			if iteminfo.station[station] and not is_excluded(item, station) then
				stored[item] = stored[item] or self:get_station_item_count(station, item)
				for reqitem in pairs(iteminfo.reqs) do
					stored[reqitem] = stored[reqitem] or self:get_station_item_count(station, reqitem)
				end
			end
		end
		return stored
	end




	-- what and how much can currently be built at this station
	function obj:buildable_at_station(station)
		local stored = self:stored_at_station(station)

		local makes = {}
		for item,iteminfo in pairs(manuitemreqs) do
			if iteminfo.station[station] and not is_excluded(item, station) then
				makes[item] = true
			end
		end

		local ret = {}

		for item in pairs(makes) do
			local buildcount
			for req,reqcount in pairs(manuitemreqs[item].reqs) do
				if not stored[req] then
					buildcount = 0
				end
				local tmpcount = math.floor((stored[req][1] + stored[req][2]) / reqcount)
				buildcount = math.min(buildcount or tmpcount, tmpcount)

				if buildcount == 0 then
					break
				end
			end
			ret[item] = buildcount
		end
		return ret
	end
	
	function obj:get_item_stations(item)
		local stations = {}
		for _,iteminfo in ipairs(reducedinventory) do
			if iteminfo.type == item then
				if stations[iteminfo.station] then
					stations[iteminfo.station].count = stations[iteminfo.station].count + iteminfo.count
				else
					stations[iteminfo.station] = iteminfo
				end
			end
		end
		return stations
	end

	function obj:set_inventory(inv)
		inventory = inv
		reducedinventory = {}
		
		if manutarget then
			local reqs = self:get_buildreqs()
			for _,iteminfo in pairs(inventory) do
				if reqs[iteminfo.type] then
					table.insert(reducedinventory, iteminfo)
				end
			end
		end
	end

	function obj:set_nearby_stations(stations)
		manunearbystations = stations
	end

	function obj:set_excluded_stations(stations)
		manuexcludedstations = stations
	end

	obj:set_target(target, count)

	return obj
end


local function make_nearby_tab()
	local tabnearbystations = {}

	local stationlist = iup.pdasubsubsublist{DROPDOWN="YES", EXPAND="HORIZONTAL", visible_items=10}

	local stations = tablekeys(get_manu_stations())
	table.sort(stations)
	for i,station in ipairs(stations) do
		stationlist[i] = station
	end


	local univlist = iup.pdasubsubsublist{EXPAND="YES", MULTIPLE="YES"}

	local univstations = tablekeys(get_universe_stations())
	table.sort(univstations)

	for i,station in ipairs(univstations) do
		univlist[i] = station
	end


	function stationlist:action(sel)
		local value = ""
		if tabnearbystations[sel] then
			for _,station in ipairs(univstations) do
				value = value..(tabnearbystations[sel][station] and "+" or "-")
			end
		end
		univlist.value = value
	end

	function univlist:action()
		local station = stationlist[stationlist.value]

		local newstations = {}
		for i=1,#(univlist.value) do
			if string.sub(univlist.value, i, i) == "+" then
				newstations[univlist[i]] = true
			end
		end
		tabnearbystations[station] = newstations
	end

	local header = iup.label{title="Specify which stations are considered nearby to manufactoring stations.\nItems in these stations will be added to the manufactoring stations inventory.\n Careful: Assigning a station to multiple manufactoring stations may lead misleading results"}

	local tab = iup.vbox{header, iup.fill{size="5"}, stationlist, univlist}

	function tab:set_nearby_stations(stations)
		tabnearbystations = stations
		-- shitty hack.. force an update of the univlist
		stationlist:action(stationlist[stationlist.value])
	end

	function tab:get_nearby_stations()
		return tabnearbystations
	end

	function tab:OnShow()
	end

	function tab:OnHide()
	end

	return tab
end




local function make_exclude_tab()
	local excludedstations = {}

	local itemlist = iup.pdasubsubsublist{DROPDOWN="YES", EXPAND="HORIZONTAL", visible_items=10}

	local itemnames = tablekeys(itemreqs)
	table.sort(itemnames, invname_sort)

	for i,item in ipairs(itemnames) do
		itemlist[i] = invname_to_name(item)
	end
	
	local stationlist = iup.pdasubsubsublist{EXPAND="YES", MULTIPLE="YES"}


	function itemlist:action(sel, i)
		local item = itemnames[i] or itemnames[1]
		
		local itemstations = tablekeys(itemreqs[item].station)
		for i,station in ipairs(itemstations) do
			stationlist[i] = station
		end
		stationlist[#itemstations + 1] = nil

		local value = ""
		if excludedstations[item] then
			for _,station in ipairs(itemstations) do
				value = value..(excludedstations[item][station] and "+" or "-")
			end
		end
		stationlist.value = value
	end

	function stationlist:action()
		local item = itemnames[tonumber(itemlist.value)]

		local newstations = {}
		for i=1,#(stationlist.value) do
			if string.sub(stationlist.value, i, i) == "+" then
				newstations[stationlist[i]] = true
			end
		end
		excludedstations[item] = newstations
	end

	local header = iup.label{title="Omit stations from the list of manufactoring stations for the selected item.\ne.g. I only want to build RBH in Nyrius so don't tell me to cart FCP to Bractus!"}

	local tab = iup.vbox{header, iup.fill{size="5"}, itemlist, stationlist}

	function tab:set_excluded_stations(stations)
		excludedstations = stations
		-- shitty hack.. force an update of the itemlist
		itemlist:action(itemlist[itemlist.value], tonumber(itemlist.value))
	end

	function tab:get_excluded_stations()
		return excludedstations
	end

	function tab:OnShow()
	end

	function tab:OnHide()
	end

	return tab
end


local function make_inventory_tab()
	local invtree
	local infobox
	local itemcount
	
	local use_blank_inv

	local manuobj = manu("Trident Type M", 1)

	local matrixstations = {}

	local function update()
		manuobj:set_inventory(use_blank_inv and {} or get_player_inventory())

		itemcount.title = manuobj:get_inventory_item_count()
		iup.Refresh(itemcount)

		invtree.DELLIN = "1--1"

		local manustations = tablekeys(get_manu_stations())
		table.sort(manustations)

		matrixstations = {}

		local line = 1
		for _,station in ipairs(manustations) do

			local stored = manuobj:stored_at_station(station)
			local needed = manuobj:needed_at_station(station)

			-- add placeholders for items that are stored but not needed at the station
			-- usually ones that have been manufactored there
			-- TODO: maybe these should go at the end
			for item in pairs(stored) do
				needed[item] = needed[item] or 0
			end

			local neededkeys = tablekeys(needed)
			table.sort(neededkeys, invname_sort)
			
			if #neededkeys > 0 then
				invtree.ADDLIN = line
				invtree:setcell(line, 1, station)
				matrixstations[line] = { station=station }
				line = line + 1

				for _,item in ipairs(neededkeys) do
					local storedall = stored[item][1] + stored[item][2]
					local remaining = math.max(needed[item] - storedall, 0)
					local colorstr = (remaining == 0) and "\127a0a0a0" or ""

					invtree.ADDLIN = line
					invtree:setcell(line, 1, colorstr..tostring(invname_to_name(item)))
					invtree:setcell(line, 2, colorstr..tostring(storedall))
					invtree:setcell(line, 3, colorstr..tostring(remaining))
					
					-- XXX store station associated with this line in a table
					-- could this be attached to a cell?
					matrixstations[line] = { station=station, item=item }
					
					line = line + 1
				end

				-- blank line between stations
				invtree.ADDLIN = line
				invtree:setcell(line, 1, "")
				line = line + 1
			end
		end

		infobox.VALUE = "Nothing selected"
	end

	itemcount = iup.label{title=""}
	local itemlist = iup.pdasubsubsublist{DROPDOWN="YES", visible_items=10}

	local itemnames = tablekeys(itemreqs)
	table.sort(itemnames, invname_sort)
	
	for i,item in ipairs(itemnames) do
		itemlist[i] = invname_to_name(item)
	end

	function itemlist:action(sel, i)
		local item = itemnames[i]
		manuobj:set_target(item, settings.showitem_count)
		settings.showitem = item
		update()
	end

	local itemtargetcount = iup.text{size="%20x", expand="NO"}
	function itemtargetcount:action(_, val)
		val = tonumber(val or 0) or 0
		if val >= 0 then
			manuobj:set_target(settings.showitem, val)
			settings.showitem_count = val
			update()
			return
		end
		return iup.IGNORE
	end

	invtree = iup.pdasubmatrix{NUMCOL=3, CELLSIZE=10, EXPAND="YES", size="1", BGCOLOR="0 0 0 0"}
	invtree["0:1"] = ""
	invtree["ALIGNMENT1"] = "ALEFT"
	invtree["0:2"] = "Stored"
	invtree["0:3"] = "Remaining"

	infobox = iup.stationsubmultiline{READONLY="YES", EXPAND="VERTICAL", SIZE="%25", VALUE="Nothing selected"}

	function invtree:edition_cb()
		return iup.IGNORE
	end

	function invtree:click_cb(line, col)
		local lineinfo = matrixstations[line]
		if not lineinfo then
			infobox.VALUE = ""
			return
		end

		local station = lineinfo.station
		local lineitem = lineinfo.item

		local value = {}
		if lineitem then
			local stored = manuobj:stored_at_station(station)

			table.insert(value, "Inventory: "..manuobj:get_inventory_item_count(lineitem))
			
			local itemstored = stored[lineitem] or {0, 0}
			table.insert(value, "Stored at station: "..itemstored[1])
			table.insert(value, "Stored nearby: "..itemstored[2])
			table.insert(value, "")


			local buildable = manuobj:buildable_at_station(station)
			if buildable[lineitem] then
				local count = buildable[lineitem]
				
				table.insert(value, "Needed overall: "..manuobj:num_needed(lineitem))
				table.insert(value, "Ready to build: "..count)
				table.insert(value, "")
				table.insert(value, "To build more get at least:")
				
				local reqs = manuobj:get_itemreqs(lineitem)
				local itemnames = tablekeys(reqs)
				table.sort(itemnames, invname_sort)

				for _,item in ipairs(itemnames) do
					-- XXX: too messy
					
					local reqcount = reqs[item]
					
					local reqitemstored = 0
					if stored[item] then
						reqitemstored = stored[item][1] + stored[item][2] 
					end
					
					-- substract amount of requirement items that we have from what would be needed
					-- to build one more of this type
					local reqitemneeded = (reqcount * (count + 1)) - reqitemstored
					
					if reqitemneeded > 0 then
						table.insert(value, reqitemneeded.."x "..invname_to_name(item))
					end
				end
				table.insert(value, "")
			end
			
			

			local itemnames = tablekeys(buildable)
			table.sort(itemnames, invname_sort)

			local enoughfor_value = {}
			for _,item in ipairs(itemnames) do
				local reqs = manuobj:get_itemreqs(item)
				if reqs[lineitem] then
					local canbuild = math.floor((stored[lineitem][1] + stored[lineitem][2]) / reqs[lineitem])
					table.insert(enoughfor_value, canbuild.."x "..invname_to_name(item).." ("..manuobj:num_needed(item).." needed)")
				end
			end
			
			if #enoughfor_value > 0 then
				table.insert(value, "Enough for:")
				table.insert(value, table.concat(enoughfor_value, "\n"))
			end
		else
			for item,count in pairs(manuobj:buildable_at_station(station)) do
				if count ~= 0 then
					table.insert(value, count.."x "..item.." ("..manuobj:num_needed(item).." needed)")
				end
			end
		
		
			if #value == 0 then
				table.insert(value, 1, "You can't currently build anything at "..tostring(station))
			else
				table.insert(value, 1, "At "..tostring(station).." you can currently build")
			end
		end
		infobox.VALUE = table.concat(value, "\n")
		infobox.CARET = "1,1"
	end


	local tab = iup.vbox{iup.hbox{iup.label{title="Build: "}, itemlist, iup.label{title=" Inventory: "}, itemcount, iup.fill{expand="HORIZONTAL"}, iup.label{title=" Target: "}, itemtargetcount},
			     iup.hbox{invtree, infobox}}

	function tab:OnShow()
		manuobj:set_nearby_stations(settings.nearbystations)
		manuobj:set_excluded_stations(settings.excludedstations)

		itemtargetcount.value = settings.showitem_count

		local i = 1
		while itemlist[i] do
			if itemnames[i] == settings.showitem then
				itemlist.value = i
				break
			end
			i = i + 1
		end
		
		manuobj:set_target(settings.showitem, settings.showitem_count)
		update()
	end

	function tab:OnHide()
	end

	function tab:set_blank_inv(val)
		use_blank_inv = val
	end

	return tab
end


local function make_globalinventory_tab()
	local invtree
	local infobox
	local itemcount

	local use_blank_inv

	local manuobj = manu("Trident Type M", 1)

	local matrixstations = {}

	local function update()
		manuobj:set_inventory(use_blank_inv and {} or get_player_inventory())

		itemcount.title = manuobj:get_inventory_item_count()
		iup.Refresh(itemcount)

		invtree.DELLIN = "1--1"

		matrixstations = {}

		local line = 1

		local items = tablekeys(manuobj:get_buildreqs())
		table.sort(items, invname_sort)

		for _,item in ipairs(items) do
			invtree.ADDLIN = line

			local remaining = math.max(manuobj:num_needed(item), 0)
			local colorstr = (remaining == 0) and "\127a0a0a0" or ""

			invtree:setcell(line, 1, colorstr..tostring(invname_to_name(item)))
			invtree:setcell(line, 2, colorstr..manuobj:get_inventory_item_count(item))
			invtree:setcell(line, 3, colorstr..remaining)
			invtree:setcell(line, 4, colorstr..manuobj:get_buildreq_item_count(item))

			matrixstations[line] = { item=item }
			line = line + 1
		end

		infobox.VALUE = "Nothing selected"
	end

	itemcount = iup.label{title=""}
	local itemlist = iup.pdasubsubsublist{DROPDOWN="YES", visible_items=10}

	local itemnames = tablekeys(itemreqs)
	table.sort(itemnames, invname_sort)
	for i,item in ipairs(itemnames) do
		itemlist[i] = invname_to_name(item)
	end

	function itemlist:action(sel, i)
		local item = itemnames[i]
		manuobj:set_target(item, settings.showitem_count)
		settings.showitem = item
		update()
	end

	local itemtargetcount = iup.text{size="%20x", expand="NO"}
	function itemtargetcount:action(_, val)
		val = tonumber(val or 0) or 0
		if val >= 0 then
			manuobj:set_target(settings.showitem, val)
			settings.showitem_count = val
			update()
			return
		end
		return iup.IGNORE
	end

	invtree = iup.pdasubmatrix{NUMCOL=4, CELLSIZE=10, EXPAND="YES", size="1", BGCOLOR="0 0 0 0"}
	invtree["0:1"] = ""
	invtree["ALIGNMENT1"] = "ALEFT"
	invtree["0:2"] = "Stored"
	invtree["0:3"] = "Needed"
	invtree["0:4"] = "Total"

	infobox = iup.stationsubmultiline{READONLY="YES", EXPAND="VERTICAL", SIZE="%25", VALUE="Nothing selected"}

	function invtree:edition_cb()
		return iup.IGNORE
	end

	function invtree:click_cb(line, col)
		local lineinfo = matrixstations[line]
		if not lineinfo then
			infobox.VALUE = ""
			return
		end

		local station = lineinfo.station

		local value = {}
		if lineinfo.item then
			local stations = manuobj:get_item_stations(lineinfo.item)
			
			local stationskeys = tablekeys(stations)
			table.sort(stationskeys)

			for _,station in ipairs(stationskeys) do
				local item = stations[station]
				table.insert(value, string.format("%sx %s", item.count, station))
			end
		end
		infobox.VALUE = table.concat(value, "\n")
		infobox.CARET = "1,1"
	end


	local tab = iup.vbox{iup.hbox{iup.label{title="Build: "}, itemlist, iup.label{title=" Inventory: "}, itemcount, iup.fill{expand="HORIZONTAL"}, iup.label{title=" Target: "}, itemtargetcount},
			     iup.hbox{invtree, infobox}}

	function tab:OnShow()
		manuobj:set_nearby_stations(settings.nearbystations)
		manuobj:set_excluded_stations(settings.excludedstations)

		itemtargetcount.value = settings.showitem_count

		local i = 1
		while itemlist[i] do
			if itemnames[i] == settings.showitem then
				itemlist.value = i
				break
			end
			i = i + 1
		end
		
		manuobj:set_target(settings.showitem, settings.showitem_count)
		update()
	end

	function tab:OnHide()
	end

	function tab:set_blank_inv(val)
		use_blank_inv = val
	end

	return tab
end


local function make_load_tab()
	local itemlist = iup.pdasubsubsublist{DROPDOWN="YES", EXPAND="HORIZONTAL", visible_items=10}

	local itemnames = tablekeys(itemreqs)
	table.sort(itemnames, invname_sort)

	for i,item in ipairs(itemnames) do
		itemlist[i] = invname_to_name(item)
	end

	local loadbutton = iup.stationbutton{title="Load", expand="HORIZONTAL"}
	function loadbutton:action()
		local item = itemnames[tonumber(itemlist.value)] or itemnames[1]
		load_cargo(item)
	end

	local header = iup.label{title="Load the required items for the selection.\nNote: Does not verify that everything fits into the ship."}

	local tab = iup.vbox{header, iup.fill{size="5"}, itemlist, iup.fill{expand="YES"}, loadbutton}

	function tab:set_selection(selection)
		for i,item in ipairs(itemnames) do
			if item == selection then
				itemlist.value = i
				break
			end
		end
	end

	function tab:get_selection()
		return itemnames[itemlist.value] or itemnames[1]
	end

	function tab:OnShow()
	end

	function tab:OnHide()
	end

	return tab
end


local function make_manu_dialog()
	local invtab = make_inventory_tab()
	invtab.tabtitle = "Station Inventory"

	local globinvtab = make_globalinventory_tab()
	globinvtab.tabtitle = "Global Inventory"

	local nearbytab = make_nearby_tab()
	nearbytab.tabtitle = "Relations"

	function nearbytab:OnHide()
		settings.nearbystations = self:get_nearby_stations()
	end

	function nearbytab:OnShow()
		self:set_nearby_stations(settings.nearbystations)
	end

	local excludetab = make_exclude_tab()
	excludetab.tabtitle = "Station Filter"
	
	function excludetab:OnHide()
		settings.excludedstations = self:get_excluded_stations()
	end

	function excludetab:OnShow()
		self:set_excluded_stations(settings.excludedstations)
	end

	local loadtab = make_load_tab()
	loadtab.tabtitle = "Load Cargo"

	function loadtab:OnHide()
		settings.last_loaded_cargo = self:get_selection()
	end

	function loadtab:OnShow()
		self:set_selection(settings.last_loaded_cargo)
	end

	local tabs = iup.subsubsubtabtemplate{invtab, globinvtab, nearbytab, excludetab, loadtab}
	local d = iup.dialog{iup.stationsubsubframe{iup.vbox{tabs}},
			     FULLSCREEN="NO", BGCOLOR="0 0 0 0 0", TOPMOST="YES", SIZE="%90xHALF", TITLE=" Improved Manufacturing v2.1.5 Rio"}

	function d:show_cb()
		load_settings()
		tabs:OnShow()
	end

	function d:hide_cb()
		tabs:OnHide()
		save_settings()
	end

	function d:set_blank_inv(val)
		invtab:set_blank_inv(val)
		globinvtab:set_blank_inv(val)
	end
	
	return d
end
local manudialog


local function manu_cb(_, args)
	if not GetPlayerName() then
		local msgdialog
		msgdialog = msgdlgtemplate1("You must be connected to the game to run this.", "Ok", function() HideDialog(msgdialog) iup.Destroy(msgdialog) end, "TWOTHIRDx%5")
		ShowDialog(msgdialog)
		return
	end

	-- dialog must be initialized from the command handler or the paths for
	-- get_universe_stations will be wrong
	if not manudialog then
		manudialog = make_manu_dialog()
	end
	
	manudialog:set_blank_inv(args and args[1] == "blank")
	ShowDialog(manudialog)
end

RegisterUserCommand("manu", manu_cb)



local function manu_load_cb(_, args)
	if args then
		for item in pairs(itemreqs) do
			if invname_to_name(item) == args[1] then
				load_cargo(item)
				return
			end
		end
		print("No such item.")
	else
		print("Missing item name.")
	end
	local names = {}
	for item in pairs(itemreqs) do
		table.insert(names, invname_to_name(item) or item)				
	end
	print("Possible values: "..table.concat(names, ", "))
end
RegisterUserCommand("manu_load", manu_load_cb)
