
RegisterCommand('fixgta', function(source, args, rawCommand)
    -- Get player ped
    local playerPed = PlayerPedId()

    -- Get current player coordinates
    local currentCoords = GetEntityCoords(playerPed)
    local currentHeading = GetEntityHeading(playerPed)

    -- Coordinates to teleport to
    local targetCoords = vector3(988.86, -3006.15, -39.65)
    local targetHeading = 295.02
    SendNUIMessage({ action = 'show' }) 
    SetTimecycleModifier("blackout")
    Wait(1000)

    FreezeEntityPosition(playerPed, true)

    -- Teleport to target coordinates
    SetEntityCoords(playerPed, targetCoords.x, targetCoords.y, targetCoords.z)
    SetEntityHeading(playerPed, targetHeading)

    -- Create and activate the camera
    local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 0, true, true)

    -- Set initial camera position (slightly above the player)
    local camCoords = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 2.0, 1.0)
    SetCamCoord(cam, camCoords.x, camCoords.y, camCoords.z)

    -- Look north (default heading 0)
    SetCamRot(cam, -20.0, 0.0, 0.0, 2)
    Wait(3000) -- Look north for 3 seconds

    -- Look south (180 degrees)
    SetCamRot(cam, -20.0, 0.0, 180.0, 2)
    Wait(3000) -- Look south for 3 seconds

    -- Look west (270 degrees)
    SetCamRot(cam, -20.0, 0.0, 270.0, 2)
    Wait(3000) -- Look west for 3 seconds

    -- Return to look north again (0 degrees) for another 3 seconds
    SetCamRot(cam, -20.0, 0.0, 0.0, 2)
    Wait(3000) -- Look north for 3 more seconds

    -- Destroy the camera after the viewing sequence is complete
    RenderScriptCams(false, false, 0, true, true)
    DestroyCam(cam, false)

    -- Teleport back to original coordinates
    SetEntityCoords(playerPed, currentCoords.x, currentCoords.y, currentCoords.z)
    SetEntityHeading(playerPed, currentHeading)

    -- Unfreeze the player
    FreezeEntityPosition(playerPed, false)
    Wait(1500)
    SetTimecycleModifier("default")
    SendNUIMessage({ action = 'close' })

end, false)


