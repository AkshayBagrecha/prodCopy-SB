/*
* Description   :   Trigger will fire on before insert
*
* Created By    :   Akshay Bagrecha
*
* Created Date  :   21/02/2019
*
* Version       :   V1.0 Created
*               :   V1.1 Updated By Akshay Bagrecha 07/18/2019
*             
*/
trigger Trigger_Opportunity on Opportunity (before insert, before update, after insert, after update) {
    
    public static Integer count = 0;
    
    try{
        
        if(count == 0) {
            
            count++;
            
            //Checks for before trigger
            if(Trigger.isBefore) {
    
                //Checks for insert operation
                if(Trigger.isInsert) {
                    
                    //Calling Tigger helper class method
                    OpportunityTriggerHelper.updateTrigger(Trigger.new);
                    
                    /* Method is used to update the trigger__c after Renewal*/
                   OpportunityTriggerHelper.updateTriggerAfterRenewal(Trigger.new);
                }
                //Checks for update operation
                if(Trigger.isUpdate || Trigger.isInsert){
                    
                    //Calling Trigger helper clas method 
                    OpportunityTriggerHelper.updateACVAndTCV(Trigger.new, Trigger.oldMap);
                    OpportunityTriggerHelper.updateFieldAsProcessBuilder(Trigger.new, Trigger.oldMap); 
                    OpportunityTriggerHelper.updateOpportunityLeadSource(Trigger.new, Trigger.oldMap); 
                 }
            }
            
            //Checks for the after insert, update operation
            if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){
                
                //Calling Trigger helper clas method
                OpportunityTriggerHelper.updateContractStatus(Trigger.new, Trigger.oldMap);
                OpportunityTriggerHelper.updateQuoteOrdered(Trigger.new, Trigger.oldMap);       
            }
        }
        
    }catch(Exception excpt){
        System.debug(excpt.getMessage()+'     :'+excpt.getLineNumber());
       
    }
}