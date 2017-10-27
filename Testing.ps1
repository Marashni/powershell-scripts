for ($i = 0; $i -lt ($stupidarray.Count); $i++) 
{
  if((get-wmiobject -namespace root\CIMv2\Security\MicrosoftVolumeEncryption -class Win32_EncryptableVolume -filter "DriveLetter = `"$stupidarray.IndexOf($i)`"").ProtectionStatus -eq 1) 
    {
      write-output "bananas"
     } 
   else 
   {
   write-output "pears"
   }
}
