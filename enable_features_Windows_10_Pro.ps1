#Enable Roles and Features for FF Core
#Tested on Windows 10 Pro Build

#(Get-WmiObject -class Win32_OperatingSystem)

Enable-WindowsOptionalFeature -Online -FeatureName "Printing-PrintToPDFServices-Features" -All
Enable-WindowsOptionalFeature -Online -FeatureName "Printing-XPSServices-Features" -All
Enable-WindowsOptionalFeature -Online -FeatureName "IIS-WebServerRole" -All
Enable-WindowsOptionalFeature -Online -FeatureName "IIS-WebServer" -All
Enable-WindowsOptionalFeature -Online -FeatureName "IIS-CommonHttpFeatures" -All
Enable-WindowsOptionalFeature -Online -FeatureName "IIS-HttpErrors" -All
Enable-WindowsOptionalFeature -Online -FeatureName "IIS-HttpRedirect" -All
Enable-WindowsOptionalFeature -Online -FeatureName "IIS-ApplicationDevelopment" -All
Enable-WindowsOptionalFeature -Online -FeatureName "IIS-Security" -All
Enable-WindowsOptionalFeature -Online -FeatureName "IIS-RequestFiltering" -All
Enable-WindowsOptionalFeature -Online -FeatureName "IIS-NetFxExtensibility45" -All
Enable-WindowsOptionalFeature -Online -FeatureName "IIS-HealthAndDiagnostics" -All
Enable-WindowsOptionalFeature -Online -FeatureName "IIS-HttpLogging" -All
Enable-WindowsOptionalFeature -Online -FeatureName "IIS-LoggingLibraries" -All
Enable-WindowsOptionalFeature -Online -FeatureName "IIS-RequestMonitor" -All
Enable-WindowsOptionalFeature -Online -FeatureName "IIS-HttpTracing" -All
Enable-WindowsOptionalFeature -Online -FeatureName "IIS-Performance" -All
Enable-WindowsOptionalFeature -Online -FeatureName "IIS-WebServerManagementTools" -All
Enable-WindowsOptionalFeature -Online -FeatureName "IIS-IIS6ManagementCompatibility" -All
Enable-WindowsOptionalFeature -Online -FeatureName "IIS-Metabase" -All
Enable-WindowsOptionalFeature -Online -FeatureName "WAS-WindowsActivationService" -All
Enable-WindowsOptionalFeature -Online -FeatureName "WAS-ProcessModel" -All
Enable-WindowsOptionalFeature -Online -FeatureName "WAS-ConfigurationAPI" -All
Enable-WindowsOptionalFeature -Online -FeatureName "WCF-Services45" -All
Enable-WindowsOptionalFeature -Online -FeatureName "WCF-HTTP-Activation45" -All
Enable-WindowsOptionalFeature -Online -FeatureName "WCF-MSMQ-Activation45" -All
Enable-WindowsOptionalFeature -Online -FeatureName "WCF-TCP-PortSharing45" -All
Enable-WindowsOptionalFeature -Online -FeatureName "IIS-StaticContent" -All
Enable-WindowsOptionalFeature -Online -FeatureName "IIS-DefaultDocument" -All
Enable-WindowsOptionalFeature -Online -FeatureName "IIS-DirectoryBrowsing" -All
Enable-WindowsOptionalFeature -Online -FeatureName "IIS-ApplicationInit" -All
Enable-WindowsOptionalFeature -Online -FeatureName "IIS-ASPNET45" -All
Enable-WindowsOptionalFeature -Online -FeatureName "IIS-ISAPIExtensions" -All
Enable-WindowsOptionalFeature -Online -FeatureName "IIS-ISAPIFilter" -All
Enable-WindowsOptionalFeature -Online -FeatureName "IIS-BasicAuthentication" -All
Enable-WindowsOptionalFeature -Online -FeatureName "IIS-HttpCompressionStatic" -All
Enable-WindowsOptionalFeature -Online -FeatureName "IIS-ManagementConsole" -All
Enable-WindowsOptionalFeature -Online -FeatureName "MSMQ-Container" -All
Enable-WindowsOptionalFeature -Online -FeatureName "MSMQ-Server" -All
Enable-WindowsOptionalFeature -Online -FeatureName "MSMQ-ADIntegration" -All
Enable-WindowsOptionalFeature -Online -FeatureName "MSMQ-HTTP" -All
Enable-WindowsOptionalFeature -Online -FeatureName "IIS-WindowsAuthentication" -All
Enable-WindowsOptionalFeature -Online -FeatureName "MediaPlayback" -All
Enable-WindowsOptionalFeature -Online -FeatureName "WindowsMediaPlayer" -All
Enable-WindowsOptionalFeature -Online -FeatureName "SmbDirect" -All
Enable-WindowsOptionalFeature -Online -FeatureName "Windows-Defender-Default-Definitions" -All
Enable-WindowsOptionalFeature -Online -FeatureName "SearchEngine-Client-Package" -All
Enable-WindowsOptionalFeature -Online -FeatureName "MSRDC-Infrastructure" -All
Enable-WindowsOptionalFeature -Online -FeatureName "WorkFolders-Client" -All
Enable-WindowsOptionalFeature -Online -FeatureName "Printing-Foundation-Features" -All
Enable-WindowsOptionalFeature -Online -FeatureName "Printing-Foundation-InternetPrinting-Client" -All
Enable-WindowsOptionalFeature -Online -FeatureName "Printing-Foundation-LPRPortMonitor" -All
Enable-WindowsOptionalFeature -Online -FeatureName "MicrosoftWindowsPowerShellV2Root" -All
Enable-WindowsOptionalFeature -Online -FeatureName "MicrosoftWindowsPowerShellV2" -All
Enable-WindowsOptionalFeature -Online -FeatureName "NetFx4-AdvSrvs" -All
Enable-WindowsOptionalFeature -Online -FeatureName "NetFx4Extended-ASPNET45" -All
Enable-WindowsOptionalFeature -Online -FeatureName "Internet-Explorer-Optional-amd64" -All

(Get-WindowsOptionalFeature -Online -FeatureName '*') | Format-Table