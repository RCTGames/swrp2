if CLIENT then
	hook.Add("Initialize","dankSetVars",function()
		local whitelistPly = ""
		local whitelistMsg = ""
	end)
	concommand.Add("open_dankwhitelist",function()
    	net.Start("dws_openAdmin")
    	net.SendToServer()
	end)
	function ShowAdminPanel()
	    local frame = vgui.Create("DFrame")
	    frame:SetSize(300,200)
	    frame:Center()
	    frame:SetTitle("Whitelist system by DanK")
	    local DComboBox = vgui.Create( "DComboBox" )
		DComboBox:SetPos( 5, 5 )
		DComboBox:SetSize( 100, 20 )
		DComboBox:SetValue( "Players" )
		for k,v in pairs(player.GetAll()) do
			DComboBox:AddChoice( v:GetName() )
		end
		DComboBox.OnSelect = function( panel, index, value )
			whitelistPly = value
		end
		local DComboBox2 = vgui.Create( "DComboBox" )
		DComboBox2:SetPos( 5, 5 )
		DComboBox2:SetSize( 100, 20 )
		DComboBox2:SetValue( "Players" )
		DComboBox2:AddChoice( "Cadet" )
		DComboBox2:AddChoice( "CT" )
		DComboBox2:AddChoice( "CT Sergeant" )
		DComboBox2:AddChoice( "CT Lieutenant" )
		DComboBox2:AddChoice( "CT Drill Sergeant" )
		DComboBox2:AddChoice( "CT Commander" )
		DComboBox2:AddChoice( "CTP" )
		DComboBox2:AddChoice( "CTP Sergeant" )
		DComboBox2:AddChoice( "CTP Lieutenant" )
		DComboBox2:AddChoice( "CTP Officer" )
		DComboBox2:AddChoice( "CTP Commander" )
		DComboBox2:AddChoice( "212th Trooper" )
		DComboBox2:AddChoice( "212th Sergeant" )
		DComboBox2:AddChoice( "212th Lieutenant" )
		DComboBox2:AddChoice( "212th Heavy" )
		DComboBox2:AddChoice( "212th Commander" )
		DComboBox2:AddChoice( "501st Trooper" )
		DComboBox2:AddChoice( "501st Sergeant" )
		DComboBox2:AddChoice( "501st Lieutenant" )
		DComboBox2:AddChoice( "501st Captain" )
		DComboBox2:AddChoice( "501st Commander" )
		DComboBox2:AddChoice( "RC Boss" )
		DComboBox2:AddChoice( "RC Fixer" )
		DComboBox2:AddChoice( "RC Sev" )
		DComboBox2:AddChoice( "RC Scorch" )
		DComboBox2.OnSelect = function( panel, index, value )
			whitelistMsg = value
		end

		if (whitelistPly != "" && whitelistMsg != "" && whitelistPly == LocalPlayer():GetName()) then
			net.Start("dws_addPlayerToGroup")
				net.WriteEntity(LocalPlayer())
				net.WriteString(whitelistMsg)
			net.SendToServer()
		elseif (whitelistPly != "" && whitelistMsg != "" && whitelistPly != LocalPlayer():GetName()) then
			print("Player does not match :/")
		elseif (whitelistPly != "" && whitelistMsg == "" && whitelistPly == LocalPlayer():GetName()) then
			print("Player matches, whitelistMsg is empty!")
		elseif (whitelistPly == "" && whitelistMsg != "" && whitelistPly == LocalPlayer():GetName()) then
			print("Player matches, whitelistPly is empty!")
		elseif (whitelistPly == "" && whitelistMsg == "" && whitelistPly == LocalPlayer():GetName()) then
			print("Player matches, whitelistPly and whitelistMsg is empty!")
		elseif (whitelistPly == "" && whitelistMsg == "" && whitelistPly != LocalPlayer():GetName()) then
			print("Player doesn't match, whitelistPly and whitelistMsg is empty!")
		end
	end
	net.Receive("dws_openAdmin",ShowAdminPanel())
end