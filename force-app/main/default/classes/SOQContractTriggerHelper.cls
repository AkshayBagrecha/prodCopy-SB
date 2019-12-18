/** 
*    Description     :      This class is used as a helper of the Contract trigger
*
*    Created By      :      Akshay Bagrecha
*
*    Created Date    :      26/06/2019
* 
*    Revision Logs   :      V_1.0 - Created
*                      
**/
public with sharing class SOQContractTriggerHelper {
    
    /** 
    *    Description     :      This method to update the "Professional Services Director" field value
    *
    *    Created By      :      Akshay Bagrecha
    *
    *    Created Date    :      26/06/2019
    * 
    *    Revision Logs   :      V_1.0 - Created
    *                      
    **/
    public static void updateServiceDirector(List<SOW_Contract__c> newCont){
        
        //Set to hold the Opportunity ID.
        Set<Id> oppIDs = new Set<Id>();
        
        //Loop over the contract new list
        for(SOW_Contract__c con : newCont){
            if(con.Opportunity__c != null){
                oppIDs.add(con.Opportunity__c);
            }       
        }
        
        //Map to hold the OpportunityId with Record.
        Map<Id, Opportunity> mapOfOpp = new Map<Id, Opportunity>([Select Id, PS_Territory__c, RecordTypeId From Opportunity Where ID IN: oppIDs]);
        
        //Size for the map "mapOfOpp"
        if(mapOfOpp.size() > 0){
            
            //Loop over the new contract list
            for(SOW_Contract__c con : newCont){
                
                //Set the Record type of SOW contract
               // con.RecordTypeId = '0121X000000BIfx';
                
                //Check for the Opp PS_Territory__c for 'UK' or 'Benelux'
                if(mapOfOpp.containsKey(con.Opportunity__c) && (mapOfOpp.get(con.Opportunity__c).PS_Territory__c == 'UK' || mapOfOpp.get(con.Opportunity__c).PS_Territory__c == 'Benelux')){
                    con.Professional_Services_Director__c = '00557000007VUcV';
                }
                
                //Check for the Opp PS_Territory__c for 'Nordics'
                else if(mapOfOpp.containsKey(con.Opportunity__c) && mapOfOpp.get(con.Opportunity__c).PS_Territory__c == 'Nordics'){
                    con.Professional_Services_Director__c = '00557000007Xv2x';
                }
                
                //Check for the Opp PS_Territory__c for 'France' or 'DACH' or 'Iberia'
                else if(mapOfOpp.containsKey(con.Opportunity__c) && (mapOfOpp.get(con.Opportunity__c).PS_Territory__c == 'France' ||mapOfOpp.get(con.Opportunity__c).PS_Territory__c == 'DACH' || mapOfOpp.get(con.Opportunity__c).PS_Territory__c == 'Iberia')){
                    con.Professional_Services_Director__c = '00557000007Xv32';
                }
                
                //Check for the Opp PS_Territory__c for 'Americas'
                else if(mapOfOpp.containsKey(con.Opportunity__c) && mapOfOpp.get(con.Opportunity__c).PS_Territory__c == 'Americas' ){
                    con.Professional_Services_Director__c = '00557000007Xv37';
                }
                
                //Check for the Opp PS_Territory__c for 'China & APAC'
                else if(mapOfOpp.containsKey(con.Opportunity__c) && mapOfOpp.get(con.Opportunity__c).PS_Territory__c == 'China & APAC' ){
                    con.Professional_Services_Director__c = '00557000007Xv3r';
                }
            }
        }
    }
}