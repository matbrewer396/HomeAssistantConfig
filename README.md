# Home Assistant Setup 
Here my home assistant configuration and a few notes to go along with it. This more for me to keep track of what I've created.

## Hardware / Devices
List of all my device, that make house smart:

### Hue / Controllers / Pi
| Device  | Quantity | Notes |
| ------------- | :---: | ------------- | 
| Hue Hub | 1 |  | 
| IntelNuc | 1 | Runs HASSIO and much more| 
| PI Zero | 1 | Bluetooth Gateway https://github.com/zewelor/bt-mqtt-gateway |
| PI Zero | 1 | Octo print |
| PI Zero | 1 | Blue tooth tracker using https://github.com/andrewjfreyer/monitor/blob/master/support/README.md and motion eye |
| Broadlink IR home hub | 1 | Monition Eye |
| 1byone Easy Chime Wireless Doorbell | 1 | with a nodemcu to connect to HA |
| dresden elektronik ConBee II | 1 | for all my zigbee needs |

### Lights
| Device  | Quantity | Notes |
| ------------- | :---: | ------------- | 
| Philips Hue White and Color Ambiance | 6 | Connected via hue hub | 
| Philips Hue White Ambiance | 4 | Connected via hue hub | 
| Philips Hue White and Color Ambiance Light Strip | 2 | Connected via hue hub | 
| DIY: 39inch RGB LED Light | 1 | Connect to nodemcu, controlled via MQTT | 
| DIY: ws2812b LED Light strips  | 4 | Connect to nodemcu / D1 mini, using a modded version of WLED firmware  | 

### Motion Detector
| Device  | Quantity | Notes |
| ------------- | :---: | ------------- | 
| Philips Hue Smart Motion Sensor | 2 | Connected via hue hub |
| DIY: PIR Motion Detector | 3 | Connect to nodemcu, controlled via MQTT  | 
| Xiaomi Aqara Human Body Sensor | 1 | Connect to Zigbee USB |

### Door / Window Senor
| Device  | Quantity | Notes |
| ------------- | :---: | ------------- | 
| DIY: Door / Window Magnetic Contact Reed Switch | 4 | Connect to nodemcu, pushes to MQTT | 
| Aqara Door / Window / Temperature Senor | 5 | Connect to Zigbee USB | 

### Temperature / Humidity / Light Level
| Device  | Quantity | Notes |
| ------------- | :---: | ------------- | 
| DIY: DHT11 | 4 | Temperature & Humidity. Connect to nodemcu, pushes to MQTT | 
| DIY: DHT22 | 2 | Temperature & Humidity. Connect to nodemcu, pushes to MQTT | 
| DIY: LDR | 4 | Light Level. Connect to nodemcu, pushes to MQTT | 
| Philips Hue Smart Motion Sensor | 2 | Temperature / Light Level. Connected via hue hub |
| Shelly H&T | 2 | Temperature & Humidity |
| miflora | 1 |  |

### Load Sensor
| Device  | Quantity | Notes |
| ------------- | :---: | ------------- | 
| DIY: HX711 + 4x Load Cells | 1 | Connect via Node NCU |


### Plugs
| Device  | Quantity | Notes |
| ------------- | :---: | ------------- | 
| Teckin WI-FI Plug | 10 | flashed with tasmota | 
| 2nice WI-FI Plug | 4 | flashed with tasmota | 
| Eve Elgato Plug | 2 | BLE - Cant find a way to connect to HA, so there more use for odd task like restarting PI | 


### Alexas
| Device  | Quantity | Notes |
| ------------- | :---: | ------------- | 
| Echo dot 2nd gen | 1 |  | 
| Echo dot 3rd gen | 3 |  | 
| Echo | 2 |  | 
| Fire TV 4k | 1 |  | 

### Camera
| Device  | Quantity | Notes |
| ------------- | :---: | ------------- | 
| Neos SmartCam | 5 | flashed to https://github.com/EliasKotlyar/Xiaomi-Dafang-Hacks | 

