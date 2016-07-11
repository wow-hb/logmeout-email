$HBInstance = $args[0] #add your specific honorbuddy instance identifier as a command line argument

$HBPath = "C:\Honorbuddy" # Change this to your HB installation
$HBLogFile = (Get-ChildItem $HBPath\Logs -Recurse -ErrorAction SilentlyContinue | Where {!$_.PsIsContainer}|Sort LastWriteTime -descending | select -first 1).fullname

$SMTPServer = "smtp.gmail.com"
$SMTPPort = "587"
$Username = "from@gmail.com"
$Password = "password"

$to = "to@domain.com"
$subject = "logmeout - $HBInstance"
$body = (Get-Content "$HBLogFile")[-1 .. -200]

$message = New-Object System.Net.Mail.MailMessage
$message.subject = $subject
$message.body = $body
$message.to.add($to)
$message.from = $Username


$smtp = New-Object System.Net.Mail.SmtpClient($SMTPServer, $SMTPPort);
$smtp.EnableSSL = $true
$smtp.Credentials = New-Object System.Net.NetworkCredential($Username, $Password);
$smtp.send($message)
