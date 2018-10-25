NET STOP "FreeFlow Core" /y
NET STOP "FreeFlow Core JMF Server"
NET STOP "FreeFlow Core Normalizer Instance Pool Service" /y
NET STOP "FreeFlow Core Reports" /y
NET STOP "FreeFlow Core Resource Monitor" /y

NET START "FreeFlow Core"
NET START "FreeFlow Core JMF Server"
NET START "FreeFlow Core Normalizer Instance Pool Service"
NET START "FreeFlow Core Reports"
NET START "FreeFlow Core Resource Monitor"

pause
