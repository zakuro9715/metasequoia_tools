$ext = "mqo"  # メタセコイアファイルの拡張子
$output = "."  # 出力フォルダ

$mode = "obj" # 出力ファイルの種類


$absoluteOutputPath = Resolve-Path $output
$items = Get-ChildItem -Recurse -Name -Filter "*.${ext}"

foreach($item in $items)
{
 
  $dest = Join-Path $absoluteOutputPath ([System.IO.Path]::GetFileNameWithoutExtension($item))
  Invoke-Item $item
  Start-Sleep -s 1
  [System.Windows.Forms.SendKeys]::SendWait("%f")  # ファイル
  [System.Windows.Forms.SendKeys]::SendWait("%a")  # 名前をつけて保存
  [System.Windows.Forms.SendKeys]::SendWait($dest) # ファイルパス入力
  [System.Windows.Forms.SendKeys]::SendWait("{TAB}") # 「ファイルの種類」に移動
  
  [System.Windows.Forms.SendKeys]::SendWait("w") # 選択項目移動(obj)
  [System.Windows.Forms.SendKeys]::SendWait("%s") # 保存 
  [System.Windows.Forms.SendKeys]::SendWait("%y") # 上書き yes
  [System.Windows.Forms.SendKeys]::SendWait("{ENTER}") # OK
  [System.Windows.Forms.SendKeys]::SendWait("%f")  # ファイル
  [System.Windows.Forms.SendKeys]::SendWait("%x")  # 閉じる
}