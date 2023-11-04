local open = false
RegisterCommand('openSettinggmenu', function()
    OpenPauseMenu()
end)





function OpenPauseMenu()
	Wait(200)
    if not open and not IsPauseMenuActive() then
		
        SetNuiFocus(true,true)
        SendNUIMessage({
            action = 'show',
        })
        open = true
    end
end



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsDisabledControlJustPressed(0, 0x4A903C11) then
			OpenPauseMenu()
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if DisableControlAction(0, 0x4A903C11) then
        end
    end
end)


CreateThread(function()
    while true do 
        IsPauseMenuActive(true) 
        Wait(1)
    end
end)

RegisterNUICallback('exit', function(data, cb)
	SetNuiFocus(false, false)
	open = false
	
end)

RegisterNUICallback('SendAction', function(data, cb)
    if data.action == 'settings' then 
        function LaunchUiappByHash(hash)
            Citizen.InvokeNative(0xC8FC7F4E4CF4F581, hash)
        end
        LaunchUiappByHash(`settings_menu`)
        SetNuiFocus(false, false)
		open = false
	elseif data.action == 'exit' then 

        TriggerServerEvent("pausemenu:quit")
        SetNuiFocus(false, false)
		open = false
		
	elseif data.action == 'map' then 
        function LaunchUiappByHash(hash)
            Citizen.InvokeNative(0xC8FC7F4E4CF4F581, hash)
        end
        LaunchUiappByHash(`map`)


        SetNuiFocus(false, false)
		open = false
		
    end

end)


print("TUCAN PAUSE MENU READY")