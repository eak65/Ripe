<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="Ripe.Azure" generation="1" functional="0" release="0" Id="3f5f3c54-1e47-43f7-9c10-1c249112c116" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="Ripe.AzureGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="Ripe:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/Ripe.Azure/Ripe.AzureGroup/LB:Ripe:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="Ripe:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/Ripe.Azure/Ripe.AzureGroup/MapRipe:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="RipeInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/Ripe.Azure/Ripe.AzureGroup/MapRipeInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:Ripe:Endpoint1">
          <toPorts>
            <inPortMoniker name="/Ripe.Azure/Ripe.AzureGroup/Ripe/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapRipe:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/Ripe.Azure/Ripe.AzureGroup/Ripe/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapRipeInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/Ripe.Azure/Ripe.AzureGroup/RipeInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="Ripe" generation="1" functional="0" release="0" software="C:\Users\Ethan\Documents\Visual Studio 2013\Projects\Ripe\Ripe.Azure\csx\Release\roles\Ripe" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="1792" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;Ripe&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;Ripe&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/Ripe.Azure/Ripe.AzureGroup/RipeInstances" />
            <sCSPolicyUpdateDomainMoniker name="/Ripe.Azure/Ripe.AzureGroup/RipeUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/Ripe.Azure/Ripe.AzureGroup/RipeFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="RipeUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="RipeFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="RipeInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="80822089-f2c5-4ac3-a3fe-e50c284a5a3b" ref="Microsoft.RedDog.Contract\ServiceContract\Ripe.AzureContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="121e5b0c-632b-4507-9cbf-b05618cbcd33" ref="Microsoft.RedDog.Contract\Interface\Ripe:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/Ripe.Azure/Ripe.AzureGroup/Ripe:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>