<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_Task_Event_Status_Custom</fullName>
        <field>Event_Status__c</field>
        <literalValue>Completed</literalValue>
        <name>Update Task Event Status Custom</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Task_Subject</fullName>
        <field>Subject</field>
        <formula>TEXT(Activity_Type__c)</formula>
        <name>Update Task Subject</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Populate Task Subject</fullName>
        <actions>
            <name>Update_Task_Subject</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Task.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cons Masters Task</value>
        </criteriaItems>
        <description>Populates the Task subject field with the Activity_Type__C value for consumer BU.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Task Event Status</fullName>
        <actions>
            <name>Update_Task_Event_Status_Custom</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Task.Status</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <description>Updates the Event_Status__C custom field for reporting when a task is marked completed.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
