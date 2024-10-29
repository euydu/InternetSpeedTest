
# Internet Speed Test Script for macOS and Linux


## Features
* Speed Test Reporting: Measures upload, download, and ping speeds, storing results in two different files on the desktop:

    * `NetwordData.txt`: 
            
            Contains detailed network statistics, including upload, download, and ping.
    * `NetwordData.txt`: 
            
            Provides summary information with upload/download speed and device details.
    

* JAMF Integration: An extension attribute allows users to upload XML data to the JAMF Server for enhanced inventory reporting.

* Flexible Use: Run the script directly via JAMF Self Service for quick, on-demand speed testing, or integrate with JAMF's advanced inventory for continuous reporting.

## Setup (Only Script)

For JAMF: 
* Copy InternetSpeed.sh script to your JAMF Server
* Create a new policy, add script to your policy and run via self-service app. 

For Linux: 
```bash
  git clone <InternetSpeedTest>
  chmod +x internetspeedtest.sh

```

## Setup with JAMF Extension Attribute for advanced inventory reporting
* Upload the provided XML extension attribute to JAMF


## Authors

- [@euydu](https://www.github.com/euydu)
- emreuydu@gmail.com 

