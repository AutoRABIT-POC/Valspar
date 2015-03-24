<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>New_Paint_Trial</fullName>
        <description>New Campaign Lead Email Alert</description>
        <protected>false</protected>
        <recipients>
            <type>campaignMemberDerivedOwner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Paint_Trial_Notification</template>
    </alerts>
    <rules>
        <fullName>New Campaign Lead Email Notification</fullName>
        <actions>
            <name>New_Paint_Trial</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Business_Unit__c</field>
            <operation>equals</operation>
            <value>Consumer Lowes</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.CreatedDate</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <description>Notifies owner of a new lead that&apos;s uploaded as part of a campaign</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
