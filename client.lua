local showWhenUnarmed = false

-- Update HUD
local function updateAmmoHud()
    local ped = PlayerPedId()
    local weapon = GetSelectedPedWeapon(ped)

    if weapon ~= `WEAPON_UNARMED` then
        local _, clipAmmo = GetAmmoInClip(ped, weapon)
        local totalAmmo = GetAmmoInPedWeapon(ped, weapon)
        local reserveAmmo = totalAmmo - clipAmmo

        SendNUIMessage({
            action = "updateAmmo",
            clip = clipAmmo,
            reserve = reserveAmmo
        })
    elseif showWhenUnarmed then
        SendNUIMessage({
            action = "updateAmmo",
            clip = 0,
            reserve = 0
        })
    else
        SendNUIMessage({
            action = "hide"
        })
    end
end

-- Thread to check ammo continuously
CreateThread(function()
    while true do
        Wait(200) -- update every 0.2 sec
        updateAmmoHud()
    end
end)
