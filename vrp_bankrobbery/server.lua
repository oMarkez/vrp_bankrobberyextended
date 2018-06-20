-- Remember to use the cop group or this won't work
-- K > Admin > Add Group > User ID > cop

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_bank")

local banks = {
	["fleeca"] = {
		position = { ['x'] = 147.04908752441, ['y'] = -1044.9448242188, ['z'] = 29.36802482605 },
		reward = 10000 + math.random(100000,200000),
		nameofbank = "Fleeca Bank",
		lastrobbed = 0
	},
	["fleeca2"] = {
		position = { ['x'] = -2957.6674804688, ['y'] = 481.45776367188, ['z'] = 15.697026252747 },
		reward = 10000 + math.random(100000,200000),
		nameofbank = "Fleeca Bank (Highway)",
		lastrobbed = 0
	},
	["blainecounty"] = {
		position = { ['x'] = -107.06505584717, ['y'] = 6474.8012695313, ['z'] = 31.62670135498 },
		reward = 10000 + math.random(100000,200000),
		nameofbank = "Blaine County Savings",
		lastrobbed = 0
	},
	["fleeca3"] = {
		position = { ['x'] = -1212.2568359375, ['y'] = -336.128295898438, ['z'] = 36.7907638549805 },
		reward = 30000 + math.random(100000,200000),
		nameofbank = "Fleeca Bank (Vinewood Hills)",
		lastrobbed = 0
	},
	["fleeca4"] = {
		position = { ['x'] = -354.452575683594, ['y'] = -53.8204879760742, ['z'] = 48.0463104248047 },
		reward = 30000 + math.random(100000,200000),
		nameofbank = "Fleeca Bank (Burton)",
		lastrobbed = 0
	},
	["fleeca5"] = {
		position = { ['x'] = 309.967376708984, ['y'] = -283.033660888672, ['z'] = 53.1745223999023 },
		reward = 30000 + math.random(100000,200000),
		nameofbank = "Fleeca Bank (Alta)",
		lastrobbed = 0
	},
	["fleeca6"] = {
		position = { ['x'] = 1176.86865234375, ['y'] = 2711.91357421875, ['z'] = 38.097785949707 },
		reward = 30000 + math.random(100000,200000),
		nameofbank = "Fleeca Bank (Desert)",
		lastrobbed = 0
	},
	["pacific"] = {
		position = { ['x'] = 255.001098632813, ['y'] = 225.855895996094, ['z'] = 101.005694274902 },
		reward = 60000 + math.random(100000,200000),
		nameofbank = "Pacific Standard PDB (Downtown Vinewood)",
		lastrobbed = 0
	},
	["littleseoul"] = {
		position = { ['x'] = -708.78833007813, ['y'] = -904.51098632813, ['z'] = 19.21558380127 },
		reward = 5000 + math.random(1000,2000),
		nameofbank = "Convenience Store Little Seuol",
		lastrobbed = 0
	},
	["vespuccicanal"] = {
		position = { ['x'] = -1220.6831054688, ['y'] = -915.9306640625, ['z'] = 11.32629776001 },
		reward = 5000 + math.random(1000,2000),
		nameofbank = "Convenience Store Vespucci Canals",
		lastrobbed = 0
	},
	["morningwood"] = {
		position = { ['x'] = -1479.0399169922, ['y'] = -375.49963378906, ['z'] = 39.163417816162 },
		reward = 5000 + math.random(1000,2000),
		nameofbank = "Convenience Store Morningwood",
		lastrobbed = 0
	},
	["davis"] = {
		position = { ['x'] = -42.691207885742, ['y'] = 1749.4541015625, ['z'] = 29.421022415161 },
		reward = 5000 + math.random(1000,2000),
		nameofbank = "Convenience Store Davis",
		lastrobbed = 0
	},
	["strawberry"] = {
		position = { ['x'] = 29.293838500977, ['y'] = -1340.234375,29, ['z'] = 29.497020721436 },
		reward = 5000 + math.random(1000,2000),
		nameofbank = "Convenience Store Strawberry",
		lastrobbed = 0
	},
	["strawberrystrip"] = {
		position = { ['x'] = 126.45246887207, ['y'] = -1282.7200927734, ['z'] = 29.278009414673 },
		reward = 5000 + math.random(1000,2000),
		nameofbank = "Convenience Store Strawberry Strip Club",
		lastrobbed = 0
	},
	["downtownvinewood"] = {
		position = { ['x'] = 378.66339111328, ['y'] = 332.46459960938, ['z'] = 103.56635284424 },
		reward = 5000 + math.random(1000,2000),
		nameofbank = "Convenience Store Downtown Vinewood",
		lastrobbed = 0
	},
	["richmanglen"] = {
		position = { ['x'] = -1828.2401123047, ['y'] = 799.34350585938, ['z'] = 138.16960144043 },
		reward = 5000 + math.random(1000,2000),
		nameofbank = "Convenience Store Richman Glen",
		lastrobbed = 0
	},
	["banhamcanyon"] = {
		position = { ['x'] = -2959.3952636719, ['y'] = 387.25442504883, ['z'] = 14.04322719574 },
		reward = 5000 + math.random(1000,2000),
		nameofbank = "Convenience Store Banham Canyon",
		lastrobbed = 0
	},
	["banhamcanyon2"] = {
		position = { ['x'] = -3047.2346191406, ['y'] = 587.07159423828, ['z'] = 7.9089260101318 },
		reward = 5000 + math.random(1000,2000),
		nameofbank = "Convenience Store Banham Canyon 2",
		lastrobbed = 0
	},
	["chumash"] = {
		position = { ['x'] = -3248.9899902344, ['y'] = 1005.4208984375, ['z'] = 12.830718040466 },
		reward = 5000 + math.random(1000,2000),
		nameofbank = "Convenience Store Chumash",
		lastrobbed = 0
	},
	["grandsenora"] = {
		position = { ['x'] = 2673.8955078125, ['y'] = 3286.7236328125, ['z'] = 55.241199493408 },
		reward = 5000 + math.random(1000,2000),
		nameofbank = "Convenience Store Grand Senora Desert",
		lastrobbed = 0
	},
	["tataviam"] = {
		position = { ['x'] = 2550.0637207031, ['y'] = 385.18966674805, ['z'] = 108.62305450439 },
		reward = 5000 + math.random(1000,2000),
		nameofbank = "Convenience Store Tataviam Mountains",
		lastrobbed = 0
	},
	["route68"] = {
		position = { ['x'] = 546.05902099609, ['y'] = 2663.8869628906, ['z'] = 42.156551361084 },
		reward = 5000 + math.random(1000,2000),
		nameofbank = "Convenience Store Route 68",
		lastrobbed = 0
	},
	["route682"] = {
		position = { ['x'] = 1169.2280273438, ['y'] = 2717.828125, ['z'] = 42.156551361084 },
		reward = 5000 + math.random(1000,2000),
		nameofbank = "Convenience Store Route 68",
		lastrobbed = 0
	},
	["aceliqour"] = {
		position = { ['x'] = 1395.2069091797, ['y'] = 3613.5847167969, ['z'] = 34.980922698975 },
		reward = 5000 + math.random(1000,2000),
		nameofbank = "Convenience Store Ace Liqour, Sandy Shores",
		lastrobbed = 0
	},
	["sandy"] = {
		position = { ['x'] = 1960.3083496094, ['y'] = 3748.4816894531, ['z'] = 32.343795776367 },
		reward = 5000 + math.random(1000,2000),
		nameofbank = "Convenience Store Sandy Shores",
		lastrobbed = 0
	},
	["grapeseed"] = {
		position = { ['x'] = 1707.2100830078, ['y'] = 4919.4521484375, ['z'] = 42.063690185547 },
		reward = 5000 + math.random(1000,2000),
		nameofbank = "Convenience Store Grapeseed",
		lastrobbed = 0
	},
	["mountchilliad"] = {
		position = { ['x'] = 1734.9033203125, ['y'] = 6419.748046875, ['z'] = 35.037212371826 },
		reward = 5000 + math.random(1000,2000),
		nameofbank = "Convenience Store Mount Chiliad",
		lastrobbed = 0
	}
}

