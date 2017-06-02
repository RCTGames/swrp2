if SERVER then
    AddCSLuaFile("shared.lua")
end

SWEP.PrintName = "Medic Kit"
SWEP.Author = "DanK"
SWEP.Slot = 4
SWEP.SlotPos = 0
SWEP.Description = "Heals the wounded."
SWEP.Contact = ""
SWEP.Purpose = ""
SWEP.Instructions = "Left click to heal someone\nRight click to heal yourself"
SWEP.IsDarkRPMedKit = true

SWEP.Spawnable = true
SWEP.AdminOnly = true
SWEP.Category = "SWRP"

SWEP.ViewModel = "models/weapons/c_medkit.mdl"
SWEP.WorldModel = "models/weapons/w_medkit.mdl"
SWEP.UseHands = true

SWEP.Primary.Recoil = 0
SWEP.Primary.ClipSize  = -1
SWEP.Primary.DefaultClip = 1
SWEP.Primary.Automatic  = true
SWEP.Primary.Delay = 0.1
SWEP.Primary.Ammo = "none"

SWEP.Secondary.Recoil = 0
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 1
SWEP.Secondary.Automatic = true
SWEP.Secondary.Delay = 0.3
SWEP.Secondary.Ammo = "none"

function SWEP:PrimaryAttack()
    self.Weapon:SetNextPrimaryFire( CurTime() + 2.5)
    local eyetrace = self.Owner:GetEyeTrace()
    if SERVER then
    if eyetrace.Entity:IsPlayer() == true then
        eyetrace.Entity:SetHealth( eyetrace.Entity:Health() + 10 )
        print(self.Owner:Nick().." added 10 hp to "..eyetrace.Entity:Nick().."\n Their health is now "..eyetrace.Entity:Health())
    elseif eyetrace.Entity:IsNPC() == true then
        eyetrace.Entity:SetHealth( eyetrace.Entity:Health() + 10 )
        print(self.Owner:Nick().." added 10 hp to "..eyetrace.Entity:GetClass().."\n Their health is now "..eyetrace.Entity:Health())
    end
    end
end
function SWEP:SecondaryAttack()
    self.Weapon:SetNextSecondaryFire( CurTime() + 15 )
    local eyetrace = self.Owner:GetEyeTrace()
    if SERVER then
        if eyetrace.Entity:IsPlayer() == true then
            eyetrace.Entity:SetHealth( eyetrace.Entity:GetMaxHealth() )
            print(self.Owner:Nick().." restord the health of "..eyetrace.Entity:Nick().."\n Their health is now "..eyetrace.Entity:Health())
        elseif eyetrace.Entity:IsNPC() == true then
            eyetrace.Entity:SetHealth( eyetrace.Entity:GetMaxHealth() )
            print(self.Owner:Nick().." restord the health of "..eyetrace.Entity:GetClass().."\n Their health is now "..eyetrace.Entity:Health())
        end
    end
end