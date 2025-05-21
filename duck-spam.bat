@echo off
if not "%1"=="hidden" (
    powershell -command "Start-Process -FilePath '%~f0' -ArgumentList 'hidden' -WindowStyle Hidden"
    exit
)
powershell -C "Add-Type -AssemblyName PresentationFramework; $margin=100; for ($j=0;$j -lt 200;$j++){ $w=New-Object Windows.Window; $w.Width=400; $w.Height=300; $w.WindowStyle='None'; $w.ResizeMode='NoResize'; $w.AllowsTransparency=$true; $w.Background='Transparent'; $w.ShowInTaskbar=$false; $w.Topmost=$true; $i=New-Object Windows.Controls.Image; $i.Width=400; $i.Height=300; $b=New-Object Windows.Media.Imaging.BitmapImage; $b.BeginInit(); $b.UriSource='https://pngimg.com/d/rubber_duck_PNG54.png'; $b.EndInit(); $i.Source=$b; $w.Content=$i; $screenWidth=[System.Windows.SystemParameters]::PrimaryScreenWidth; $screenHeight=[System.Windows.SystemParameters]::PrimaryScreenHeight; $w.Left=Get-Random -Minimum (-$margin) -Maximum ($screenWidth-400+$margin); $w.Top=Get-Random -Minimum (-$margin) -Maximum ($screenHeight-300+$margin); $w.Show(); Start-Sleep -Milliseconds 10; }; [System.Windows.Threading.Dispatcher]::Run()"
timeout /t 2 /nobreak >nul && DEL "%~f0"