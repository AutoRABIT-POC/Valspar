<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Case_Classification_Notification</fullName>
        <description>Case Classification Notification</description>
        <protected>false</protected>
        <recipients>
            <recipient>Director</recipient>
            <type>caseTeam</type>
        </recipients>
        <recipients>
            <recipient>EU Manager</recipient>
            <type>caseTeam</type>
        </recipients>
        <recipients>
            <recipient>Manager</recipient>
            <type>caseTeam</type>
        </recipients>
        <recipients>
            <recipient>Supervisor</recipient>
            <type>caseTeam</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cases/NBPCC_Case_Classification_Notification</template>
    </alerts>
    <alerts>
        <fullName>Case_Owner_Notification_when_CPI_is_completed</fullName>
        <description>Case Owner Notification when CPI is completed</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Quality_Group_Emails/Notify_Case_Owner_when_CPI_Complete</template>
    </alerts>
    <alerts>
        <fullName>Email_Alert_Case_Open_14_days</fullName>
        <description>Email Alert:  Case Open &gt; 14 days</description>
        <protected>false</protected>
        <recipients>
            <recipient>EU Manager</recipient>
            <type>caseTeam</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cases/Case_Open_14_days</template>
    </alerts>
    <alerts>
        <fullName>Email_Case_Owner_when_Case_is_Approved</fullName>
        <description>Email Case &amp; Account Owner when Case is Approved</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <recipient>GI_Rush_Approved</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GI_Customer_Service/Case_Approved</template>
    </alerts>
    <alerts>
        <fullName>Email_Case_Owner_when_Case_is_Rejected</fullName>
        <description>Email Case Owner when Case is Rejected</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>kstendahl@valspar.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ljacobson@valspar.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GI_Customer_Service/Case_Rejected</template>
    </alerts>
    <alerts>
        <fullName>Email_alert_if_Label_or_PDS_is_not_available</fullName>
        <description>Email alert if Label or PDS is not available</description>
        <protected>false</protected>
        <recipients>
            <recipient>EU Manager</recipient>
            <type>caseTeam</type>
        </recipients>
        <recipients>
            <recipient>Supervisor</recipient>
            <type>caseTeam</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cases/Label_PDS_not_available</template>
    </alerts>
    <alerts>
        <fullName>Email_alert_on_Sales_Lead_inquiry</fullName>
        <description>Email alert on Sales/Lead inquiry</description>
        <protected>false</protected>
        <recipients>
            <recipient>Director</recipient>
            <type>caseTeam</type>
        </recipients>
        <recipients>
            <recipient>EU Manager</recipient>
            <type>caseTeam</type>
        </recipients>
        <recipients>
            <recipient>Manager</recipient>
            <type>caseTeam</type>
        </recipients>
        <recipients>
            <recipient>Supervisor</recipient>
            <type>caseTeam</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cases/NBPCC_Sales_Lead_Call_Notification</template>
    </alerts>
    <alerts>
        <fullName>GI_Toll_Producer_Shipping_Expedite_Notice</fullName>
        <description>GI Toll Producer Shipping Expedite Notice</description>
        <protected>false</protected>
        <recipients>
            <recipient>GI_Toll_Shipping</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GI_Customer_Service/GI_Expedited_Freight_Notification_to_Shipping</template>
    </alerts>
    <alerts>
        <fullName>NBPCC_Case_Classification_on_new_record</fullName>
        <description>NBPCC Case Classification on new record</description>
        <protected>false</protected>
        <recipients>
            <recipient>Director</recipient>
            <type>caseTeam</type>
        </recipients>
        <recipients>
            <recipient>EU Manager</recipient>
            <type>caseTeam</type>
        </recipients>
        <recipients>
            <recipient>Manager</recipient>
            <type>caseTeam</type>
        </recipients>
        <recipients>
            <recipient>Supervisor</recipient>
            <type>caseTeam</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cases/NBPCC_Case_Classification_Notification</template>
    </alerts>
    <alerts>
        <fullName>NBPCC_Email_Notification_of_Tint_Formula_Issue</fullName>
        <description>NBPCC: Email Notification of Tint Formula Issue</description>
        <protected>false</protected>
        <recipients>
            <recipient>CS ValTrack Entry NA</recipient>
            <type>caseTeam</type>
        </recipients>
        <recipients>
            <recipient>EU Manager</recipient>
            <type>caseTeam</type>
        </recipients>
        <recipients>
            <recipient>Manager</recipient>
            <type>caseTeam</type>
        </recipients>
        <recipients>
            <recipient>Supervisor</recipient>
            <type>caseTeam</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cases/NBPCC_Email_Notification_of_Tint_Formula_Issue</template>
    </alerts>
    <alerts>
        <fullName>Onsite_Inspection_Notification</fullName>
        <description>Onsite Inspection Notification</description>
        <protected>false</protected>
        <recipients>
            <field>Additional_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Store_Purchased_Account_Owner_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Regional_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cases/NBPCC_Oniste_Inspection_Request</template>
    </alerts>
    <alerts>
        <fullName>Send_Email_notification_if_Reason_Opened_is_HSE</fullName>
        <description>Send Email notification if Reason Opened is HSE</description>
        <protected>false</protected>
        <recipients>
            <recipient>Director</recipient>
            <type>caseTeam</type>
        </recipients>
        <recipients>
            <recipient>EU Manager</recipient>
            <type>caseTeam</type>
        </recipients>
        <recipients>
            <recipient>Manager</recipient>
            <type>caseTeam</type>
        </recipients>
        <recipients>
            <recipient>Supervisor</recipient>
            <type>caseTeam</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cases/NBPCC_Case_Reason_Opened_is_HSE</template>
    </alerts>
    <alerts>
        <fullName>Send_Email_to_Case_Contact_Rep_when_NETSUIT_Case_is_Closed</fullName>
        <description>Send Email to Case Contact (Rep) when NETSUIT Case is Closed</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cases/Case_Closed_to_NetSuite_Contact_Rep</template>
    </alerts>
    <alerts>
        <fullName>Send_Email_to_Case_Supervisors_when_an_Agent_is_Out_of_Office_and_an_email_is_re</fullName>
        <description>Send Email to Case Supervisors when an Agent is Out of Office and an email is received</description>
        <protected>false</protected>
        <recipients>
            <recipient>EU Manager</recipient>
            <type>caseTeam</type>
        </recipients>
        <recipients>
            <recipient>Supervisor</recipient>
            <type>caseTeam</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cases/Case_Out_of_Office_Supervisor_Notification</template>
    </alerts>
    <alerts>
        <fullName>Send_email_if_no_activity_on_open_case_for_more_than_3_days</fullName>
        <description>Send email if no activity on open case for more than 3 days</description>
        <protected>false</protected>
        <recipients>
            <recipient>EU Manager</recipient>
            <type>caseTeam</type>
        </recipients>
        <recipients>
            <recipient>Supervisor</recipient>
            <type>caseTeam</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cases/No_activity_on_open_case_for_3_days</template>
    </alerts>
    <alerts>
        <fullName>Send_email_to_Case_Contact_if_Agent_is_Out_of_Office</fullName>
        <description>Send Email to Case Contact if Agent is Out of Office</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cases/Case_Out_of_Office_Response</template>
    </alerts>
    <alerts>
        <fullName>Send_survey_when_a_Case_is_Closed_NOT_Phone</fullName>
        <description>Send survey when a Case is Closed NOT Phone</description>
        <protected>false</protected>
        <recipients>
            <field>ContactId</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SURVEY_EAT_a1QE0000000ABxTMAW</template>
    </alerts>
    <alerts>
        <fullName>Send_survey_when_a_Case_is_Closed_Phone</fullName>
        <description>Send survey when a Case is Closed Phone</description>
        <protected>false</protected>
        <recipients>
            <field>ContactId</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SURVEY_EAT_a1QE0000000ABxOMAW</template>
    </alerts>
    <alerts>
        <fullName>Send_survey_when_an_EU_Case_is_Closed</fullName>
        <description>Send survey when an EU Case is Closed</description>
        <protected>false</protected>
        <recipients>
            <field>ContactId</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/EUCC_Close_Case_Send_Survey_with_Letterhead</template>
    </alerts>
    <alerts>
        <fullName>X110_Garland_Shipping_Expedite_Notice</fullName>
        <description>110 Garland Shipping Expedite Notice</description>
        <protected>false</protected>
        <recipients>
            <recipient>GI_110_Garland_Shipping</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GI_Customer_Service/GI_Expedited_Freight_Notification_to_Shipping</template>
    </alerts>
    <alerts>
        <fullName>X360_Covington_Shipping_Expedite_Notice</fullName>
        <description>360 Covington Shipping Expedite Notice</description>
        <protected>false</protected>
        <recipients>
            <recipient>GI_360_Covington_Shipping</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GI_Customer_Service/GI_Expedited_Freight_Notification_to_Shipping</template>
    </alerts>
    <alerts>
        <fullName>X720_Moline_Shipping_Expedite_Notice</fullName>
        <description>720 Moline Shipping Expedite Notice</description>
        <protected>false</protected>
        <recipients>
            <recipient>GI_720_Moline_Shipping</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GI_Customer_Service/GI_Expedited_Freight_Notification_to_Shipping</template>
    </alerts>
    <alerts>
        <fullName>X960_Charlotte_Shipping_Expedite_Notice</fullName>
        <description>960 Charlotte Shipping Expedite Notice</description>
        <protected>false</protected>
        <recipients>
            <recipient>GI_960_Charlotte_Shipping</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GI_Customer_Service/GI_Expedited_Freight_Notification_to_Shipping</template>
    </alerts>
    <fieldUpdates>
        <fullName>Add_to_Case_Modified_Count</fullName>
        <description>Adds +1 to Modified Count</description>
        <field>Modified_Count__c</field>
        <formula>IF ( ISBLANK( Modified_Count__c ), 1, Modified_Count__c+1)</formula>
        <name>Add to Case Modified Count</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Approved_Status_Update</fullName>
        <description>Change 521836 GI Service Cloud change Case Status to Approved after final Scheduling/Shipping Approval</description>
        <field>Status</field>
        <literalValue>Approved</literalValue>
        <name>Case Approved Status Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Change_Owner_EUCC</fullName>
        <description>Sets the Case Owner to the EU Manager Queue</description>
        <field>OwnerId</field>
        <lookupValue>EU_Manager_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Case Change Owner - EUCC</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Status_to_Approval_Rejected</fullName>
        <description>Change 52183 GI Service Cloud update Case Status to Approval Rejected when rejected at any stage</description>
        <field>Status</field>
        <literalValue>Rejected</literalValue>
        <name>Case Status to Approval Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Status_to_Pending_Approval</fullName>
        <description>Change 521836 - GI Service Cloud</description>
        <field>Status</field>
        <literalValue>Pending Approval</literalValue>
        <name>Case Status to Pending Approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Status_to_Transferred_to_Shipping</fullName>
        <description>Change 521836 GI Service Cloud</description>
        <field>Status</field>
        <literalValue>Transferred to Shipping</literalValue>
        <name>Case Status to Transferred to Shipping</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Case_Owner</fullName>
        <field>OwnerId</field>
        <lookupValue>Supervisor</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Change Case Owner</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_Email_Field</fullName>
        <description>Resets the email checkbox to false when an email is sent to the contact</description>
        <field>New_Email_Received__c</field>
        <literalValue>0</literalValue>
        <name>Reset Email Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Store_Purchased_Account_Owner_Email_CASE</fullName>
        <description>Pulling in the Account Owners Email from the Store/Account added on the Case Record lookup field</description>
        <field>Store_Purchased_Account_Owner_Email__c</field>
        <formula>Store_Purchased__r.Owner.Email</formula>
        <name>Store Purchased Account Owner Email CASE</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>110 Garland Shipping Expedite Notice</fullName>
        <actions>
            <name>X110_Garland_Shipping_Expedite_Notice</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Transferred to Shipping</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Plant_Lead_Time__c</field>
            <operation>equals</operation>
            <value>110 Garland Ecoat 10 days</value>
        </criteriaItems>
        <description>Change 521836 GI Service Cloud</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>360 Covington Shipping Expedite Notice</fullName>
        <actions>
            <name>X360_Covington_Shipping_Expedite_Notice</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Transferred to Shipping</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Plant_Lead_Time__c</field>
            <operation>equals</operation>
            <value>360 Covington 20 days</value>
        </criteriaItems>
        <description>Change 521836 GI Service Cloud</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>720 Moline Shipping Expedite Notice</fullName>
        <actions>
            <name>X720_Moline_Shipping_Expedite_Notice</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Transferred to Shipping</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Plant_Lead_Time__c</field>
            <operation>equals</operation>
            <value>720 Moline Blends 4 days,720 Moline Grd/HSD 12 days</value>
        </criteriaItems>
        <description>Change 521836 GI Service Cloud</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>960 Charlotte Shipping Expedite Notice</fullName>
        <actions>
            <name>X960_Charlotte_Shipping_Expedite_Notice</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Transferred to Shipping</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Plant_Lead_Time__c</field>
            <operation>equals</operation>
            <value>960 Charlotte 20 days</value>
        </criteriaItems>
        <description>Change 521836 GI Service Cloud</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Add to Case Modified Count</fullName>
        <actions>
            <name>Add_to_Case_Modified_Count</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.LastModifiedById</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Add +1 everytime the last modified field is updated</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EUCC Close Case- Send Survey</fullName>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 3) AND 4 AND 5</booleanFilter>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Complaint Case EU</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Information Case EU</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Email</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Do_Not_Send_Timba_Survey__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>For EU information and complaint cases - Send survey when a case is closed</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Send_survey_when_an_EU_Case_is_Closed</name>
                <type>Alert</type>
            </actions>
            <timeLength>12</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>EUCC No activity on open case</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>Waiting on Consumer,Closed,Waiting on Other</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>contains</operation>
            <value>Case EU</value>
        </criteriaItems>
        <description>Send an email to the EU Manager if there&apos;s been no activity on a case for 3 days.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Send_email_if_no_activity_on_open_case_for_more_than_3_days</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Case.LastModifiedDate</offsetFromField>
            <timeLength>3</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>EUCC-Reassign Case to Queue-HR%2C Service</fullName>
        <actions>
            <name>Case_Change_Owner_EUCC</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Type</field>
            <operation>equals</operation>
            <value>HR,Service</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>contains</operation>
            <value>Case EU</value>
        </criteriaItems>
        <description>Reassigns Cases to EU Manager Queue when the Reason opened is one of these values:
