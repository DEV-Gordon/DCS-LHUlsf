-- ===============================
-- DCS Telemetry Export v1.0 by Freeman
-- ===============================
-- add in original 
-- export.lua local LHUlfs=require('lfs');dofile(lfs.writedir() .. 'Scripts/LHUlsf.lua')
-- ===============================

package.path  = package.path  .. ";.\\LuaSocket\\?.lua"
package.cpath = package.cpath .. ";.\\LuaSocket\\?.dll"

local socket = require("socket")

local udp = socket.udp()
udp:settimeout(0)
udp:setpeername("127.0.0.1", 7778)

function LuaExportAfterNextFrame()

    local selfData = LoGetSelfData()
    if not selfData then return end

    local namePilot = LoGetPilotName()
    if not namePilot then return end

    local iasSpeed = LoGetIndicatedAirSpeed()
    if not iasSpeed then return end

    local trueSpeed = LoGetTrueAirSpeed()
    if not trueSpeed then return end

    local pitch, roll, yaw = LoGetADIPitchBankYaw()
    if not pitch then return end

    local altMSL = LoGetAltitudeAboveSeaLevel()
    if not altMSL then return end

    local altAGL = LoGetAltitudeAboveGroundLevel()
    if not altAGL then return end

    local vertVel = LoGetVerticalVelocity()
    if not vertVel then return end

    local mach = LoGetMachNumber()
    if not mach then return end

    local aoa = LoGetAngleOfAttack()
    if not aoa then return end

    local msg = string.format(
    '{"aircraft":"%s","pilot":"%s","pitch":%.6f,"roll":%.6f,"yaw":%.6f,"ias":%.2f,"tas":%.2f},"altMSL":%.2f},"altAGL":%.2f},"vertVel":%.2f},"mach":%.2f},"aoa":%.6f}',
    selfData.Name,
    namePilot,
    pitch,
    roll,
    yaw,
    iasSpeed,
    trueSpeed,
    altMSL,
    altAGL,
    vertVel,
    mach,
    aoa
    )

    udp:send(msg)
end