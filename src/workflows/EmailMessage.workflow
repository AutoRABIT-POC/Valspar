<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Upate_Case_Status_to_Consumer_Responded</fullName>
        <field>Status</field>
        <literalValue>Customer Responded</literalValue>
        <name>Upate Case Status to Consumer Responded</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>ParentId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Case_Last_Modified</fullName>
        <field>Custom_Last_Modified_Date_Time__c</field>
        <formula>NOW()</formula>
        <name>Update Case Last Modified</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>ParentId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Case_Status_to_Waiting_on_Agent</fullName>
        <field>Status</field>
        <literalValue>Waiting on Agent/Associate</literalValue>
        <name>Update Case Status to Waiting on Agent</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>ParentId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_New_Email_Received</fullName>
        <description>Sets the New Email received Checkbox to true on a case to enable an out of office email to be sent to the case contact.</description>
        <field>New_Email_Received__c</field>
        <literalValue>1</literalValue>
        <name>Update New Email Received</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>ParentId</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>Enable Case Out of Office Response</fullName>
        <actions>
            <name>Update_New_Email_Received</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Rule which eveluates if the case owner is out of the office upon receipt of incoming email message, if so it sets a flag on the case so that an email can be sent to the case contact via a second workflow, Send Email to Case Contact when Agent Out of Offic</description>
        <formula>(Incoming = TRUE)  &amp;&amp; (Parent.Owner:User.Out_Of_Office_Until__c &gt; NOW())</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Case Last Modified</fullName>
        <actions>
            <name>Update_Case_Last_Modified</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>EmailMessage.Incoming</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>EmailMessage.Incoming</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>Populate Case.Custom Last Modified Date Time field when an email is sent or received</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Case Status  - Consumer Email Received</fullName>
        <actions>
            <name>Update_Case_Status_to_Waiting_on_Agent</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>EmailMessage.Incoming</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Complaint Case,Information Case</value>
        </criteriaItems>
        <description>For the North American Call Center, updates the Case Status to &apos;Waiting on Agent/Associate&apos; when a incoming email message is received from a consumer related to an open case.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update Case Status EU - Consumer Email Received</fullName>
        <actions>
            <name>Upate_Case_Status_to_Consumer_Responded</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>EmailMessage.Incoming</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Complaint Case EU,Information Case EU</value>
        </criteriaItems>
        <description>For the EU Call Center, updates the Case Status to &apos;Customer Responded&apos; when a incoming email message is received from a consumer related to an open case.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
