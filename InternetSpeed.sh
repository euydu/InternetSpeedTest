#!/bin/bash
# Created by Emre Uydu - System Engineer
# emreuydu@gmail.com
# Contact to me for more info
############################################
Message1=$(/Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -icon "/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/AppleTraceFile.icns" -lockHUD -heading "Internet Speed Test" -button1 "OK" -title "System" -defaultButton 1 -description "Internet speed test is in progress. This window will close automatically. Please do not close the self-service application." -windowType hud -timeout 15)
function SpeedTest {
	networkQuality -v
}
CurrentUser=$(stat -f %Su /dev/console)
FileName="/Users/$CurrentUser/Desktop/NetworkData.txt"
SpeedTest > $FileName
UploadSpeed=$(head -n 5 $FileName | tail -1)
DownloadSpeed=$(head -n 9 $FileName | tail -1)
DeviceSerialNumber=$(system_profiler SPHardwareDataType | awk '/Serial/ {print $4}')
DeviceName=$(hostname )
ResultFile="/Users/$CurrentUser/Desktop/SpeedResult.txt"
#TimeStamp
ReportDate=`date '+%A %d-%B, %Y'`
ReportTime=`date +"%T"`
ReportDateTime=$ReportDate" - "$ReportTime
echo "==== Network Speed Test Results ====" > $ResultFile
echo "" >> $ResultFile
echo "" >> $ResultFile
echo "Download Speed: " >> $ResultFile
echo $DownloadSpeed >> $ResultFile
echo "" >> $ResultFile
echo "Upload Speed: " >> $ResultFile
echo $UploadSpeed >> $ResultFile
echo "" >> $ResultFile
echo "" >> $ResultFile
echo "Device Details:" >> $ResultFile
echo "Serial Number: "$DeviceSerialNumber >> $ResultFile
echo "Device Name: "$DeviceName >> $ResultFile
echo "Active JAMF Connect User: "$CurrentUser >> $ResultFile
echo "" >> $ResultFile
echo "" >> $ResultFile
echo "For more network details, please check NetworkData.txt on your desktop folder" >> $ResultFile
echo "" >> $ResultFile
echo "Created on "$ReportDateTime >> $ResultFile
Message2=$(/Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -icon "/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/AlertNoteIcon.icns" -lockHUD -heading "Internet Speed Test" -button1 "OK" -title "System" -defaultButton 1 -description "Test Completed !
You can find the log files in your desktop folder." -windowType hud -timeout 8)