HR, Service</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>GI Toll Producer Shipping Expedite Notice</fullName>
        <actions>
            <name>GI_Toll_Producer_Shipping_Expedite_Notice</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Transferred to Shipping</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Plant_Lead_Time__c</field>
            <operation>equals</operation>
            <value>D15 Americoats 20 days,D02 Trimite 20 days,D27 Benda Lutz 10 days,D28 Eckart 10 days</value>
        </criteriaItems>
        <description>Change 521836 GI Service Cloud</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>NBPCC Case Open %3E 14 days</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>Closed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Email_Alert_Case_Open_14_days</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Case.CreatedDate</offsetFromField>
            <timeLength>14</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>NBPCC Close Case- Send Survey Non Phone</fullName>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5</booleanFilter>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Information Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>notEqual</operation>
            <value>Phone</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Email</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Do_Not_Send_Timba_Survey__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>For information Cases - Send survey when a case is closed if Case Origin = is NOT equal to phone</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Send_survey_when_a_Case_is_Closed_NOT_Phone</name>
                <type>Alert</type>
            </actions>
            <timeLength>12</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>NBPCC Close Case- Send Survey PHONE</fullName>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5</booleanFilter>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Information Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Phone</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Email</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Do_Not_Send_Timba_Survey__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>For information Cases - Send survey when a case is closed if Case Origin = Phone</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Send_survey_when_a_Case_is_Closed_Phone</name>
                <type>Alert</type>
            </actions>
            <timeLength>12</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>NBPCC No activity on open case</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>Waiting on Consumer,Closed,Waiting on Other</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Send_email_if_no_activity_on_open_case_for_more_than_3_days</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Case.LastModifiedDate</offsetFromField>
            <timeLength>3</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>NBPCC PDS%2FLAbel not found</fullName>
        <actions>
            <name>Email_alert_if_Label_or_PDS_is_not_available</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>Case.Submit_TDS_Label_Request_to_Marketing__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Submit_MSDS_Request_to_Marketing__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>NBPCC Sales%2FLead Call received</fullName>
        <actions>
            <name>Email_alert_on_Sales_Lead_inquiry</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Type</field>
            <operation>equals</operation>
            <value>Sales / Lead</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>NBPCC-Case Classification</fullName>
        <actions>
            <name>Case_Classification_Notification</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>IF((All_Case_Classifications__c )&lt;&gt; (PRIORVALUE(All_Case_Classifications__c)),True,False)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>NBPCC-Case Classification %28New Record%29</fullName>
        <actions>
            <name>NBPCC_Case_Classification_on_new_record</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 or 2 or 3 or 4 or 5</booleanFilter>
        <criteriaItems>
            <field>Case.Legal__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Labor__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Executive__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Social_Media__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Personal_Injury__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>NBPCC-Onsite Inspection Requested</fullName>
        <actions>
            <name>Onsite_Inspection_Notification</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Onsite_Inspection_Followup</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Onsite_Inspection__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>NBPCC-Reason opened is HSE</fullName>
        <actions>
            <name>Send_Email_notification_if_Reason_Opened_is_HSE</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Reason_Opened__c</field>
            <operation>equals</operation>
            <value>HSE</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>NBPCC-Reassign Case to Queue-HR%2C Service</fullName>
        <actions>
            <name>Change_Case_Owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Type</field>
            <operation>equals</operation>
            <value>HR,Service</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>notContain</operation>
            <value>Case EU</value>
        </criteriaItems>
        <description>Reassigns Cases to Queue when the Reason opened is one of these values:
