# Home Assistant Setup 
Here my home assistant configuration and a few notes to go along with it. This more for me to keep track of what I've created.

## Hardware / Devices
List of all my device, that make house smart:

### Hue / Controllers / Pi
| Device  | Quantity | Notes |
| ------------- | :---: | ------------- | 
| Hue Hub | 1 |  | 
| PI3b | 1 | Runs HASSIO | 
| PI Zero | 1 | Bluetooth Tracker |
| PI Zero | 1 | Octo print |
| PI Zero | 1 | Monition Eye |
| Broadlink IR home hub | 1 | Monition Eye |
| 1byone Easy Chime Wireless Doorbell | 1 | with a nodemcu to connect to HA |

### Lights
| Device  | Quantity | Notes |
| ------------- | :---: | ------------- | 
| Philips Hue White and Color Ambiance | 6 | Connected via hue hub | 
| Philips Hue White Ambiance | 4 | Connected via hue hub | 
| Philips Hue White and Color Ambiance Light Strip | 2 | Connected via hue hub | 
| DIY: 39inch RGB LED Light | 1 | Connect to nodemcu, controlled via MQTT | 

### Motion Detector
| Device  | Quantity | Notes |
| ------------- | :---: | ------------- | 
| Philips Hue Smart Motion Sensor | 2 | Connected via hue hub |
| DIY: PIR Motion Detector | 1 | Connect to Pi | 

### Door / Window Senor
| Device  | Quantity | Notes |
| ------------- | :---: | ------------- | 
| DIY: Door / Window Magnetic Contact Reed Switch | 4 | Connect to nodemcu, pushes to MQTT | 

### Temperature / Humidity / Light Level
| Device  | Quantity | Notes |
| ------------- | :---: | ------------- | 
| DIY: DHT11 | 1 | Temperature & Humidity. Connect to nodemcu, pushes to MQTT | 
| DIY: DHT11 | 1 | Temperature & Humidity. Connect to Pi |
| DIY: DHT22 | 2 | Temperature & Humidity. Connect to nodemcu, pushes to MQTT | 
| DIY: LDR | 1 | Light Level. Connect to nodemcu, pushes to MQTT | 
| Philips Hue Smart Motion Sensor | 2 | Temperature / Light Level. Connected via hue hub |

### Load Sensor
| Device  | Quantity | Notes |
| ------------- | :---: | ------------- | 
| DIY: HX711 + 4x Load Cells | 1 | Connect via Node NCU |


### Plugs
| Device  | Quantity | Notes |
| ------------- | :---: | ------------- | 
| Teckin WI-FI Plug | 6 |  | 
| Eve Elgato Plug | 2 | BLE - Cant find a way to connect to HA, so there more use for odd task like restarting PI | 


### Alexas
| Device  | Quantity | Notes |
| ------------- | :---: | ------------- | 
| Echo dot 2nd gen | 1 |  | 
| Echo dot 3rd gen | 3 |  | 
| Echo | 2 |  | 
| Fire TV 4k | 1 |  | 




## Automation
List of all my automation, that make house smart. 

### Home / Away - Alarm
Key points: 
* Life360 uses GPS to provide a Home / Away for everyone
* Bluetooth tracker to get real-time update if someone leaves / come home
* On font door open, bluetooth tracker trigger a scan for who has arrived
* On font door close, bluetooth tracker trigger a scan every 15 seconds for upto 5 minutes or untill leaves
* While armed, if any motion / contract sensor is triggered this trigger alarm

### The Alarm
This is really just a big annoying show to scare off anyone
* All lights flash red
* All alexs playing message
* Send everyone notication, with of a disable option

### Good Night / Good Bye
Pretty much the same
* Turn off everything
* Send hibrate command to pc using https://github.com/karpach/remote-shutdown-pc/releases

### Living Room
* On font door open and is dark, main light turn on
* In the morning, when the hallway motion sensor. Living room lights will come for 30 seconds and will remain on if the living room motion sensor is triggered. - This more convenience to void delay of walking into a dark room.
* Voice control - "Alexa Lights" / "Alex Turn on living room lights"
* Voice control - "Alexa TV On" - plug fire tv
* Voice control - "Alexa Turn On Living Room Plug" - we have extention lead that runs under sofa for thing phone / laptops charger etc

### Kitchen
Nothing yet! 

### Office (aka my room)
* On door open and dark, lights turn on 
* Voice control - "Alexa Computer On" - off hibrate my pc. Under and above desk strip light also turn on
* On 3d printer status change, send notication
* Voice control - "Alexa Dryer On"

### Hallway
* Simple light on when montion senor trigger and is dark for a few minutes - only automate that run outside of HA (all in hue hub)

### Bedroom
* Voice control - "Alexa Lights"
* When both in bed for more then 3 minutes, trigger good night process in node red
* When both in bed hallway / bathroom light turn off
* When someone get into bed, strip lights under bed are turn on and slowly dim
* When someone get out of bed, bath room light turns on (dimmed of course if night)
* On sunrise strip lights turn off

### Bath Room
* On Motion & Door senors trigger light on. Turn off a few minutes later
* Input boolean on HA ui, for bath time - force the light to turn of for 1 hour
