<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_Seach_Text_Product_Data_Sheet</fullName>
        <field>Search_Tag__c</field>
        <formula>IF(ISPICKVAL( Status__c , &quot;Active&quot;),
&quot;Active&quot;, 
IF(
ISPICKVAL( Status__c , &quot;Not-active&quot;),
 &quot;Not-active&quot;,
&quot; &quot;))
  &amp; &quot;; &quot; &amp;
IF(ISPICKVAL(Use__c,&quot;Interior&quot;),
&quot;Interior&quot;, 
IF(
ISPICKVAL( Use__c , &quot;Exterior&quot;),
 &quot;Exterior&quot;,
IF(
ISPICKVAL( Use__c , &quot;Both&quot;),
 &quot;Both&quot;,
&quot; &quot;)))
  &amp; &quot;; &quot; &amp; 
IF(ISPICKVAL(Coating_Type__c,&quot;Paint&quot;),
&quot;Paint&quot;, 
IF(
ISPICKVAL(Coating_Type__c , &quot;Stain&quot;),
 &quot;Stain&quot;,
IF(
ISPICKVAL(Coating_Type__c , &quot;Epoxy&quot;),
 &quot;Epoxy&quot;,
IF(
ISPICKVAL(Coating_Type__c , &quot;Spray&quot;),
 &quot;Spray&quot;,
&quot; &quot;))))
&amp; &quot;; &quot; &amp; 
IF(INCLUDES(Channel__c,&quot;Lowes&quot;),
&quot;Lowes&quot;,&quot; &quot;)
&amp; &quot;; &quot; &amp; 
IF(INCLUDES(Channel__c,&quot;Ace&quot;),
&quot;Ace&quot;,&quot; &quot;)
&amp; &quot;; &quot; &amp; 
IF(INCLUDES(Channel__c,&quot;Menards&quot;),
&quot;Menards&quot;,&quot; &quot;)
&amp; &quot;; &quot; &amp; 
IF(INCLUDES(Channel__c,&quot;Paint Drop&quot;),
&quot;Paint Drop&quot;,&quot; &quot;)
&amp; &quot;; &quot; &amp; 
IF(INCLUDES(Channel__c,&quot;Independent&quot;),
&quot;Independent&quot;,&quot; &quot;)</formula>
        <name>Update Seach Text - Product Data Sheet</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <knowledgePublishes>
        <fullName>Publish_Article</fullName>
        <action>Publish</action>
        <description>Publish Article</description>
        <label>Publish Article</label>
        <language>en_US</language>
        <protected>false</protected>
    </knowledgePublishes>
    <rules>
        <fullName>Product Data Sheet Search Text</fullName>
        <actions>
            <name>Update_Seach_Text_Product_Data_Sheet</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>True</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
