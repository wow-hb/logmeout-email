# logmeout-email

Edit the script logmeout-email.ps1 to suit your needs!

Then, open logmeout settings and choose the "Action after" Tab:
- Check the "Execute the batch ligne"
- In Command/File enter: powershell
- In Arguments enter: -ExecutionPolicy Bypass -Command "& 'c:\scripts\wow-hb\logmeout-email.ps1' win7vm1"

c:\scripts\wow-hb : the directory the script is installed

logmeout-email.ps1 : the script of course

win7vm1 : the individual id for the specific honorbuddy instance (change this for every running HB instance)
