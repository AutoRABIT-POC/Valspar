<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Email_Available_Field_Update</fullName>
        <field>Email_address_avaliable__c</field>
        <literalValue>Yes</literalValue>
        <name>Email Available Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inactive_Contact_Name_Change</fullName>
        <description>INC-328325 JDI NA GI Inactivate Functionality (Jenny Anselmo)</description>
        <field>LastName</field>
        <formula>IF(ISCHANGED(Active__c) &amp;&amp; Active__c = TRUE, 
   MID(LastName, 5, LEN(LastName) - 4),

   IF(ISCHANGED(Active__c) &amp;&amp; Active__c = FALSE,
    &quot;zzz-&quot;+LastName, LastName))</formula>
        <name>Inactive Contact Name Change</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Email Available</fullName>
        <actions>
            <name>Email_Available_Field_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>NOT(ISBLANK(Email))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inactivate Contact</fullName>
        <actions>
            <name>Inactive_Contact_Name_Change</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 OR 2) AND 3</booleanFilter>
        <criteriaItems>
            <field>Contact.Active__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Active__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Business_Unit__c</field>
            <operation>equals</operation>
            <value>General Industrial</value>
        </criteriaItems>
        <description>INC-328325 JDI NA GI Inactivate Functionality (Jenny Anselmo)</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
