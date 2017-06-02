if SERVER then
    util.AddNetworkString("SendCommsMsg")
    util.AddNetworkString("SendAdvertMsg")
    util.AddNetworkString("CommsFailure")
    util.AddNetworkString("CommsSuccess")
    util.AddNetworkString("CommsJoinMsg")
    util.AddNetworkString("SWRPCurrentJob")
    include("config/sh_config.lua")
	include("jobs.lua")
hook.Add( "PlayerInitialSpawn", "SWRPJoin",function (ply)
	if (ply:IsValid()) then
		PrintMessage(HUD_PRINTTALK,"["..os.date( "%H:%M" ).."] "..ply:Nick().." has joined the server!")
		ply:StripWeapons()
		ply:SetHealth(ply:GetMaxHealth())
		ply:SetArmor(0)
		ply:SetModel("models/player/clone/baldcadet.mdl")
		net.Start("SWRPCurrentJob")
			net.WriteString("Cadet")
		net.Send(ply)
	elseif not (ply:IsValid()) then
		PrintMessage(HUD_PRINTTALK,"["..os.date( "%H:%M" ).."] "..ply:Nick().." was kicked due to not being valid!")
		ply:Kick("You are not valid!")
	end
	if (ply:IsBot()) then
		PrintMessage(HUD_PRINTTALK,"["..os.date( "%H:%M" ).."] "..ply:Nick().." was kicked due to being a bot")
		ply:Kick("You are a bot!")
	elseif not (ply:IsBot()) then
		
	end

	if (ply:SteamID() == "STEAM_0:0:89592569") then
		ply:Kick("Sorry, you are not allowed on this server :(")
	end
end)
hook.Add("PlayerDisconnected", "SWRPLeave", function(ply)
		PrintMessage(HUD_PRINTTALK,"["..os.date( "%H:%M" ).."] "..ply:Nick().." has left the server!")
end)


hook.Add("PlayerHurt", "SWRPhurt", function(victim, attacker)
	if (victim:IsPlayer()) then
		victim:EmitSound("ambient/sound/swrphurt.wav")
	else end
end)

hook.Add("PlayerCanPickupItem","SWRP2_DisabledPickup", function(ply, item)
		return false
end)
hook.Add("AllowPlayerPickup","SWRP2_DisabledPlayerPickup", function( ply, ent )
		return ply:IsAdmin()
end)

function PlayerPickup( ply, ent )
	if ( ply:IsAdmin() and ent:GetClass():lower() == "player" ) then
		return true
	end
end
hook.Add( "PhysgunPickup", "Allow Player Pickup", PlayerPickup )

end

if CLIENT then
	hook.Add("ContextMenuOpen", "SWRPAdminQMenu",function()
		if (self:IsAdmin() || self:IsSuperAdmin()) then
			return true
		elseif (not self:IsAdmin() || not self:IsSuperAdmin()) then
			return false
		end
	end)
end