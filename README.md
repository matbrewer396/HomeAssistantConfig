# Home Assistant Setup 
Here my home assistant configuration and a few notes to go along with it. This more for me to keep track of what I've created.

## Hardware / Devices
List of all my device, that make house smart:

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


