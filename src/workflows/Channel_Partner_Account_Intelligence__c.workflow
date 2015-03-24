<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>CAI_Paint_Bays_in_Store</fullName>
        <description>Calculates the total # of paint bays in store</description>
        <field>Total_Paint_Bays_Exc_Ends__c</field>
        <formula>BLANKVALUE(VALUE(TEXT(Aerosols_Bays_In_Store__c)),0)+
BLANKVALUE(VALUE(TEXT(Trade_Paint_Bays_In_Store_Preps__c)),0)+
BLANKVALUE(VALUE(TEXT(Trade_Paint_Bays_In_Store_Topcoats__c)),0)+
BLANKVALUE(VALUE(TEXT(Woodcare_Bays_In_Store_Decking__c)),0)+
BLANKVALUE(VALUE(TEXT(Woodcare_Bays_In_Store_Exterior__c)),0)+
BLANKVALUE(VALUE(TEXT(Woodcare_Bays_In_Store_Flooring__c)),0)+
BLANKVALUE(VALUE(TEXT(Woodcare_Bays_In_Store_Clears__c)),0)+
BLANKVALUE(VALUE(TEXT(Woodcare_Bays_In_Store_Stains_Varnis__c)),0)+
BLANKVALUE(VALUE(TEXT(Woodcare_Bays_In_Store_Interior_Stains__c)),0)+
BLANKVALUE(VALUE(TEXT(Woodcare_Bays_In_Store_Interior_Misc__c)),0)+
BLANKVALUE(VALUE(TEXT(Paving_Bays_In_Store_Paint__c)),0)+
BLANKVALUE(VALUE(TEXT(Paving_Bays_In_Store_Stains_Clears__c)),0)+
BLANKVALUE(VALUE(TEXT(Texture_Bays_In_Store_Exterior__c)),0)+
BLANKVALUE(VALUE(TEXT(Texture_Bays_In_Store_Interior__c)),0)+
BLANKVALUE(VALUE(TEXT(Exterior_Bays_In_Store_Matt__c)),0)+
BLANKVALUE(VALUE(TEXT(Exterior_Bays_In_Store_Low_Sheen__c)),0)+
BLANKVALUE(VALUE(TEXT(Exterior_Bays_In_Store_Satin__c)),0)+
BLANKVALUE(VALUE(TEXT(Exterior_Bays_In_Store_Gloss__c)),0)+
BLANKVALUE(VALUE(TEXT(Interior_Bays_In_Store_Matt__c)),0)+
BLANKVALUE(VALUE(TEXT(Interior_Bays_In_Store_Low_Sheen__c)),0)+
BLANKVALUE(VALUE(TEXT(Interior_Bays_In_Store_Satin__c)),0)+
BLANKVALUE(VALUE(TEXT(Interior_Bays_In_Store_Gloss__c)),0)+
BLANKVALUE(VALUE(TEXT(Preps_Bays_In_Store_Water__c)),0)+
BLANKVALUE(VALUE(TEXT(Preps_Bays_In_Store_Oil__c)),0)+
BLANKVALUE(VALUE(TEXT(Ceiling_Bays_In_Store__c)),0)+
BLANKVALUE(VALUE(TEXT(Trim_Bays_In_Store_Water__c)),0)+
BLANKVALUE(VALUE(TEXT(Trim_Bays_In_Store_Oil__c)),0)+
BLANKVALUE(VALUE(TEXT(Metal_Bays_In_Store__c)),0)+
BLANKVALUE(VALUE(TEXT(Handy_Tins_Bays_In_Store__c)),0)+
BLANKVALUE(VALUE(TEXT(Tile_Bays_In_Store__c)),0)+
BLANKVALUE(VALUE(TEXT(Fence_Paint_Bays_In_Store__c)),0)+
BLANKVALUE(VALUE(TEXT(Marine_Bays_In_Store__c)),0)</formula>
        <name>CAI - Paint Bays in Store</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Calculate Paint Bays</fullName>
        <actions>
            <name>CAI_Paint_Bays_in_Store</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>TRUE</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
