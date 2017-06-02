GM.Version = "1.0.0"
GM.Name = "Star Wars RP 2"
GM.Author = "By SWRP2"

DeriveGamemode("sandbox")
DEFINE_BASECLASS("gamemode_sandbox")

GM.Sandbox = BaseClass

AddCSLuaFile("cl_init.lua")
include("cl_init.lua")
AddCSLuaFile("server/config/sh_config.lua")
include("server/config/sh_config.lua")
AddCSLuaFile("server/join_leave.lua")
include("server/join_leave.lua")
AddCSLuaFile("server/onBootUp.lua")
include("server/onBootUp.lua")
AddCSLuaFile("server/jobs.lua")
include("server/jobs.lua")

if (SERVER) then
	resource.AddFile("sound/ambient/sound/swrphurt.wav")
	function GM:ShowSpare2( ply )
	net.Start("OpenF4Menu")
	net.Send(ply)
	end

	net.Receive("SWRPReOpenF4",function(len, ply)
		net.Start("OpenF4Menu")
		net.Send(ply)
	end)
end