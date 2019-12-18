/*
* Description   :   Trigger will fire on before insert
*
* Created By    :   Akshay Bagrecha
*
* Created Date  :   61/06/2019
*
* Version       :   V1.0 Created
*             
*/
trigger Trigger_SOWContract on SOW_Contract__c (before insert) {
    
    //Try Catch
    try{
        
        //Check for the before and insert condition.
        if(Trigger.isBefore && Trigger.isInsert){
            SOQContractTriggerHelper.updateServiceDirector(Trigger.new);
        }
        
    }catch(Exception ex){
        System.debug(ex.getMessage()+'     :'+ex.getLineNumber());
    }
    
}