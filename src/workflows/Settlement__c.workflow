<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>EUCC_Customer_Refund_Notify_Customer_Refund_has_been_Processed</fullName>
        <description>EUCC Customer Refund Notify Customer Refund has been Processed</description>
        <protected>false</protected>
        <recipients>
            <field>Case_Contact_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cases/EUCC_Customer_Refund_Notify_Customer_Refund_has_been_Processed</template>
    </alerts>
    <alerts>
        <fullName>EUCC_FOC_Settlement_Notify_Customer_Ready_for_Pickup</fullName>
        <description>EUCC FOC Settlement Notify Customer Ready for Pickup</description>
        <protected>false</protected>
        <recipients>
            <field>Case_Contact_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cases/EUCC_FOC_Settlement_Notify_Customer_Ready_for_Pickup</template>
    </alerts>
    <alerts>
        <fullName>EUCC_Valspar_Voucher_Notify_Customer_Vouchers_Sent</fullName>
        <description>EUCC Valspar Voucher Notify Customer Vouchers Sent</description>
        <protected>false</protected>
        <recipients>
            <field>Case_Contact_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cases/EUCC_Valspar_Voucher_Notify_Customer_Vouchers_Sent</template>
    </alerts>
    <alerts>
        <fullName>FOC_Settlement_Notification_to_VAC</fullName>
        <description>FOC Settlement Notification to VAC</description>
        <protected>false</protected>
        <recipients>
            <field>Store_Purchased_Account_Owner_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cases/FOC_Settlement_Processing_Request_to_VAC</template>
    </alerts>
    <alerts>
        <fullName>Lowe_s_RA_Settlement_Send_notification_to_TM_and_Consumer</fullName>
        <description>Lowe&apos;s RA Settlement- Send notification to TM and Consumer</description>
        <protected>false</protected>
        <recipients>
            <field>Additional_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Store_Purchased_Account_Owner_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cases/NBPCC_RA_Notification</template>
    </alerts>
    <alerts>
        <fullName>Send_notification_to_Case_Owner_when_a_Settlement_has_been_processed</fullName>
        <description>Send notification to Case Owner when a Settlement has been processed</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cases/Close_Case_Settlement_is_closed</template>
    </alerts>
    <alerts>
        <fullName>Send_notification_to_Order_Dept</fullName>
        <ccEmails>order@valspar.com</ccEmails>
        <description>Send notification to Order Dept</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Cases/NBPCC_Goodwill_Settlement</template>
    </alerts>
    <alerts>
        <fullName>Send_notification_when_a_Billing_Adjustment_is_rejected</fullName>
        <description>Send notification when a Billing Adjustment is rejected</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cases/NBPCC_Billing_Adjustment_Settlement_has_been_Rejected</template>
    </alerts>
    <alerts>
        <fullName>Send_notification_when_a_CR_is_rejected</fullName>
        <description>Send notification when a CR is rejected</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cases/NBPCC_Check_Request_has_been_Rejected</template>
    </alerts>
    <alerts>
        <fullName>Send_notification_when_a_Settlement_rejected</fullName>
        <description>Send notification when a Settlement is rejected</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cases/Settlement_Request_has_been_Rejected</template>
    </alerts>
    <alerts>
        <fullName>VAC_unable_to_process_a_VOC_Alert_to_Case_Owner</fullName>
        <description>VAC unable to process a VOC Alert to Case Owner</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cases/VAC_unable_to_process_FOC_Settlement</template>
    </alerts>
    <fieldUpdates>
        <fullName>Change_Status_to_Rejected</fullName>
        <field>Settlement_Status__c</field>
        <literalValue>Settlement Rejected</literalValue>
        <name>Change Status to Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_status_to_Closed</fullName>
        <description>Update Settlement Status to Closed</description>
        <field>Settlement_Status__c</field>
        <literalValue>Closed</literalValue>
        <name>Change status to Closed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EU_Finance_Processing_Status_Change</fullName>
        <description>B&amp;Q: Change Settlement Status to EU Finance processing</description>
        <field>Settlement_Status__c</field>
        <literalValue>EU Finance Processing</literalValue>
        <name>EU Finance Processing Status Change</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Order_Dept_Processing</fullName>
        <field>Settlement_Status__c</field>
        <literalValue>Order Dept Processing</literalValue>
        <name>Order Dept Processing</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Pending_CSA_Completion_Status_Change</fullName>
        <description>B&amp;Q: Changes Settlement Status to Pending CSA Completion</description>
        <field>Settlement_Status__c</field>
        <literalValue>Pending CSA Completion</literalValue>
        <name>Pending CSA Completion Status Change</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Refund_Settlment_Bank_Account_No_Delete</fullName>
        <description>B&amp;Q: Delete the Customer Bank Account Number on a Refund Settlement once Witney Office has processed the Bank Funds.</description>
        <field>Account_Number_Customer_Bank__c</field>
        <name>Refund Settlment Bank Account No Delete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Refund_Settlment_Bank_Name_Delete</fullName>
        <description>B&amp;Q: Delete the Customer Bank Name on a Refund Settlement once Witney Office has processed the Bank Funds.</description>
        <field>Customer_Bank_Name__c</field>
        <name>Refund Settlment Bank Name Delete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Refund_Settlment_Bank_Sort_Code_Delete</fullName>
        <description>B&amp;Q: Delete the Customer Bank Sort Code on a Refund Settlement once Witney Office has processed the Bank Funds.</description>
        <field>Sort_or_Swift_Code__c</field>
        <name>Refund Settlment Bank Sort Code Delete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Refund_Settlment_IBAN_No_Delete</fullName>
        <description>B&amp;Q: Delete the Customer Bank IBAN Number on a Refund Settlement once Witney Office has processed the Bank Funds</description>
        <field>IBAN_Number_Customer_Bank__c</field>
        <name>Refund Settlment IBAN No Delete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Store_Purchased_Account_Owner_Email_SLMT</fullName>
        <description>Update the Store Purchased Account Owner Email on the Settlement Object</description>
        <field>Store_Purchased_Account_Owner_Email__c</field>
        <formula>Store_Purchased__r.Owner.Email</formula>
        <name>Store Purchased Account Owner Email SLMT</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Case_Contact_Email</fullName>
        <description>Populates the Case Contact Email associated to the Settlement so it can be used for Email Alerts</description>
        <field>Case_Contact_Email__c</field>
        <formula>Case_Name__r.Contact.Email</formula>
        <name>Update Case Contact Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Case_Last_Mod_from_Settlement</fullName>
        <description>Updates the Case.Custom Last Modified Date Time field with the current date/time</description>
        <field>Custom_Last_Modified_Date_Time__c</field>
        <formula>NOW()</formula>
        <name>Update Case Last Mod from Settlement</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Case_Name__c</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Settlement_Date</fullName>
        <field>Settlement_Date__c</field>
        <formula>TODAY()</formula>
        <name>Update Settlement Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_TM_Email_on_Settlement</fullName>
        <description>Update the TM Email field type of Email on Settlement with the TMs email from the Account Record populated in the Store Purchased field</description>
        <field>Lowe_s_TM_Email__c</field>
        <formula>Store_Purchased__r.Territory_Manager_Email__c</formula>
        <name>Update TM Email on Settlement</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>VAC_Processing_Status_Change</fullName>
        <description>B&amp;Q: Change Settlement Status to Waiting on VAC</description>
        <field>Settlement_Status__c</field>
        <literalValue>Waiting on VAC</literalValue>
        <name>VAC Processing Status Change</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Witney_Processing_Status_Change</fullName>
        <description>Update the Settlement Status field to Witney Processing after the Manager has approved the Settlement for Customer Refunds</description>
        <field>Settlement_Status__c</field>
        <literalValue>Witney Office Processing</literalValue>
        <name>Witney Processing Status Change</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Working_Funds_Processing</fullName>
        <field>Settlement_Status__c</field>
        <literalValue>Working Funds Processing</literalValue>
        <name>Working Funds Processing</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>EUCC FOC Settlement Notify Customer Ready for Pickup</fullName>
        <actions>
            <name>EUCC_FOC_Settlement_Notify_Customer_Ready_for_Pickup</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Settlement__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>FOC - Free of Charge</value>
        </criteriaItems>
        <criteriaItems>
            <field>Settlement__c.Settlement_Status__c</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Settlement__c.Do_Not_Send_Customer_Email__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>B&amp;Q: Send an email to customer when the Settlement record type is FOC - Free of Charge, the Settlement Status is Closed, and the Do Not Send Customer Email checkbox is not selected</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EUCC Notify Case Owner Settlement has been processed</fullName>
        <actions>
            <name>Send_notification_to_Case_Owner_when_a_Settlement_has_been_processed</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Settlement__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>FOC - Free of Charge,Valspar Voucher</value>
        </criteriaItems>
        <criteriaItems>
            <field>Settlement__c.Settlement_Status__c</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <description>Send an email to the Case Owner when a related settlement has been closed.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EUCC Update Settlement Status to Closed</fullName>
        <actions>
            <name>Change_status_to_Closed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Settlement__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>FOC - Free of Charge</value>
        </criteriaItems>
        <criteriaItems>
            <field>Settlement__c.VAC_Completed__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>For EUCC FOC Settlements, sets the Settlement Case Status to Closed when the VAC Completed Checkbox is set to true.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EUCC Valspar Voucher Notify Customer Vouchers Sent</fullName>
        <actions>
            <name>EUCC_Valspar_Voucher_Notify_Customer_Vouchers_Sent</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Settlement__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Valspar Voucher</value>
        </criteriaItems>
        <criteriaItems>
            <field>Settlement__c.Settlement_Status__c</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Settlement__c.Do_Not_Send_Customer_Email__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>B&amp;Q: Send an email to customer when the Settlement record type is Valspar Voucher, the Settlement Status changes to Closed, and the Do Not Send Customer Email checkbox is not selected</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>NBPCC-GW Settlement- Send Email to Order Dept</fullName>
        <actions>
            <name>Send_notification_to_Order_Dept</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Settlement__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Goodwill</value>
        </criteriaItems>
        <description>GW Settlement- Send Email to Order Dept</description>
        <triggerType>onCreateOnly</triggerType>
        <workflowTimeTriggers>
            <timeLength>48</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>NBPCC-Lowe%27s RA Settlement- Send Email to TM and Consumer</fullName>
        <actions>
            <name>Lowe_s_RA_Settlement_Send_notification_to_TM_and_Consumer</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Settlement__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lowe&apos;s RA</value>
        </criteriaItems>
        <criteriaItems>
            <field>Settlement__c.Settlement_Status__c</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <description>Send an Email to the Lowes TM Email on Settlement Record when Status is Changed to Closed</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>NBPCC-Lowe%27s RA Settlement-Update TM Email Field</fullName>
        <actions>
            <name>Update_TM_Email_on_Settlement</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Settlement__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lowe&apos;s RA</value>
        </criteriaItems>
        <description>Update the TM Email field on the Settlement Record when the Settlement is created.  Allow users to overwrite this if needed.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Store Purchased Account Owner Email Update SLMT</fullName>
        <actions>
            <name>Store_Purchased_Account_Owner_Email_SLMT</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Settlement__c.Store_Purchased_Account_Owner__c</field>
            <operation>notEqual</operation>
            <value>NULL</value>
        </criteriaItems>
        <description>Updates the SETTLEMENT Store Purchased Account Owner Email when the Store Purchased field is populated or changed on the Settlement</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Case Contact Email</fullName>
        <actions>
            <name>Update_Case_Contact_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Settlement__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>FOC - Free of Charge,Customer Refund,Valspar Voucher</value>
        </criteriaItems>
        <description>Populates the Case Contact Email field on the Settlement record for EU settlements so that an email can be sent to the customer.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Case Last Modified from Settlement</fullName>
        <actions>
            <name>Update_Case_Last_Mod_from_Settlement</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Settlement__c.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Populate Case.Custom Last Modified Date Time field when a Settlement is added</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Offer from Settlement</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Settlement__c.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Updates the Settlement Updated field on Offer which triggers the &quot;Update Case Last Modified from offer&quot; workflow to update the Case Last Modified field.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>VAC unable to Process FOC</fullName>
        <actions>
            <name>VAC_unable_to_process_a_VOC_Alert_to_Case_Owner</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Pending_CSA_Completion_Status_Change</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Settlement__c.VAC_Rejected__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>B&amp;Q: VAC unable to process the FOC Settlement Type Check box</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
