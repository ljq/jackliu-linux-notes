### Centos7-Systemd-Service custom write Service application service configuration instructions finishing


###### System basic service service configuration directory (do not move this directory, in general, only the system core basic service configuration, whether to store application registration service configuration)
/ etc / systemd / system

###### Custom service configuration management directory (stores custom application registration services and third-party service configuration):
/ usr / lib / systemd / system /

####### Custom .service configuration file (permissions: 754) format (Take application app-run.service as an example, execute the file for timeout processing!):

```
[Unit]
Description = "app-run @ Author Jack Liu Process Daemon" # Service description
After = rc-local.service # Service category:
 # Example startup sequence (default is called and executed after rc-local.service)

[Service]
Type = forking # Prefer to use the forking method:
                                                        # (Follow traditional Unix practices, set PIDFile = option
                                                        # Help systemd accurately locate the main process of the service)
PIDFile = / var / run / app-run.pid # Set the PID of the application process (default)
Environment = "GOPATH = / usr / local / go" # environment variable setting, multiple Environment = items can be set
 Reminder: Environment = or EnvironmentFile = Remarks: Environment = or EnvironmentFile = # ： 注
 Quoting documents, both methods can be used for quoting documents, both methods can be used.
ExecStart = / data / auto_run.sh start # Call to start the executable:
                                                        # (Service configuration uses absolute paths,
                                                        # Commands in executable files use absolute path format)
ExecReload = / data / auto_run.sh reload # reload (default)
ExecStop = / data / auto_run.sh stop # Stop service (default)
DefaultTimeoutStartSec = 30 # The maximum time allowed for service startup, timeout time (default no unit: seconds)
                                                        # Units: "ms" (milliseconds), "s" (seconds), "min" (minutes),
 "H" (hours), "d" (days), "w" (weeks), and "w" (weeks)
PrivateTmp = True # Whether to allocate independent temporary space (default)

[Install]
WantedBy = multi-user.target
```

EnvironmentFile default convention reference storage directory is generally:
/usr/lib/systemd/system/app-run.service.d/environment.conf
(Format: Key = Value)


###### Service service management common operation commands
```
Enable a service at boot: systemctl enable app-run.service
Disable a service on boot: systemctl disable app-run.service
Start a service: systemctl start app-run.service
Stop a service: systemctl stop app-run.service
Restart a service: systemctl restart app-run.service
Display the status of a service: systemctl status app-run.service
Check if the service is started after booting: systemctl is-enabled app-run.service
View the list of started services: systemctl list-unit-files | grep enabled
```

Note: The service cannot perform the check to see if SElinux is enabled, and close SElinux by itself.