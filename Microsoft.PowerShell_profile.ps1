function e {
    $editor = "codium"
    $path = "."

    switch ($args[0]) {
        "-c" {
            $editor = "code"
            if ($args.Count -gt 1) { $path = $args[1] }
        }
        "-a" {
            $editor = "C:\Users\marku\AppData\Local\Programs\Antigravity IDE\Antigravity IDE.exe"
            if ($args.Count -gt 1) { $path = $args[1] }
        }
	"-u" {
	    $editor = "cursor"
	    if ($args.Count -gt 1) { $path = $args[1] }
	}
        default {
            if ($args.Count -gt 0) { $path = $args[0] }
        }
    }

    & $editor $path
}

function l {
    if ($args[0]) { Get-ChildItem -Force @args }
    else {  Get-ChildItem -Force . }
}

function lsusb {
    GET-WMIOBJECT win32_diskdrive | Where { $_.InterfaceType –eq ‘USB’ }
}

function btop {
    btop4win
}

function g {
    param(
        [Parameter(ValueFromRemainingArguments = $true)]
        [string[]]$Args
    )

    if (-not $Args) {
        git
    } else {
        switch ($Args[0]) {
            "c" {
                if ($Args.Count -lt 2) {
                    Write-Host "Usage: g c <commit message>" -ForegroundColor Yellow
                } else {
                    $message = $Args[1..($Args.Count-1)] -join " "
                    git commit -m $message
                }
            }

	    "a" {
		if ($Args.Count -eq 1) {
		    git add -A
		} elseif ($Args.Count -eq 2) {
		    git add $Args[1]
		} else {
		    Write-Host "Usage: g a <path (optional)>" -ForegroundColor Yellow
		}
	    }

            "p" {
                if ($Args.Count -eq 3) {
                    git push $Args[1] $Args[2]
                } elseif ($Args.Count -eq 2) {
                    git push $Args[1]
                } else {
                    git push
                }
            }

	    "b" {
		if ($Args.Count -eq 2) {
		    git branch $Args[1]
		} elseif ($Args.Count -eq 3) {
		    git branch $Args[1] $Args[2]
		} else {
		    git branch
	  	}
	  }

	    "sw" {
		if ($Args.Count -eq 2) {
		    git switch $Args[1]
		} else {
		    Write-Host "Usage: g sw <branch>" -ForegroundColor Yellow
		}
	    }

	    "st" {
		git status
	    }

            "g" {
                if ($Args.Count -eq 3) {
                    git pull $Args[1] $Args[2]
                } elseif ($Args.Count -eq 2) {
                    git pull $Args[1]
                } else {
                    git pull
                }
            }

            default {
                git @Args
            }
        }
    }
}

function subbuster { & "C:\Program Files\subbuster\subbuster.ps1" @args }

function .. {
    cd ..
}

function f {
    if ($Args.Count -eq 1) {
	cd $Args[0]
    } else {
	Write-Host "Usage f <path>" -ForegroundColor Yellow
    }
}

function c {
    clear
}

function rd {
    param(
        [string]$Path,
	[switch]$rf
    )

    if ($rf) {
        Remove-Item -Path $Path -Recurse -Force
    } else {
        Remove-Item -Path $Path
    }
}

