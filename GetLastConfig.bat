robocopy y:\ "C:\Users\matt\Documents\HomeAssistantConfig" /s /e /XF home-assistant_v2.db /XF home-assistant_v2.db /xd deps-old
del "C:\Users\matt\Documents\HomeAssistantConfig\flows.json" >nul 2>&1
C:\Users\matt\Desktop\jq-win64.exe . C:\Users\matt\Documents\HomeAssistantConfig\node-red\flows.json >> C:\Users\matt\Documents\HomeAssistantConfig\flows.json