HR, Service</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>NBPCC-Reassign Escalated Case to Supervisor Queue</fullName>
        <actions>
            <name>Change_Case_Owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Escalated</value>
        </criteriaItems>
        <description>Reassigns Cases to Queue when the Case is escalated</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>NBPCC-Tint Formula Issue Complaint Notification</fullName>
        <actions>
            <name>NBPCC_Email_Notification_of_Tint_Formula_Issue</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Defect_Type__c</field>
            <operation>equals</operation>
            <value>Tint formula issue</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Type</field>
            <operation>equals</operation>
            <value>Product</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Opened__c</field>
            <operation>equals</operation>
            <value>Appearance</value>
        </criteriaItems>
        <description>• Type = Product 
• Reason Opened = Appearance 
• Defect Type = Tint Formula Issue</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Notify PaintDrop Contact %28Rep%29 When Case Closed</fullName>
        <actions>
            <name>Send_Email_to_Case_Contact_Rep_when_NETSUIT_Case_is_Closed</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>NetSuite</value>
        </criteriaItems>
        <description>Change 522349 - Notify the PaintDrop Contact - PaintDrop Rep when Case is closed for Cases transferred from NetSuite</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Quality Notify Case Owner when CPI Completed</fullName>
        <actions>
            <name>Case_Owner_Notification_when_CPI_is_completed</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Waiting on Agent/Associate</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Sub_Status_1__c</field>
            <operation>equals</operation>
            <value>Batch Check Completed,Color Check Completed</value>
        </criteriaItems>
        <description>Notify the Case Owner when the CPI has been completed and the Case Status changes to Waiting on Agent/Associate and Case Sub-Status1 = Batch or Color Check Completed</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Send Email to Case Contact when Agent Out of Office</fullName>
        <actions>
            <name>Send_Email_to_Case_Supervisors_when_an_Agent_is_Out_of_Office_and_an_email_is_re</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Reset_Email_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.New_Email_Received__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Rule to send an email to the Case Contact when the Case Agent (Owner) is out of the office</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Store Purchased Account Owner Email Update CASE</fullName>
        <actions>
            <name>Store_Purchased_Account_Owner_Email_CASE</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Store_Purchased_Account_Owner__c</field>
            <operation>notEqual</operation>
            <value>Null</value>
        </criteriaItems>
        <description>Updates the Store_Purchased_Account_Owner_Email field when Store Purchased field is populated.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <tasks>
        <fullName>Onsite_Inspection_Followup</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Onsite Inspection Followup</subject>
    </tasks>
</Workflow>
