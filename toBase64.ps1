$text = [System.IO.File]::ReadAllBytes("secretKey.json");
Set-Clipboard ([Convert]::ToBase64String($text));
