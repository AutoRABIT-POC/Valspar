<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Populate_Event_Subject</fullName>
        <description>Populate&apos;s the Event Subject with the value in the Activity Type field.</description>
        <field>Subject</field>
        <formula>TEXT (Activity_Type__c)</formula>
        <name>Populate Event Subject</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Populate Event Subject</fullName>
        <actions>
            <name>Populate_Event_Subject</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Event.RecordTypeId</field>
            <operation>equals</operation>
            <value>ConsB&amp;Q,Cons Masters Event</value>
        </criteriaItems>
        <description>Populates the event subject with the value in the Activity Type field</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
