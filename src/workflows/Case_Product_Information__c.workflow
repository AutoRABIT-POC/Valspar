<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>ConsQA_Notify_When_CPI_Not_Updated</fullName>
        <description>ConsQA Notify When CPI Not Updated</description>
        <protected>false</protected>
        <recipients>
            <recipient>Consumer_Quality_Group</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Quality_Group_Emails/CPI_Status_Not_Updated</template>
    </alerts>
    <fieldUpdates>
        <fullName>Assign_Quality_Mgr_to_CPI</fullName>
        <description>ConsQuality:  Assign Quality Manger to CPI when the Batch Check field is checked</description>
        <field>OwnerId</field>
        <lookupValue>jbrandt@valspar.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Assign Quality Mgr to CPI</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Date_Batch_Check_Set_to_Yes</fullName>
        <field>Date_Batch_Check_set_to_Yes__c</field>
        <formula>now()</formula>
        <name>Date Batch Check Set to Yes</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Date_CPI_Status_Set_to_Completed</fullName>
        <field>Date_CPI_Status_set_to_Completed__c</field>
        <formula>now()</formula>
        <name>Date CPI Status Set to Completed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>CPI Not Updated within Timeframe</fullName>
        <active>true</active>
        <booleanFilter>1 AND 2</booleanFilter>
        <criteriaItems>
            <field>Case_Product_Information__c.CPI_Status__c</field>
            <operation>notEqual</operation>
            <value>Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case_Product_Information__c.Batch_Check__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <description>CPI Time Based WF to notify Quality Group if a CPI has not been touched in 7, 14 &amp; 30 days</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>ConsQA_Notify_When_CPI_Not_Updated</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Case_Product_Information__c.LastModifiedDate</offsetFromField>
            <timeLength>30</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>ConsQA_Notify_When_CPI_Not_Updated</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Case_Product_Information__c.LastModifiedDate</offsetFromField>
            <timeLength>14</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <offsetFromField>Case_Product_Information__c.LastModifiedDate</offsetFromField>
            <timeLength>7</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Date Batch Check Set to Yes</fullName>
        <actions>
            <name>Date_Batch_Check_Set_to_Yes</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case_Product_Information__c.Batch_Check__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <description>Populates the fields with the date the Batch Check field is set to &apos;Yes&apos;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Date CPI Status Set to Completed</fullName>
        <actions>
            <name>Date_CPI_Status_Set_to_Completed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case_Product_Information__c.CPI_Status__c</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>NBPCC-Update Batch - Product Object</fullName>
        <actions>
            <name>Assign_Quality_Mgr_to_CPI</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case_Product_Information__c.Batch_Check__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <description>NEW:  May 2014 Change CPI Owner to Quality Mgr and do not send email
If the Batch Check check box on Product Information record is set to true for ALL Cases (NA &amp; EU)</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
