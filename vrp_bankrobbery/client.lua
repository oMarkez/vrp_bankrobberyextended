local robbing = false
local bank = ""
local secondsRemaining = 0

function bank_DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function bank_drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

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


RegisterNetEvent('es_bank:currentlyrobbing')
AddEventHandler('es_bank:currentlyrobbing', function(robb)
	robbing = true
	bank = robb
	secondsRemaining = 720
end)

RegisterNetEvent('es_bank:toofarlocal')
AddEventHandler('es_bank:toofarlocal', function(robb)
	robbing = false
	TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, "The robbery was cancelled, you will receive nothing.")
	robbingName = ""
	secondsRemaining = 0
	incircle = false
end)

RegisterNetEvent('es_bank:playerdiedlocal')
AddEventHandler('es_bank:playerdiedlocal', function(robb)
	robbing = false
	TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, "The robbery was cancelled, you died!.")
	robbingName = ""
	secondsRemaining = 0
	incircle = false
end)


RegisterNetEvent('es_bank:robberycomplete')
AddEventHandler('es_bank:robberycomplete', function(reward)
	robbing = false
	TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, "Robbery done, you received:^2" .. reward)
	bank = ""
	secondsRemaining = 0
	incircle = false
end)

Citizen.CreateThread(function()
	while true do
		if robbing then
			Citizen.Wait(1000)
			if(secondsRemaining > 0)then
				secondsRemaining = secondsRemaining - 1
			end
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	while true do
		local pos = GetEntityCoords(GetPlayerPed(-1), true)
		for k,v in pairs(banks)do
			local pos2 = v.position

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0)then
				if IsPlayerWantedLevelGreater(PlayerId(),0) or ArePlayerFlashingStarsAboutToDrop(PlayerId()) then
					local wanted = GetPlayerWantedLevel(PlayerId())
					Citizen.Wait(5000)
				    SetPlayerWantedLevel(PlayerId(), wanted, 0)
					SetPlayerWantedLevelNow(PlayerId(), 0)
				end
			end
		end
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	for k,v in pairs(banks)do
		local ve = v.position

		local blip = AddBlipForCoord(ve.x, ve.y, ve.z)
		SetBlipSprite(blip, 278)
		SetBlipScale(blip, 0.8)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Robbable Bank")
		EndTextCommandSetBlipName(blip)
	end
end)
incircle = false

Citizen.CreateThread(function()
	while true do
		local pos = GetEntityCoords(GetPlayerPed(-1), true)

		for k,v in pairs(banks)do
			local pos2 = v.position

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0)then
				if not robbing then
					DrawMarker(1, v.position.x, v.position.y, v.position.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,255, 0, 0, 0,0)
					
					if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 2)then
						if (incircle == false) then
							bank_DisplayHelpText("Press ~INPUT_CONTEXT~ to rob ~b~" .. v.nameofbank .. "~w~ beware, the police will be alerted!")
						end
						incircle = true
						if(IsControlJustReleased(1, 51))then
							TriggerServerEvent('es_bank:rob', k)
						end
					elseif(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 2)then
						incircle = false
					end
				end
			end
		end

		if robbing then
		    SetPlayerWantedLevel(PlayerId(), 0, 0)
            SetPlayerWantedLevelNow(PlayerId(), 0)
			
			bank_drawTxt(0.66, 1.44, 1.0,1.0,0.4, "Robbing bank: ~r~" .. secondsRemaining .. "~w~ seconds remaining", 255, 255, 255, 255)
			
			local pos2 = banks[bank].position
			local ped = GetPlayerPed(-1)
			
            if IsEntityDead(ped) then
			TriggerServerEvent('es_bank:playerdied', bank)
			elseif (Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 15)then
				TriggerServerEvent('es_bank:toofar', bank)
			end
		end

		Citizen.Wait(0)
	end
end)