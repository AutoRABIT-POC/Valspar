<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Contract_Pricing_Alert</fullName>
        <description>Contract Pricing Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>Sales Rep</recipient>
            <type>accountTeam</type>
        </recipients>
        <recipients>
            <recipient>rhelms@valspar.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Trigger_Date_on_Contract_Pricing</template>
    </alerts>
    <fieldUpdates>
        <fullName>Remove_Approver</fullName>
        <field>Valspar_Approver__c</field>
        <name>Remove Approver</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Contract Pricing Alert</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Contract.Trigger_Date_of_Pricing__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Contract.Status</field>
            <operation>equals</operation>
            <value>Activated</value>
        </criteriaItems>
        <description>Sends an email alert based on the &apos;Trigger Date on Pricing&apos; date field.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Contract_Pricing_Alert</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Contract.Trigger_Date_of_Pricing__c</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
