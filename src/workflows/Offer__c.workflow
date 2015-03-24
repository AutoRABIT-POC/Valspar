<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_Offer_Date</fullName>
        <field>Offer_Date__c</field>
        <formula>TODAY()</formula>
        <name>Update Offer Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>NBPCC-Update Offer Date</fullName>
        <actions>
            <name>Update_Offer_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Offer__c.Offer_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update Case Last Modified from Offer</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Offer__c.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Populate Case.Custom Last Modified Date Time field when an offer is added</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
