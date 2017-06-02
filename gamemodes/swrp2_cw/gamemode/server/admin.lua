if SERVER then
	util.AddNetworkString("dws_openAdmin")
	util.AddNetworkString("dws_addPlayerToGroup")

	net.Receive("dws_addPlayerToGroup",function(len,ply)
		if (ply:IsValid()) then
			local plyToSet = net.ReadEntity()
			local role = net.ReadString()

			if (plyToSet:IsValid()) then
				file.Append("swrp/"..tostring(ply:SteamID64()).."_whitelist.txt",role.."\n")
			end
		end
	end)
end