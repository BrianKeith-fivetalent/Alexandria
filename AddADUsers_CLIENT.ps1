$UserList = Import-Csv -Path 'C:\temp\ClientUserlist.csv' 

foreach ($User in $UserList) {

     $Attributes = @{

        Enabled = $true
        ChangePasswordAtLogon = $false
#        Path = "OU=Users,DC=corp,DC=FTSclientsTEST,DC=com"

        Name = "$($User.First) $($User.Last)"
        UserPrincipalName = "$($User.First).$($User.Last)@FTSclientsTEST.com"
        SamAccountName = "$($User.First).$($User.Last)"

        GivenName = $User.First
        Surname = $User.Last

        Company = $User.Company
        Department = $User.Department
        Title = $User.Title
        AccountPassword = "FTSPassword123" | ConvertTo-SecureString -AsPlainText -Force

     }

    New-ADUser @Attributes

}