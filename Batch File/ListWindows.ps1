Add-Type @"
using System;
using System.Runtime.InteropServices;
using System.Text;

public class WinAPI {
    [DllImport("user32.dll")]
    public static extern bool EnumWindows(EnumWindowsProc enumProc, IntPtr lParam);

    public delegate bool EnumWindowsProc(IntPtr hWnd, IntPtr lParam);

    [DllImport("user32.dll")]
    public static extern int GetWindowText(IntPtr hWnd, StringBuilder lpString, int nMaxCount);

    [DllImport("user32.dll")]
    public static extern bool IsWindowVisible(IntPtr hWnd);

    [DllImport("user32.dll")]
    public static extern IntPtr SendMessage(IntPtr hWnd, uint Msg, IntPtr wParam, IntPtr lParam);

    public const int WM_CLOSE = 0x0010;
}
"@

[WinAPI]::EnumWindows({
    param($hWnd, $lParam)

    if ([WinAPI]::IsWindowVisible($hWnd)) {
        $title = New-Object Text.StringBuilder 256
        [WinAPI]::GetWindowText($hWnd, $title, $title.Capacity) | Out-Null
        $text = $title.ToString().Trim()
        
        if ($text.Length -gt 0 -and $text -notmatch "Windows PowerShell") {
            Write-Host "Closing: $text"
            [WinAPI]::SendMessage($hWnd, [WinAPI]::WM_CLOSE, [IntPtr]::Zero, [IntPtr]::Zero) | Out-Null
        }
    }
    return $true
}, [IntPtr]::Zero)