local robbers = {}

function get3DDistance(x1, y1, z1, x2, y2, z2)
	return math.sqrt(math.pow(x1 - x2, 2) + math.pow(y1 - y2, 2) + math.pow(z1 - z2, 2))
end

AddEventHandler("playerDropped", function()
	if(robbers[source])then
		local wtf = robbers[source]
		local wtf2 = banks[wtf].nameofbank
		robbers[source] = nil
		TriggerClientEvent('chatMessage', -1, 'NEWS', {255, 0, 0}, "Robbery was cancelled at: ^2" ..wtf2.."Reason: [Disconnected]")
	end
end)

RegisterServerEvent('es_bank:toofar')
AddEventHandler('es_bank:toofar', function(robb)
	if(robbers[source])then
		TriggerClientEvent('es_bank:toofarlocal', source)
		robbers[source] = nil
		TriggerClientEvent('chatMessage', -1, 'NEWS', {255, 0, 0}, "Robbery was cancelled at: ^2" .. banks[robb].nameofbank)
	end
end)

RegisterServerEvent('es_bank:playerdied')
AddEventHandler('es_bank:playerdied', function(robb)
	if(robbers[source])then
		TriggerClientEvent('es_bank:playerdiedlocal', source)
		robbers[source] = nil
		TriggerClientEvent('chatMessage', -1, 'NEWS', {255, 0, 0}, "Robbery was cancelled at: ^2" .. banks[robb].nameofbank)
	end
end)

