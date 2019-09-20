function ConvertFrom-HTML {
    param (
        [string]$HTMLString
    )
    
    begin {
    }
    
    process {
        $HTML = New-Object -Com "HTMLFile"
        try {
            $html.IHTMLDocument2_write($HTMLString)
        }
        catch {
            $encoded = [System.Text.Encoding]::Unicode.GetBytes($HTMLString)
            $html.write($encoded)
        }
        Write-Output ($html.all | Where-Object { $_.tagname -eq 'body' } | Select-Object -Property innerText).innertext
    }
    
    end {
    }
}