# Give a montivational quote when feeling down :p
function fuck {
    $quotes = @(
        @{ Quote = "Programs must be written for people to read, and only incidentally for machines to execute."; Author = "Harold Abelson" },
        @{ Quote = "Talk is cheap. Show me the code."; Author = "Linus Torvalds" },
        @{ Quote = "The most disastrous thing that you can ever learn is your first programming language."; Author = "Alan Kay" },
        @{ Quote = "The best way to predict the future is to invent it."; Author = "Alan Kay" },
        @{ Quote = "Simplicity is prerequisite for reliability."; Author = "Edsger W. Dijkstra" },
        @{ Quote = "Testing leads to failure, and failure leads to understanding."; Author = "Burt Rutan" },
        @{ Quote = "Measuring programming progress by lines of code is like measuring aircraft building progress by weight."; Author = "Bill Gates" },
        @{ Quote = "The function of good software is to make the complex appear simple."; Author = "Grady Booch" },
        @{ Quote = "Controlling complexity is the essence of computer programming."; Author = "Brian Kernighan" },
        @{ Quote = "Before software can be reusable it first has to be usable."; Author = "Ralph Johnson" },
        @{ Quote = "Walking on water and developing software from a specification are easy if both are frozen."; Author = "Edward V. Berard" },
        @{ Quote = "The only way to learn a new programming language is by writing programs in it."; Author = "Dennis Ritchie" },
        @{ Quote = "Any fool can write code that a computer can understand. Good programmers write code that humans can understand."; Author = "Martin Fowler" },
        @{ Quote = "First, solve the problem. Then, write the code."; Author = "John Johnson" },
        @{ Quote = "Code never lies, comments sometimes do."; Author = "Ron Jeffries" }
    )
    
    $quote = $quotes | Get-Random
    Write-Host
    Write-Host "`"$($quote.Quote)`"" -ForegroundColor White
    Write-Host "— $($quote.Author)" -ForegroundColor DarkGray
    Write-Host
}

function n {
    nvim @args
    [Console]::Write("`e[5 q")
}

function oc {
    opencode
}

$global:VPaths = @{
    "0"	  = "C:\Users\marku\Documents"
    "d"	  = "C:\Users\marku\Documents"

    "1"	  = "C:\Users\marku\Documents\Classes"
    "c"   = "C:\Users\marku\Documents\Classes"

    "2"   = "C:\Users\marku\Documents\GoalFinder"
    "g"   = "C:\Users\marku\Documents\GoalFinder"

    "23"  = "C:\Users\marku\Documents\GoalFinder\embedded-systems"
    "ge"  = "C:\Users\marku\Documents\GoalFinder\embedded-systems"

    "20"  = "C:\Users\marku\Documents\GoalFinder\main"
    "gm"  = "C:\Users\marku\Documents\GoalFinder\main"

    "201" = "C:\Users\marku\Documents\GoalFinder\main\embedded"
    "gme" = "C:\Users\marku\Documents\GoalFinder\main\embedded"

    "202" = "C:\Users\marku\Documents\GoalFinder\main\web"
    "gmw" = "C:\Users\marku\Documents\GoalFinder\main\web"

    "203" = "C:\Users\marku\Documents\GoalFinder\main\blueprint\design\pcb"
    "gmp" = "C:\Users\marku\Documents\GoalFinder\main\blueprint\design\pcb"

    "21"  = "C:\Users\marku\Documents\GoalFinder\website"
    "gw"  = "C:\Users\marku\Documents\GoalFinder\website"

    "22"  = "C:\Users\marku\Documents\GoalFinder\assets"
    "ga"  = "C:\Users\marku\Documents\GoalFinder\assets"

    "901" = "C:\Users\marku\Documents\Projects\portfolio"
    "prt" = "C:\Users\marku\Documents\Projects\portfolio"

    "p"   = "C:\Users\marku\Documents\Projects"
    "3"   = "C:\Users\marku\Documents\Projects"
}

function b {
    param(
        [string]$Option
    )

    if ($Option -eq "fw") { pio run -t upload }
    elseif ($Option -eq "fs") { pio run -t uploadfs }
    elseif ($Option -eq "mt") { pio run -t monitor }	
    elseif ($Option -eq "rb") { pio run -t clean }
    elseif ($Option -eq "sb") {
    	pio run -t upload

	    if ($LASTEXITCODE -eq 0) {
	        pio run -t monitor
	    }
    } elseif ($Option -eq "st") {
        pio run -t settings
    } elseif ($Option -eq "fb") {				
	    cd ..\web
	    npm run build
    	cd ..\embedded
	    pio run -t uploadfs
    	pio run -t upload
    	pio run -t monitor
    } elseif ($Option -eq "fc") {
    	pio run -t erase
    	pio run -t clean
    } elseif ($Option -eq "cb") {
    	cd ..\web
    	npm run build
    	cd ..\embedded	    
    	pio run -t erase
    	pio run -t clean
    	pio run -t uploadfs
    	pio run -t upload
    	pio run -t monitor
    } else {
    	Write-Host "Unknown Option"
    	Write-Host ""
    	Write-Host "fw - Upload firmware"
    	Write-Host "fs - Upload filesystem"
    	Write-Host "mt - Monitor"
    	Write-Host "rb - Clean build directory"
    	Write-Host "sb - Upload firmware and monitor"
    	Write-Host "fb - Upload filesystem then firmware and finally monitor"
    	Write-Host "fc - Clean build directory and erase flash"
    	Write-Host "cb - Clean build directory, erase flash, upload filesystem and firmware, then monitor"
        Write-Host "st - Run settings script"
    }
}

function v {
    param(
        [string]$Key
    )

    if (-not $Key) {
        Write-Host "`nAvailable shortcuts:`n"

        foreach ($k in $VPaths.Keys | Sort-Object) {
            Write-Host ("{0,-10} -> {1}" -f $k, $VPaths[$k])
        }

        return
    }

    if ($VPaths.ContainsKey($Key)) {
        Set-Location $VPaths[$Key]
    } else {
        Write-Host "Unknown shortcut: $Key"
    }
}

function p {
    param(
        [string]$Key
    )

    if ($Key -and $VPaths.ContainsKey($Key)) {
        $target = $VPaths[$Key]
    }
    else {
        $target = $PWD
    }

    Start-Process pwsh -WorkingDirectory $target
}

function ij {
    $paths = if ($args.Count -gt 0) {
        $args | ForEach-Object { (Resolve-Path $_).Path }
    } else {
        (Get-Location).Path
    }

    Start-Process "C:\Program Files\JetBrains\IntelliJ IDEA 2026.2.3\bin\idea64.exe" -ArgumentList $paths
}

function cl {
    $paths = if ($args.Count -gt 0) {
        $args | ForEach-Object { (Resolve-Path $_).Path }
    } else {
        (Get-Location).Path
    }

    Start-Process "C:\Program Files\JetBrains\CLion 2026.2.3.1\bin\clion64.exe" -ArgumentList $paths
}

function ws {
    $paths = if ($args.Count -gt 0) {
        $args | ForEach-Object { (Resolve-Path $_).Path }
    } else {
        (Get-Location).Path
    }

    Start-Process "C:\Program Files\JetBrains\WebStorm 2026.2.3\bin\webstorm64.exe" -ArgumentList $paths
}

function pr {
    param([string]$Path = ".")
    Start-Process $Path
}

function sqldev {
    Start-Process "C:\Users\marku\Documents\Classes\DBI\sqldeveloper\sqldeveloper.exe"
}

function lo {
    rundll32.exe user32.dll,LockWorkStation
}

clear
Write-Host
fastfetch
fuck