RegisterServerEvent('es_bank:rob')
AddEventHandler('es_bank:rob', function(robb)
  local user_id = vRP.getUserId({source})
  local player = vRP.getUserSource({user_id})
  local cops = vRP.getUsersByGroup({"cop"}) -- remember to use the cop group or this won't work - K > Admin > Add Group > User ID > cop
  if vRP.hasGroup({user_id,"cop"}) then
    vRPclient.notify(player,{"~r~Cops can't rob banks."})
  else
    if #cops >= 2 then -- change 2 to the minimum amount online necessary
	  if banks[robb] then
		  local bank = banks[robb]

		  if (os.time() - bank.lastrobbed) < 600 and bank.lastrobbed ~= 0 then
			  TriggerClientEvent('chatMessage', player, 'ROBBERY', {255, 0, 0}, "This has already been robbed recently. Please wait another: ^2" .. (1200 - (os.time() - bank.lastrobbed)) .. "^0 seconds.")
			  return
		  end
		  TriggerClientEvent('chatMessage', -1, 'NEWS', {255, 0, 0}, "Robbery in progress at ^2" .. bank.nameofbank)
		  TriggerClientEvent('chatMessage', player, 'SYSTEM', {255, 0, 0}, "You started a robbery at: ^2" .. bank.nameofbank .. "^0, do not get too far away from this point!")
		  TriggerClientEvent('chatMessage', player, 'SYSTEM', {255, 0, 0}, "Hold the fort for ^1 12 ^0minutes and the money is yours!")
		  TriggerClientEvent('es_bank:currentlyrobbing', player, robb)
		  banks[robb].lastrobbed = os.time()
		  robbers[player] = robb
		  local savedSource = player
		  SetTimeout(720000, function()
			  if(robbers[savedSource])then
				  if(user_id)then
					  vRP.giveInventoryItem({user_id,"dirty_money",bank.reward,true})
					  TriggerClientEvent('chatMessage', -1, 'NEWS', {255, 0, 0}, "Robbery is over at: ^2" .. bank.nameofbank .. "^0!")
					  TriggerClientEvent('es_bank:robberycomplete', savedSource, bank.reward)
				  end
			  end
		  end)		
	  end
    else
      vRPclient.notify(player,{"~r~Not enough cops online."})
    end
	end
end)
