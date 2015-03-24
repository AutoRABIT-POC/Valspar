<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Contact_Center_Test_Email_Account_DB</fullName>
        <ccEmails>nbporderctr@valspar.com</ccEmails>
        <description>Contact Center Test Email Account DB</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Contact_Center_Email_Templates/Email_Template_for_Contact_Center_Test_Email_Account_DB</template>
    </alerts>
    <fieldUpdates>
        <fullName>Lowes_Pro_Account</fullName>
        <field>Account_Type__c</field>
        <literalValue>Pro Account</literalValue>
        <name>Lowes Pro Account</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Populate_Global_Region_to_EMEAI</fullName>
        <description>Populates the Account Global Region field to EMEAI</description>
        <field>Global_Region__c</field>
        <literalValue>EMEAI</literalValue>
        <name>Populate Global Region to EMEAI</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Populate_Global_Region_to_North_America</fullName>
        <description>Populates the Account Global Region field to North America</description>
        <field>Global_Region__c</field>
        <literalValue>North America</literalValue>
        <name>Populate Global Region to North America</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Inactivated_By_To_Null</fullName>
        <description>Change the Inactivated By field to Null when the Active Flag is set to True.   CHG-523644</description>
        <field>Inactivated_By__c</field>
        <name>Update Inactivated By To Null</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Inactivated_By_To_User</fullName>
        <description>Change the Inactivated By field to current user first and last name when the Active Flag is set to False.   CHG-523644</description>
        <field>Inactivated_By__c</field>
        <formula>$User.FirstName &amp; &apos; &apos; &amp; $User.LastName</formula>
        <name>Update Inactivated By To User</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Inactive_Date_To_Now</fullName>
        <description>Change the Inactive Date field to Current date and time when the Active Flag is set to False.   CHG-523644</description>
        <field>Inactive_Date__c</field>
        <formula>now()</formula>
        <name>Update Inactive Date To Now</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Inactive_Date_To_Null</fullName>
        <description>Change the Inactive Date field to Null when the Active Flag is set to True.   CHG-523644</description>
        <field>Inactive_Date__c</field>
        <name>Update Inactive Date To Null</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Account Inactive Date%2FBy updated to date%2Fuser</fullName>
        <actions>
            <name>Update_Inactivated_By_To_User</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Inactive_Date_To_Now</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Active__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>Updates the Inactive Date to Now when the Account Active Flag is changed to False.  CHG-523644</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Account Inactive Date%2FBy updated to null</fullName>
        <actions>
            <name>Update_Inactivated_By_To_Null</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Inactive_Date_To_Null</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Active__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Updates the Inactive Date to Null when the Account Active Flag is changed to True.  CHG-523644</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Contact Center Agent Account Consumer DB</fullName>
        <actions>
            <name>Contact_Center_Test_Email_Account_DB</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>User.ProfileId</field>
            <operation>equals</operation>
            <value>Consumer Contact Center Agent</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Business_Unit__c</field>
            <operation>equals</operation>
            <value>Consumer DB</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Populate Global Region to EMEAI</fullName>
        <actions>
            <name>Populate_Global_Region_to_EMEAI</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Sales_Org__c</field>
            <operation>notEqual</operation>
            <value>CANADA OPERATING UNIT,EPS OPERATING UNIT,VALSPAR OPERATING UNIT</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.X11i_Customer__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Business_Unit__c</field>
            <operation>equals</operation>
            <value>General Industrial</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ParentId</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>For General Industrial, populate Account.Global Region based on Account.Sales Org Value.  If Sales Org is populate and not equal to Canada, EPS, or Valspar, set Global Region to EMEAI.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Populate Global Region to North America</fullName>
        <actions>
            <name>Populate_Global_Region_to_North_America</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Sales_Org__c</field>
            <operation>equals</operation>
            <value>CANADA OPERATING UNIT,EPS OPERATING UNIT,VALSPAR OPERATING UNIT</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.X11i_Customer__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Business_Unit__c</field>
            <operation>equals</operation>
            <value>General Industrial</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ParentId</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>For General Industrial, populate Account.Global Region based on Account.Sales Org Value.  If Canada, EPS, or Valspar, set Global Region to North America</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Lowes Pro Account</fullName>
        <actions>
            <name>Lowes_Pro_Account</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4</booleanFilter>
        <criteriaItems>
            <field>Account.Business_Unit__c</field>
            <operation>equals</operation>
            <value>Consumer Lowes</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>Manual Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Account_Type__c</field>
            <operation>notEqual</operation>
            <value>Lowes Store</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Account_Type__c</field>
            <operation>notEqual</operation>
            <value>National</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
