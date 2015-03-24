<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>CVSMBClosed_Won_Opportunity</fullName>
        <description>CVSMB Closed Won Opportunity</description>
        <protected>false</protected>
        <recipients>
            <field>Business_Owner__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>VSB_Templates/CVSMBStageAlertClosedWon</template>
    </alerts>
    <alerts>
        <fullName>CVSMBOpportunity_Closed_Lost</fullName>
        <description>CVSMB Opportunity Closed Lost</description>
        <protected>false</protected>
        <recipients>
            <field>Business_Owner__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>VSB_Templates/CVSMBStageAlertClosedLost</template>
    </alerts>
    <alerts>
        <fullName>Email_Alert_o_Jack_Bostock_for_GI_Director_Request</fullName>
        <description>Email Alert to Jack Bostock for GI Director Request</description>
        <protected>false</protected>
        <recipients>
            <recipient>tlorbiecki@valspar.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/GI_Director_Request</template>
    </alerts>
    <alerts>
        <fullName>Email_Alert_to_the_Manager_for_Approval_Request</fullName>
        <description>Email Alert to the Manager to Review Opportunity and Request Director Approval</description>
        <protected>false</protected>
        <recipients>
            <field>Delegated_Approver__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Manager_Review_Request</template>
    </alerts>
    <alerts>
        <fullName>Email_Alert_to_the_Manager_for_Approval_Request2</fullName>
        <description>Email Alert to the Manager for Approval Request</description>
        <protected>false</protected>
        <recipients>
            <field>Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Approval_Request</template>
    </alerts>
    <alerts>
        <fullName>Email_Alert_to_the_Manager_for_LWR_Approval2</fullName>
        <description>Email Alert to the Manager for LWR Approval</description>
        <protected>false</protected>
        <recipients>
            <field>Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_LWR_Approval_Request</template>
    </alerts>
    <alerts>
        <fullName>Email_Alert_to_the_Manager_for_Request_Approval_to_Sell</fullName>
        <description>Email Alert to the Manager for Request Approval to Sell</description>
        <protected>false</protected>
        <recipients>
            <field>Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Request_to_Sell_Approval_Request</template>
    </alerts>
    <alerts>
        <fullName>Email_Alert_to_the_Manager_when_Request_Approval_field_is_Checked</fullName>
        <description>Email Alert to the Manager when Request Approval field is Checked</description>
        <protected>false</protected>
        <recipients>
            <field>Delegated_Approver__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Approval_Request</template>
    </alerts>
    <alerts>
        <fullName>Email_Alert_to_the_Opportunity_Owner_Approval_Request_Accepted</fullName>
        <description>Email Alert to the Opportunity Owner Approval Request Accepted</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <field>Business_Owner__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Approved_Notification</template>
    </alerts>
    <alerts>
        <fullName>Email_Alert_to_the_Opportunity_Owner_Approval_Request_Accepted2</fullName>
        <description>Email Alert to the Opportunity Owner Approval Request Accepted2</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Approved_Notification</template>
    </alerts>
    <alerts>
        <fullName>Email_Alert_to_the_Opportunity_Owner_When_the_Request_to_Sell_is_Approved</fullName>
        <description>Email Alert to the Opportunity Owner When the Request to Sell is Approved</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Request_to_Sell_By_is_Approved</template>
    </alerts>
    <alerts>
        <fullName>Email_Alert_to_the_Record_Owner_when_the_Approved_Date_is_populated</fullName>
        <description>Email Alert to the Record Owner when the Approved Date is populated</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Approved_Notification</template>
    </alerts>
    <alerts>
        <fullName>Email_Alert_to_the_Record_Owner_when_the_LWR_Approved_By_Field_is_populated</fullName>
        <description>Email Alert to the Record Owner when the LWR Approved By Field  is populated</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Approved_Notification</template>
    </alerts>
    <alerts>
        <fullName>Email_Alert_to_the_Record_Owner_when_the_Rejected_By_is_populated</fullName>
        <description>Email Alert to the Record Owner when the Rejected Date  is populated</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Rejected_Notification</template>
    </alerts>
    <alerts>
        <fullName>Email_alert_to_Manager</fullName>
        <description>Email alert to Manager</description>
        <protected>false</protected>
        <recipients>
            <field>Business_Owner__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>VSB_Templates/CVSMBCloseDateAlertCloseDateIsPast</template>
    </alerts>
    <alerts>
        <fullName>Notfiy_Approvers_of_new_Opportunity_to_approve</fullName>
        <description>Notfiy Approvers of new Opportunity to approve</description>
        <protected>false</protected>
        <recipients>
            <field>Delegated_Approver__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Approval_Request</template>
    </alerts>
    <alerts>
        <fullName>StageAlertProspectingOver3Days</fullName>
        <description>Stage Alert - Prospecting Over 3 Days</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>VSB_Templates/vsbStageAlertProspectingOver3Days</template>
    </alerts>
    <alerts>
        <fullName>UpdateCloseDate</fullName>
        <description>Update Close Date</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>VSB_Templates/CVSMBCloseDateAlertCloseDateIsPast</template>
    </alerts>
    <alerts>
        <fullName>Update_Close_Date</fullName>
        <description>Update Close Date</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>VSB_Templates/CVSMBCloseDateAlertCloseDateIsPast</template>
    </alerts>
    <alerts>
        <fullName>Update_Close_Date_02</fullName>
        <description>Update Close Date</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>VSB_Templates/CVSMBCloseDateAlertCloseDateIsPast</template>
    </alerts>
    <alerts>
        <fullName>Update_Close_Date_2</fullName>
        <description>Update Close Date 2</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>VSB_Templates/CVSMBCloseDateAlertCloseDateIsPast</template>
    </alerts>
    <fieldUpdates>
        <fullName>Approval_Date</fullName>
        <field>Approved_Date__c</field>
        <formula>TODAY ()</formula>
        <name>Approved Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calendar</fullName>
        <field>Approved_Date__c</field>
        <name>Calendar</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Closed_Lost_will_update_Closed_Date</fullName>
        <field>CloseDate</field>
        <formula>Today ()</formula>
        <name>Closed Lost will update Closed Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Date_Submitted_to_Director</fullName>
        <description>Sets the Date Submitted to Director to today&apos;s date.</description>
        <field>Date_Submiitted_to_Director__c</field>
        <formula>NOW()</formula>
        <name>Date Submitted to Director</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Date_Submitted_to_Manager</fullName>
        <description>Sets the Date Submitted to Manager field to today&apos;s date.</description>
        <field>Date_Submitted_to_Manager__c</field>
        <formula>NOW()</formula>
        <name>Date Submitted to Manager</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Product_Date</fullName>
        <field>Product_Approval_Date__c</field>
        <formula>TODAY ()</formula>
        <name>Product Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Uncheck_Request_Director_Approval</fullName>
        <description>Uncheck the Request Director Approval field</description>
        <field>Request_Director_Approval__c</field>
        <literalValue>0</literalValue>
        <name>Uncheck Request Director Approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Uncheck_Request_Manager_Review</fullName>
        <description>Uncheck the Request Manager Review field</description>
        <field>Request_Manager_Review__c</field>
        <literalValue>0</literalValue>
        <name>Uncheck Request Manager Review</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Approved_By_Date</fullName>
        <field>Approved_Date__c</field>
        <formula>TODAY ()</formula>
        <name>Update Approved By Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Opportunity_Amount_Field</fullName>
        <description>Updates the standard opportunity Amount field with the value in the Annual Expected Revenue field.</description>
        <field>Amount</field>
        <formula>Annual_Expected_Revenue__c</formula>
        <name>Update Opportunity Amount Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>lwr_Approval_Date</fullName>
        <field>LWR_Approval_Date__c</field>
        <formula>TODAY()</formula>
        <name>LWR Approval Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Approval Request Alert to Manager</fullName>
        <actions>
            <name>Email_Alert_to_the_Manager_for_Approval_Request2</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Approval_Request__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>When the Approval Request field is checked, an email is sent to the manager for approval.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Approved Date</fullName>
        <actions>
            <name>Approval_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Approved_By2__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>When the Approved by field is populated by a manager, autopopulate the  Approved Date field.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Approved Date2</fullName>
        <actions>
            <name>Update_Approved_By_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Approved_By__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>When the Approvedby2 field is populated by a manager, autopopulate the  Approved Date field.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Approved to Sell By</fullName>
        <actions>
            <name>Email_Alert_to_the_Opportunity_Owner_When_the_Request_to_Sell_is_Approved</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Approved_to_Sell_By__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>When the Approved to Sell By field has been populated,an email notification is sent to the Opportunity Owner.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CVSMB Stage Alert - Closed Won</fullName>
        <actions>
            <name>CVSMBClosed_Won_Opportunity</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed/Won</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CVSMB Update Open Opp Close Date</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>notEqual</operation>
            <value>Closed/Won,Closed/Lost</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Update_Close_Date_02</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Opportunity.CloseDate</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>CVSMBStage Alert - Closed Lost</fullName>
        <actions>
            <name>CVSMBOpportunity_Closed_Lost</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed/Lost</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Closed Lost Will update to Todays Date</fullName>
        <actions>
            <name>Closed_Lost_will_update_Closed_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed/Lost</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Date Submitted to Director</fullName>
        <actions>
            <name>Date_Submitted_to_Director</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Request_Director_Approval__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Populates the Date Submitted to Manager field when the Request Director Approval checkbox is set to true (requested by GI)</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Date Submitted to Manager</fullName>
        <actions>
            <name>Date_Submitted_to_Manager</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Request_Manager_Review__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Populates the Date Submitted to Manager field when the Request Manager Review field is populated (requested by GI)</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LWR Approval Alert to Manager</fullName>
        <actions>
            <name>Email_Alert_to_the_Manager_for_LWR_Approval2</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1</booleanFilter>
        <criteriaItems>
            <field>Opportunity.LWR_Approval__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>When the LWR Approval field is checked, an email is sent to the manager for approval.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LWR Approved By Request is Accepted Alert</fullName>
        <actions>
            <name>Email_Alert_to_the_Record_Owner_when_the_LWR_Approved_By_Field_is_populated</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1</booleanFilter>
        <criteriaItems>
            <field>Opportunity.LWR_Approved_By__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Will send an email to the Opportunity  Owner when LWR Approved By is not blank.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LWR Approved Date</fullName>
        <actions>
            <name>lwr_Approval_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.LWR_Approved_By__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>When the LWR Approved By field is populated by a manager, autopopulate the LWR Approved Date field.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Manager Request Approval Alert</fullName>
        <actions>
            <name>Email_Alert_to_the_Manager_when_Request_Approval_field_is_Checked</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Request_Approval__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>When the Approval Request field is checked, an email is sent to the manager for approval.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Approval Request</fullName>
        <actions>
            <name>Email_Alert_to_the_Opportunity_Owner_Approval_Request_Accepted</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Approved_By2__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>When the Approvied_By2__c field is populated, the approved by field used with the Develop stage of an opportunity, an email is sent to the opportunity owner.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Approval Request2</fullName>
        <actions>
            <name>Email_Alert_to_the_Opportunity_Owner_Approval_Request_Accepted2</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Approved_By__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>When the Approved By field is populated, i.e.the opportunity is approved, an email is sent to the Opportunity Owner</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Rejected</fullName>
        <actions>
            <name>Uncheck_Request_Director_Approval</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Uncheck_Request_Manager_Review</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Rejected_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>When an opportunity is rejected, the &apos;Request Manager Review&apos; and Request Director Approval&apos; checkboxes are unchecked</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Product Approved Date</fullName>
        <actions>
            <name>Product_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Product_Approved_By__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>When the Product Approved By field is populated,  autopopulate the  Product Approved Date field.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Rejected Opportunity Alert</fullName>
        <actions>
            <name>Email_Alert_to_the_Record_Owner_when_the_Rejected_By_is_populated</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Rejected_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Will send an email to the Opp Owner when Rejected Date is entered or updated</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Request Approval to Sell</fullName>
        <actions>
            <name>Email_Alert_to_the_Manager_for_Request_Approval_to_Sell</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Request_Approval_to_Sell__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>When the Request Approval to Sell checkbox is checked, an email alert is send to the opportunity owners manager for approval.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Request Director Approval</fullName>
        <actions>
            <name>Email_Alert_o_Jack_Bostock_for_GI_Director_Request</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Request_Director_Approval__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>When the request director approval box is checked, send an email alert to Jack Bostack to alert him to approve the opportunity.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Request Manager Review alert to Manager</fullName>
        <actions>
            <name>Email_Alert_to_the_Manager_for_Approval_Request</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Request_Manager_Review__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>When the Request Manager Review field is checked, an email is sent to the manager for approval.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Open Opp Close Date Manager</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>notEqual</operation>
            <value>Closed/Won,Closed/Lost</value>
        </criteriaItems>
        <description>Email sent to Manager after 7 days</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Email_alert_to_Manager</name>
                <type>Alert</type>
            </actions>
            <timeLength>7</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Update Opportunity Amount Field</fullName>
        <actions>
            <name>Update_Opportunity_Amount_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Annual_Expected_Revenue__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Updates the standard opportunity Amount field with the value in the Annual Expected Revenue field</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <tasks>
        <fullName>PrivateQualificationCallDay1</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Private Qualification Call Day 1</subject>
    </tasks>
</Workflow>
