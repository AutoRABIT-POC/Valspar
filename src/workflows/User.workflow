<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>New_Packaging_User</fullName>
        <description>New Packaging User</description>
        <protected>false</protected>
        <recipients>
            <recipient>kconley@valspar.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>lchurchwell@valspar.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>yves.guiraud@valspareurope.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_Packaging_User</template>
    </alerts>
    <rules>
        <fullName>New Packaging User</fullName>
        <actions>
            <name>New_Packaging_User</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>User.Business_Unit__c</field>
            <operation>equals</operation>
            <value>Packaging</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.IsActive</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>An email will be sent to Larry Churchwell, Kelley Conley and Michael Opieczonek when a new user within the Packaging business unit is added in Salesforce.com</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