### Mechanical
| Device  | Quantity | Notes |
| ------------- | :---: | ------------- | 
| SwitchBot | 1 | Bluetooth to pi zero, then MQTT |

### Buttons
| Device  | Quantity | Notes |
| ------------- | :---: | ------------- | 
| Aqara Wireless Smart Switch - Double Button  | 1 |  |



## Automation
List of all my automation, that make house smart. 

### Home / Away - Alarm
Key points: 
* Life360 uses GPS to provide a Home / Away for everyone
* Bluetooth tracker to get real-time update if someone leaves / come home
* On font door open, bluetooth tracker trigger a scan for who has arrived
* On arrival / font door open - light on if dark
* On font door close, bluetooth tracker trigger a scan every 15 seconds for upto 5 minutes or untill leaves
* While armed, if any motion / contract sensor is triggered this trigger alarm

### The Alarm
This is really just a big annoying show to scare off anyone
* All lights flash red
* All alexs playing message
* Send everyone notification, with of a disable option

### Good Night / Good Bye
Pretty much the same
* Turn off everything
* Send hibrate command to pc using https://github.com/karpach/remote-shutdown-pc/releases

### Living Room
* On font door open and is dark, main light turn on
* In the morning, when the hallway motion sensor. Living room lights will come for 30 seconds and will remain on if the living room motion sensor is triggered. - This more convenience to void delay of walking into a dark room.
* Voice control - "Alexa Lights" / "Alex Turn on living room lights"
* Voice control - "Alexa TV On" - plug fire tv
* Voice control - "Alexa Turn On Living Room Plug" - we have extension lead that runs under sofa for thing phone / laptops charger etc
* Fire Tv go to idle - tv turn off
* Fire Tv changes from idle - turn on tv 

### Kitchen
* Fridge/ Freezer - when the temperature drops below target trigger a notification (door might be open). - Testing!  assuming no false postive going hookup to alexa aka wake me up before food go bad!
* Voice control - "Alexa Lights" / "Alex Turn on kitchen room lights"
* On dishwasher door open the smart plug switched off and back on after the door close - stops an annoying bleep when dorr is left open
* On dishwasher status changed, notification is sent and alex say completed
* On washing machine status changed, notification is sent and alex say completed
* Plugs turn off when good night / bye triggered. On motion these are turn back on
* Plugs turn off when when no motion for 40 minuites. On motion these are turn back on

### Office (aka my room)
* On door open / motion and dark in room, lights turn on - turn off after 30 min
* Voice control - "Alexa Computer On" - off hibrate my pc. Under and above desk strip light also turn on
* On 3d printer status change, send notification
* Voice control - "Alexa Dryer On"

### Libary
* On motion turn on lights and plug 
* Turn off after no motion

### Hallway
* Simple light on when motion senor trigger and is dark for a few minutes - only automate that run outside of HA (all in hue hub)

### Bedroom
* Voice control - "Alexa Lights"
* When both in bed for more then 3 minutes, trigger good night process in node red
* When both in bed hallway / bathroom light turn off
* When someone get into bed, strip lights under bed are turn on and slowly dim
* When someone get out of bed, bath room light turns on (dimmed of course if night)
* On sunrise strip lights turn off
* turn off light after 30 minutes

### Bath Room
* On Motion & Door senors trigger light on. Turn off a few minutes later
* Input boolean on HA ui, for bath time - force the light to turn of for 1 hour
* Shower time - force the light to go max brightness, music starts playing
* when shower door open trigger shower time
* On window open, alex will give a details on temp and humidity inside and outside 
* Smart Switch - for when your up for talking:
  * Left Single Press: Toggle Light
  * Right Single Press: Bath Time 
  * Left Double Press: Shower Time
  * Right Double Press: 
  * Left Long Press: 
  * Right Long Press: 

### Bin Collection
* Let me know the day before when the next bin collection is and what type