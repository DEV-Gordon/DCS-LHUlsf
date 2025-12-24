# DCS LocalHost Utility - Real-Time Telemetry Export

Export real-time flight telemetry from DCS World to external applications via UDP, similar to War Thunder's localhost:8111 system.

## What it does

Streams the following data every frame in JSON format:
- Aircraft name and pilot name
- Speeds: IAS (Indicated Air Speed) and TAS (True Air Speed)
- Altitudes: MSL (Mean Sea Level) and AGL (Above Ground Level)
- Flight angles: Pitch, Roll, Yaw
- Vertical velocity
- Mach number
- Angle of Attack (AoA)

## Features

✅ Real-time data streaming via UDP (port 7778)
✅ Zero performance impact - optimized for minimal FPS loss
✅ Works with ALL DCS aircraft
✅ JSON format for easy integration
✅ Includes Python example receiver
✅ Perfect for streamers, hardware builders, and developers

## Installation

1. **Extract** the archive to a temporary folder

2. **Copy LuaSocket folder** to your DCS installation:
```
   C:\Program Files\Eagle Dynamics\DCS World\LuaSocket\
```

3. **Copy LHUlsf.lua** to your Scripts folder:
```
   C:\Users\[YourName]\Saved Games\DCS\Scripts\LHUlsf.lua
```

4. **Edit Export.lua** (create if doesn't exist):
```
   C:\Users\[YourName]\Saved Games\DCS\Scripts\Export.lua
```
   
   Add this line at the beginning:
```lua
   local LHUlfs=require('lfs');dofile(lfs.writedir() .. 'Scripts/LHUlsf.lua')
```

5. **Done!** Start DCS and fly any aircraft

## Testing

Run the included `MiniBackend.py` (requires Python 3):
```bash
python MiniBackend.py
```

You'll see JSON data streaming in real-time when you fly.

## Use Cases

- **Custom Dashboards**: Build web-based flight instruments
- **Stream Overlays**: Display telemetry on Twitch/YouTube
- **Hardware Integration**: Connect to MFDs, button boxes, LEDs
- **Flight Analysis**: Record and analyze your flights
- **Third-party Tools**: Integrate with SimShaker, VoiceAttack, etc.

## Data Format
```json
{
  "aircraft": "F-16C_50",
  "pilot": "PlayerName",
  "pitch": 0.123456,
  "roll": -0.045678,
  "yaw": 1.234567,
  "ias": 250.50,
  "tas": 280.75,
  "altMSL": 5000.00,
  "altAGL": 4500.00,
  "vertVel": 15.50,
  "mach": 0.75,
  "aoa": 0.087654
}
```

## Configuration

Default settings:
- **IP**: 127.0.0.1 (localhost)
- **Port**: 7778
- **Protocol**: UDP

To change port, edit line 9 in `LHUlsf.lua`

## Troubleshooting

**No data received?**
- Check Export.lua has the correct line
- Verify LuaSocket is in DCS installation folder
- Check dcs.log for errors

**Invalid JSON error?**
- Make sure you're using the corrected version of LHUlsf.lua

## Compatibility

- ✅ DCS World 2.5+
- ✅ DCS World 2.7+
- ✅ DCS World 2.9+
- ✅ All modules (FC3, full fidelity, helicopters, WWII)
- ✅ Multiplayer compatible
- ✅ VR compatible

## Credits

Created by DonGordon(callsing Freeman)
Based on DCS Export API and LuaSocket

## Support

For issues, questions or suggestions:
- Check the included README.md
- Visit DCS forums
- Join Hoggit Discord

## License

Freeware - Free for personal and commercial use
