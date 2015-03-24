<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Email_Alert_to_the_Manager_to_Convert_a_Lead_to_an_Opportunity</fullName>
        <description>Email Alert to the Manager to Convert a Lead to an Opportunity</description>
        <protected>false</protected>
        <recipients>
            <field>Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Manager_Request_to_Convert_Lead</template>
    </alerts>
    <alerts>
        <fullName>Email_New_Campaign_Lead</fullName>
        <description>Email New Campaign Lead</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <field>Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_Campaign_Lead_Notification_Email_Template</template>
    </alerts>
    <alerts>
        <fullName>Lead_In_Pending_for_7_Days1</fullName>
        <description>Lead In Pending for 7 Days</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>VSB_Templates/CVSMBStageAlertPendingOver7Days</template>
    </alerts>
    <alerts>
        <fullName>Lead_in_Pending_or_3_Days</fullName>
        <description>Lead in Pending or 3 Days</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>VSB_Templates/vsbStageAlertProspectingOver3Days</template>
    </alerts>
    <rules>
        <fullName>CVSMB Lead Alert - Pending</fullName>
        <actions>
            <name>Lead_In_Pending_for_7_Days1</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Lead_in_Pending_or_3_Days</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>equals</operation>
            <value>Pending</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Campaign Lead Notification</fullName>
        <actions>
            <name>Email_New_Campaign_Lead</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.CreatedDate</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Description</field>
            <operation>startsWith</operation>
            <value>Campaign:</value>
        </criteriaItems>
        <description>Notifies lead owner and manager of a new lead created that is attached to a campaign</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Request Manager to Convert Lead to Opportunity</fullName>
        <actions>
            <name>Email_Alert_to_the_Manager_to_Convert_a_Lead_to_an_Opportunity</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Manager_Request_to_Convert__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>When a sales rep wants to convert a lead they click this box to trigger an email which goes to their manager telling them they need to convert the lead.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
