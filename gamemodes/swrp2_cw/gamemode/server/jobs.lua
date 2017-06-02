if SERVER then
util.AddNetworkString("OpenF4Menu")
util.AddNetworkString("OpenAdminMenu")
util.AddNetworkString("SWRPMsg")
util.AddNetworkString("SWRPReOpenF4")
util.AddNetworkString("SWRPsendtoall")
if (!file.Exists("swrp","DATA")) then
	file.CreateDir("swrp")		
end
net.Receive("SWRPMsg",function(len, ply)
	job = net.ReadString()
	ServerLog(ply:Nick().."'s' current job: "..job)
	ServerLog(ply:Nick().."'s group is: "..ply:GetNWString("usergroup"))
	if (file.Exists("swrp/"..tostring(ply:SteamID64()).."_whitelist.txt","DATA")) then
		local whitelist = file.Read("swrp/"..tostring(ply:SteamID64()).."_whitelist","DATA") 
	else
		file.Write("swrp/"..tostring(ply:SteamID64()).."_whitelist.txt","Cadet")
	end
	function SWRPLoadJob(health, armor, model, weapons, weapon1, weapon2, weapon3, weapon4, weapon5, weapon6, weapon7, weapon8, weapon9, weapon10)
		if (job == whitelist) then
			ply:StripWeapons()
			ply:SetModel(tostring(model))
			ply:SetHealth(tonumber(health))
			ply:SetArmor(tonumber(armor))
			if (weapons > 0) then
				if (weapons >= 1) then
					ply:Give(tostring(weapon1))
					if (weapons >= 2) then
						ply:Give(tostring(weapon2))
						if (weapons >= 3) then
							ply:Give(tostring(weapon3))
							if (weapons >= 4) then
								ply:Give(tostring(weapon4))
								if (weapons >= 5) then
									ply:Give(tostring(weapon5))
									if (weapons >= 6) then
										ply:Give(tostring(weapon6))
										if (weapons >= 7) then
											ply:Give(tostring(weapon7))
											if (weapons >= 8) then
												ply:Give(tostring(weapon8))
												if (weapons >= 9) then
													ply:Give(tostring(weapon10))
													if (weapons >= 10) then
														ply:Give(tostring(weapon10))
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
		if (job == "Cadet") then
			PrintMessage(HUD_PRINTTALK,ply:Nick().." is now: "..job)
			SWRPLoadJob(100, 0, "models/player/clone/baldcadet.mdl", 0)
			ply:SetNWString("CurrentRegiment","None")
		end
		--[[-------------------------------------------------------------------------
		Clone Troopers
		---------------------------------------------------------------------------]]
		if (job == "CT") then
				if (ply:GetNWString("usergroup") == "ct" || ply:GetNWString("usergroup") == "admin" || ply:GetNWString("usergroup") == "superadmin" || ply:IsAdmin() || ply:IsSuperAdmin()) then
					PrintMessage(HUD_PRINTTALK,ply:Nick().." is now: "..job)
					SWRPLoadJob(500,100, "models/player/testp2c/cgi ctp2.mdl", 3,"clone_card_c1","tfa_swch_dc15a","tfa_swch_dc15sa")
					ply:SetNWString("CurrentRegiment","CT")
				elseif (ply:GetNWString("usergroup") != "ct" || ply:GetNWString("usergroup") != "admin" || ply:GetNWString("usergroup") != "superadmin" || not ply:IsAdmin() || not ply:IsSuperAdmin()) then
					PrintMessage(HUD_PRINTTALK,ply:Nick().." you are not allowed to be CT. Get trained first :D")
					print(ply:Nick()..": "..ply:GetUserGroup())
				end
		end
		if (job == "CT Sergeant") then
				if (ply:GetNWString("usergroup") == "ct-sgt" || ply:GetNWString("usergroup") == "admin" || ply:GetNWString("usergroup") == "superadmin" || ply:IsAdmin() || ply:IsSuperAdmin()) then
					PrintMessage(HUD_PRINTTALK,ply:Nick().." is now: "..job)
					SWRPLoadJob(600,100, "models/player/clone_trooper_ranks/green.mdl", 3,"clone_card_c1","tfa_swch_dc15a","tfa_swch_dc15sa")
					ply:SetNWString("CurrentRegiment","CT")
				elseif (ply:GetNWString("usergroup") != "ct-sgt" || ply:GetNWString("usergroup") != "admin" || ply:GetNWString("usergroup") != "superadmin" || not ply:IsAdmin() || not ply:IsSuperAdmin()) then
					PrintMessage(HUD_PRINTTALK,ply:Nick().." you are not allowed to be CT Sergeant")
					print(ply:Nick()..": "..ply:GetUserGroup())
				end
		end
		if (job == "CT Lieutenant") then
				if (ply:GetNWString("usergroup") == "ct-lt" || ply:GetNWString("usergroup") == "admin" || ply:GetNWString("usergroup") == "superadmin" || ply:IsAdmin() || ply:IsSuperAdmin()) then
					PrintMessage(HUD_PRINTTALK,ply:Nick().." is now: "..job)
					SWRPLoadJob(700,100, "models/player/clone_trooper_ranks/blue.mdl", 3,"clone_card_c2","tfa_swch_dc15a","tfa_swch_dc15sa")
					ply:SetNWString("CurrentRegiment","CT")
				elseif (ply:GetNWString("usergroup") != "ct-lt" || ply:GetNWString("usergroup") != "admin" || ply:GetNWString("usergroup") != "superadmin" || not ply:IsAdmin() || not ply:IsSuperAdmin()) then
					PrintMessage(HUD_PRINTTALK,ply:Nick().." you are not allowed to be CT Lieutenant")
					print(ply:Nick()..": "..ply:GetUserGroup())
				end
		end
		if (job == "CT Drill Sergeant") then
				if (ply:GetNWString("usergroup") == "ct-ds" || ply:GetNWString("usergroup") == "admin" || ply:GetNWString("usergroup") == "superadmin" || ply:IsAdmin() || ply:IsSuperAdmin()) then
					PrintMessage(HUD_PRINTTALK,ply:Nick().." is now: "..job)
					SWRPLoadJob(800,100, "models/player/clone/ctofficer.mdl", 4,"clone_card_c2","tfa_dc15a_expanded","tfa_swch_dc17","weapon_leash_elastic")
					ply:SetNWString("CurrentRegiment","CT")
				elseif (ply:GetNWString("usergroup") != "ct-ds" || ply:GetNWString("usergroup") != "admin" || ply:GetNWString("usergroup") != "superadmin" || not ply:IsAdmin() || not ply:IsSuperAdmin()) then
					PrintMessage(HUD_PRINTTALK,ply:Nick().." you are not allowed to be CT Drill Sergeant")
					print(ply:Nick()..": "..ply:GetUserGroup())
				end
		end
		if (job == "CT Commander") then
				if (ply:GetNWString("usergroup") == "ct-com" || ply:GetNWString("usergroup") == "admin" || ply:GetNWString("usergroup") == "superadmin" || ply:IsAdmin() || ply:IsSuperAdmin())  then
					PrintMessage(HUD_PRINTTALK,ply:Nick().." is now: "..job)
					SWRPLoadJob(1000,100, "models/player/clone/ctnco.mdl", 4,"clone_card_c3","tfa_dc15a_expanded","tfa_sw_dc17dual","weapon_leash_elastic")
					ply:SetNWString("CurrentRegiment","CT")
				elseif (ply:GetNWString("usergroup") != "ct-com" || ply:GetNWString("usergroup") != "admin" || ply:GetNWString("usergroup") != "superadmin" || not ply:IsAdmin() || not ply:IsSuperAdmin()) then
					PrintMessage(HUD_PRINTTALK,ply:Nick().." you are not allowed to be CT Commander")
					print(ply:Nick()..": "..ply:GetUserGroup())
			 	end
		end

		--[[-------------------------------------------------------------------------
		CTP
		---------------------------------------------------------------------------]]
		if (job == "CTP") then
				if (ply:GetNWString("usergroup") == "ctp-trp" || ply:GetNWString("usergroup") == "admin" || ply:GetNWString("usergroup") == "superadmin" || ply:IsAdmin() || ply:IsSuperAdmin())  then
					PrintMessage(HUD_PRINTTALK,ply:Nick().." is now: "..job)
					SWRPLoadJob(500,100, "models/player/pilot/pilot.mdl", 2,"clone_card_c1","tfa_752_defenderoftruth")
					ply:SetNWString("CurrentRegiment","CTP")
				elseif (ply:GetNWString("usergroup") != "ctp-trp" || ply:GetNWString("usergroup") != "admin" || ply:GetNWString("usergroup") != "superadmin" || not ply:IsAdmin() || not ply:IsSuperAdmin()) then
					PrintMessage(HUD_PRINTTALK,ply:Nick().." you are not allowed to be CTP Trooper")
					print(ply:Nick()..": "..ply:GetUserGroup())
			 	end
		end
		if (job == "CTP Sergeant") then
			if (ply:GetNWString("usergroup") == "ctp-sgt" || ply:GetNWString("usergroup") == "admin" || ply:GetNWString("usergroup") == "superadmin" || ply:IsAdmin() || ply:IsSuperAdmin()) then
				PrintMessage(HUD_PRINTTALK,ply:Nick().." is now: "..job)
				SWRPLoadJob(500,100, "models/player/212pilot/212pilot.mdl", 2,"clone_card_c1","tfa_752_defenderoftruth")
				ply:SetNWString("CurrentRegiment","CTP")
			elseif (ply:GetNWString("usergroup") != "ctp-sgt" || ply:GetNWString("usergroup") != "admin" || ply:GetNWString("usergroup") != "superadmin" || not ply:IsAdmin() || not ply:IsSuperAdmin()) then
				PrintMessage(HUD_PRINTTALK,ply:Nick().." you are not allowed to be CTP Sergeant")
					print(ply:Nick()..": "..ply:GetUserGroup())
		 	end
		end
		if (job == "CTP Lieutenant") then
			if (ply:GetNWString("usergroup") == "ctp-lt" || ply:GetNWString("usergroup") == "admin" || ply:GetNWString("usergroup") == "superadmin" || ply:IsAdmin() || ply:IsSuperAdmin()) then
				PrintMessage(HUD_PRINTTALK,ply:Nick().." is now: "..job)
				SWRPLoadJob(500,100, "models/player/501pilot/501pilot.mdl", 2,"clone_card_c2","tfa_752_defenderoftruth")
				ply:SetNWString("CurrentRegiment","CTP")
			elseif (ply:GetNWString("usergroup") != "ctp-lt" || ply:GetNWString("usergroup") != "admin" || ply:GetNWString("usergroup") != "superadmin" || not ply:IsAdmin() || not ply:IsSuperAdmin()) then
				PrintMessage(HUD_PRINTTALK,ply:Nick().." you are not allowed to be CTP Lieutenant")
					print(ply:Nick()..": "..ply:GetUserGroup())
		 	end
		end
		if (job == "CTP Officer") then
			if (ply:GetNWString("usergroup") == "ctp-ofc" || ply:GetNWString("usergroup") == "admin" || ply:GetNWString("usergroup") == "superadmin" || ply:IsAdmin() || ply:IsSuperAdmin()) then
				PrintMessage(HUD_PRINTTALK,ply:Nick().." is now: "..job)
				SWRPLoadJob(600,100, "models/player/41pilot/41pilot.mdl", 2,"clone_card_c2","tfa_752_defenderoftruth")
				ply:SetNWString("CurrentRegiment","CTP")
			elseif (ply:GetNWString("usergroup") != "ctp-ofc" || ply:GetNWString("usergroup") != "admin" || ply:GetNWString("usergroup") != "superadmin" || not ply:IsAdmin() || not ply:IsSuperAdmin()) then
				PrintMessage(HUD_PRINTTALK,ply:Nick().." you are not allowed to be CTP Officer")
					print(ply:Nick()..": "..ply:GetUserGroup())
		 	end
		end
		if (job == "CTP Commander") then
			if (ply:GetNWString("usergroup") == "ctp-com" || ply:GetNWString("usergroup") == "admin" || ply:GetNWString("usergroup") == "superadmin" || ply:IsAdmin() || ply:IsSuperAdmin()) then
				PrintMessage(HUD_PRINTTALK,ply:Nick().." is now: "..job)
				SWRPLoadJob(600,100, "models/player/104pilot/104pilot.mdl", 2,"clone_card_c3","tfa_752_defenderoftruth")
				ply:SetNWString("CurrentRegiment","CTP")
			elseif (ply:GetNWString("usergroup") != "ctp-com" || ply:GetNWString("usergroup") != "admin" || ply:GetNWString("usergroup") != "superadmin" || not ply:IsAdmin() || not ply:IsSuperAdmin()) then
				PrintMessage(HUD_PRINTTALK,ply:Nick().." you are not allowed to be CTP Commander")
					print(ply:Nick()..": "..ply:GetUserGroup())
		 	end
		end
		--[[-------------------------------------------------------------------------
		212th
		---------------------------------------------------------------------------]]
		if (job == "212th Trooper") then   
				if (ply:GetNWString("usergroup") == "212th-trp" || ply:GetNWString("usergroup") == "admin" || ply:GetNWString("usergroup") == "superadmin" || ply:IsAdmin() || ply:IsSuperAdmin()) then
					PrintMessage(HUD_PRINTTALK,ply:Nick().." is now: "..job)
					SWRPLoadJob(500,100, "models/player/212trp2/cgi_212l.mdl", 5,"clone_card_c1","grapplehook","tfa_swch_dc15a","tfa_swch_dc15s","tfa_swch_dc15sa")
					ply:SetNWString("CurrentRegiment","212th")
				elseif (ply:GetNWString("usergroup") != "212th-trp" || ply:GetNWString("usergroup") != "admin" || ply:GetNWString("usergroup") != "superadmin" || not ply:IsAdmin() || not ply:IsSuperAdmin()) then
					PrintMessage(HUD_PRINTTALK,ply:Nick().." you are not allowed to be 212th Trooper")
					print(ply:Nick()..": "..ply:GetUserGroup())
			 	end
		end
		if (job == "212th Sergeant") then
			if (ply:GetNWString("usergroup") == "212th-sgt" || ply:GetNWString("usergroup") == "admin" || ply:GetNWString("usergroup") == "superadmin" || ply:IsAdmin() || ply:IsSuperAdmin()) then
				PrintMessage(HUD_PRINTTALK,ply:Nick().." is now: "..job)
				SWRPLoadJob(750,100, "models/player/212troo/cgi_212l.mdl", 5,"clone_card_c1","grapplehook","tfa_swch_dc15a","tfa_swch_dc15s","tfa_swch_dc15sa")
				ply:SetNWString("CurrentRegiment","212th")
			elseif (ply:GetNWString("usergroup") != "212th-sgt" || ply:GetNWString("usergroup") != "admin" || ply:GetNWString("usergroup") != "superadmin" || not ply:IsAdmin() || not ply:IsSuperAdmin()) then
				PrintMessage(HUD_PRINTTALK,ply:Nick().." you are not allowed to be 212th Sergeant")
					print(ply:Nick()..": "..ply:GetUserGroup())
		 	end
		end
		if (job == "212th Lieutenant") then
			if (ply:GetNWString("usergroup") == "212th-lt" || ply:GetNWString("usergroup") == "admin" || ply:GetNWString("usergroup") == "superadmin" || ply:IsAdmin() || ply:IsSuperAdmin()) then
				PrintMessage(HUD_PRINTTALK,ply:Nick().." is now: "..job)
				SWRPLoadJob(800,100, "models/player/093/212thcom/212c/commander/212lcommander.mdl", 6,"clone_card_c2","grapplehook","tfa_swch_dc15a","tfa_swch_dc15s","tfa_swch_dc17","tfa_swch_clonelauncher")
				ply:SetNWString("CurrentRegiment","212th")
		elseif (ply:GetNWString("usergroup") != "212th-lt" || ply:GetNWString("usergroup") != "admin" || ply:GetNWString("usergroup") != "superadmin" || not ply:IsAdmin() || not ply:IsSuperAdmin()) then
				PrintMessage(HUD_PRINTTALK,ply:Nick().." you are not allowed to be 212th Lieutenant")
					print(ply:Nick()..": "..ply:GetUserGroup())
		 	end
		end
		if (job == "212th Heavy") then
			if (ply:GetNWString("usergroup") == "212th-heavy" || ply:GetNWString("usergroup") == "admin" || ply:GetNWString("usergroup") == "superadmin" || ply:IsAdmin() || ply:IsSuperAdmin()) then
				PrintMessage(HUD_PRINTTALK,ply:Nick().." is now: "..job)
				SWRPLoadJob(1000,100, "models/212thcgiheavy/212thcgiheavy.mdl", 5,"clone_card_c2","grapplehook","tfa_752_dlt19","tfa_dc17m_shotgun","tfa_swch_clonelauncher")
				ply:SetNWString("CurrentRegiment","212th")
			elseif (ply:GetNWString("usergroup") != "212th-heavy" || ply:GetNWString("usergroup") != "admin" || ply:GetNWString("usergroup") != "superadmin" || not ply:IsAdmin() || not ply:IsSuperAdmin()) then
				PrintMessage(HUD_PRINTTALK,ply:Nick().." you are not allowed to be 212th Heavy")
					print(ply:Nick()..": "..ply:GetUserGroup())
		 	end
		end
		if (job == "212th Commander") then
			if (ply:GetNWString("usergroup") == "212th-com" || ply:GetNWString("usergroup") == "admin" || ply:GetNWString("usergroup") == "superadmin" || ply:IsAdmin() || ply:IsSuperAdmin()) then
				PrintMessage(HUD_PRINTTALK,ply:Nick().." is now: "..job)
				SWRPLoadJob(1000,100, "models/player/testccp2/cgi cody ph2.mdl", 5,"clone_card_c3","grapplehook","tfa_dc15a_expanded","tfa_sw_dc17dual","tfa_swch_clonelauncher")
				ply:SetNWString("CurrentRegiment","212th")
			elseif (ply:GetNWString("usergroup") != "212th-com" || ply:GetNWString("usergroup") != "admin" || ply:GetNWString("usergroup") != "superadmin" || not ply:IsAdmin() || not ply:IsSuperAdmin()) then
				PrintMessage(HUD_PRINTTALK,ply:Nick().." you are not allowed to be 212th Commander")
					print(ply:Nick()..": "..ply:GetUserGroup())
		 	end
		end
		--[[-------------------------------------------------------------------------
		501st
		---------------------------------------------------------------------------]]
		if (job == "501st Trooper") then
			if (ply:GetNWString("usergroup") == "501st-trp" || ply:GetNWString("usergroup") == "admin" || ply:GetNWString("usergroup") == "superadmin" || ply:IsAdmin() || ply:IsSuperAdmin()) then
					PrintMessage(HUD_PRINTTALK,ply:Nick().." is now: "..job)
					SWRPLoadJob(500,100,"models/player/clone/p2jesse.mdl", 3,"clone_card_c1","tfa_swch_dc15sa","tfa_752_dc15s_expanded")
					ply:SetNWString("CurrentRegiment","501st")
			elseif (ply:GetNWString("usergroup") != "501st-trp" || ply:GetNWString("usergroup") != "admin" || ply:GetNWString("usergroup") != "superadmin" || not ply:IsAdmin() || not ply:IsSuperAdmin()) then
					PrintMessage(HUD_PRINTTALK,ply:Nick().." you are not allowed to be 501st Trooper")
					print(ply:Nick()..": "..ply:GetUserGroup())
			end
		end
		if (job == "501st Sergeant") then
			if (ply:GetNWString("usergroup") == "501st-sgt" || ply:GetNWString("usergroup") == "admin" || ply:GetNWString("usergroup") == "superadmin" || ply:IsAdmin() || ply:IsSuperAdmin()) then
				PrintMessage(HUD_PRINTTALK,ply:Nick().." is now: "..job)
				SWRPLoadJob(600,100,"models/player/clone/p2p2kix.mdl", 3,"clone_card_c1","tfa_swch_dc15sa","tfa_752_dc15s_expanded")
				ply:SetNWString("CurrentRegiment","501st")
			elseif (ply:GetNWString("usergroup") != "501st-sgt" || ply:GetNWString("usergroup") != "admin" || ply:GetNWString("usergroup") != "superadmin" || not ply:IsAdmin() || not ply:IsSuperAdmin()) then
				PrintMessage(HUD_PRINTTALK,ply:Nick().." you are not allowed to be 501st Sergeant")
					print(ply:Nick()..": "..ply:GetUserGroup())
		 	end
		end
		if (job == "501st Lieutenant") then
			if (ply:GetNWString("usergroup") == "501st-lt" || ply:GetNWString("usergroup") == "admin" || ply:GetNWString("usergroup") == "superadmin" || ply:IsAdmin() || ply:IsSuperAdmin()) then
				PrintMessage(HUD_PRINTTALK,ply:Nick().." is now: "..job)
				SWRPLoadJob(750,100,"models/player/093/501stcom/501c/commander/501lcommander.mdl", 4,"clone_card_c2","tfa_swch_dc15sa","tfa_752_dc15s_expanded","weapon_swrc_det")
				ply:SetNWString("CurrentRegiment","501st")
			elseif (ply:GetNWString("usergroup") != "501st-lt" || ply:GetNWString("usergroup") != "admin" || ply:GetNWString("usergroup") != "superadmin" || not ply:IsAdmin() || not ply:IsSuperAdmin()) then
				PrintMessage(HUD_PRINTTALK,ply:Nick().." you are not allowed to be 501st Lieutenant")
					print(ply:Nick()..": "..ply:GetUserGroup())
		 	end
		end
		if (job == "501st Captain") then
			if (ply:GetNWString("usergroup") == "501st-captain" || ply:GetNWString("usergroup") == "admin" || ply:GetNWString("usergroup") == "superadmin" || ply:IsAdmin() || ply:IsSuperAdmin()) then
				PrintMessage(HUD_PRINTTALK,ply:Nick().." is now: "..job)
				SWRPLoadJob(850,100,"models/player/rex2/rex ph2.mdl", 4,"clone_card_c2","tfa_swch_dc17","tfa_752_dc15s_expanded","weapon_swrc_det")
				ply:SetNWString("CurrentRegiment","501st")
			elseif (ply:GetNWString("usergroup") != "501st-captain" || ply:GetNWString("usergroup") != "admin" || ply:GetNWString("usergroup") != "superadmin" || not ply:IsAdmin() || not ply:IsSuperAdmin()) then
				PrintMessage(HUD_PRINTTALK,ply:Nick().." you are not allowed to be 501st Captain")
					print(ply:Nick()..": "..ply:GetUserGroup())
		 	end
		end
		if (job == "501st Commander") then
			if (ply:GetNWString("usergroup") == "501st-com" || ply:GetNWString("usergroup") == "admin" || ply:GetNWString("usergroup") == "superadmin" || ply:IsAdmin() || ply:IsSuperAdmin()) then
				PrintMessage(HUD_PRINTTALK,ply:Nick().." is now: "..job)
				SWRPLoadJob(1000,100,"models/player/093/ag1stcom/cgac/commander/cg1lcommander.mdl", 4,"clone_card_c3","tfa_sw_dc17dual","tfa_swch_dc15s","weapon_swrc_det")
				ply:SetNWString("CurrentRegiment","501st")
			elseif (ply:GetNWString("usergroup") != "501st-com" || ply:GetNWString("usergroup") != "admin" || ply:GetNWString("usergroup") != "superadmin" || not ply:IsAdmin() || not ply:IsSuperAdmin()) then
				PrintMessage(HUD_PRINTTALK,ply:Nick().." you are not allowed to be 501st Commander")
					print(ply:Nick()..": "..ply:GetUserGroup())
		 	end
		end
		--[[-------------------------------------------------------------------------
		Delta Squad
		---------------------------------------------------------------------------]]
		if (job == "RC Boss") then
		    if (ply:GetNWString("usergroup") == "rc-boss" || ply:GetNWString("usergroup") == "admin" || ply:GetNWString("usergroup") == "superadmin" || ply:IsAdmin() || ply:IsSuperAdmin()) then
		        PrintMessage(HUD_PRINTTALK,ply:Nick().." is now: "..job)
		        SWRPLoadJob(2000,100,"models/player/sgg/starwars/clone_commando_38.mdl", 5,"clone_card_c3","grapplehook","tfa_swch_dc17m_br","tfa_swch_dc15sa","dc17m_shotgun")
		        ply:SetNWString("CurrentRegiment","Delta Squad")
		    elseif (ply:GetNWString("usergroup") != "rc-boss" || ply:GetNWString("usergroup") != "admin" || ply:GetNWString("usergroup") != "superadmin" || not ply:IsAdmin() || not ply:IsSuperAdmin()) then
		        PrintMessage(HUD_PRINTTALK,ply:Nick().." is now: "..job)
		    end
		end
		if (job == "RC Fixer") then
		    if (ply:GetNWString("usergroup") == "rc-fixer" || ply:GetNWString("usergroup") == "admin" || ply:GetNWString("usergroup") == "superadmin" || ply:IsAdmin() || ply:IsSuperAdmin()) then
		        local n = 1
		        PrintMessage(HUD_PRINTTALK,ply:Nick().." is now: "..job)
		        SWRPLoadJob(2000,100,"models/player/sgg/starwars/clone_commando_40.mdl", 7,"clone_card_c3","grapplehook","grapplehook","tfa_sw_dc17dual","repair_tool","weapon_jew_bactakit","weapon_bacta_grenade")
		        ply:SetNWString("CurrentRegiment","Delta Squad")
		    elseif (ply:GetNWString("usergroup") != "rc-fixer" || ply:GetNWString("usergroup") != "admin" || ply:GetNWString("usergroup") != "superadmin" || not ply:IsAdmin() || not ply:IsSuperAdmin()) then
		        PrintMessage(HUD_PRINTTALK,ply:Nick().." you are not allowed to be RC Fixer.")
		        print(ply:Nick()..": "..ply:GetUserGroup())
		    end
		end
		if (job == "RC Sev") then 
		    if (ply:GetNWString("usergroup") == "rc-sev" || ply:GetNWString("usergroup") == "admin" || ply:GetNWString("usergroup") == "superadmin" || ply:IsAdmin() || ply:IsSuperAdmin()) then
		        PrintMessage(HUD_PRINTTALK,ply:Nick().." is now: "..job)
		        SWRPLoadJob(2000,100,"models/player/sgg/starwars/clone_commando_07.mdl", 6,"clone_card_c3","grapplehook","tfa_swch_dc17m_sn","tfa_swch_dc15sa","weapon_shadowvirus_grenade","tfa_swch_dc17m_br")
		        ply:SetNWString("CurrentRegiment","Delta Squad")
		    elseif (ply:GetNWString("usergroup") != "rc-sev" || ply:GetNWString("usergroup") != "admin" || !ply:GetNWString("usergroup") != "superadmin") then
		        PrintMessage(HUD_PRINTTALK,ply:Nick().." you are not allowed to be RC Fixer.")
		        print(ply:Nick()..": "..ply:GetUserGroup())
		    end
		end
		if (job == "RC Scorch") then
		    if (ply:GetNWString("usergroup") == "rc-scorch" || ply:GetNWString("usergroup") == "admin" || ply:GetNWString("usergroup") == "superadmin" || ply:IsAdmin() || ply:IsSuperAdmin()) then
		        local n = 1
		        PrintMessage(HUD_PRINTTALK,ply:Nick().." is now: "..job)
		        SWRPLoadJob(2000,100,"models/player/sgg/starwars/clone_commando_62.mdl", 6,"clone_card_c3","grapplehook","weapon_jew_det","tfa_swch_dc15sa","tfa_swch_dc17m_at","tfa_swch_dc17m_br")
		        ply:SetNWString("CurrentRegiment","Delta Squad")
		    elseif (ply:GetNWString("usergroup") != "rc-scorch" || ply:GetNWString("usergroup") != "admin" || !ply:GetNWString("usergroup") != "superadmin") then
		        PrintMessage(HUD_PRINTTALK,ply:Nick().." you are not allowed to be RC Fixer.")
		        print(ply:Nick()..": "..ply:GetUserGroup())
		    end
		end
	end)
end