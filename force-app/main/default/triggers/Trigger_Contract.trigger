trigger Trigger_Contract on Contract (before insert, before update, after insert, after update) {

    try{
        
        //Check for before operation
        if(Trigger.isBefore){

            //Check for insert operation
            if(Trigger.isInsert || Trigger.isUpdate){
               ContractTriggerHelper.updateOrder(Trigger.new, Trigger.oldMap);
             
            }
            if(Trigger.isUpdate){
                //ContractTriggerHelper.updateMasterContract(Trigger.new, Trigger.oldMap);
            }
        }
        
        //Check for after insert and update condition
        if(Trigger.isAfter && (Trigger.isUpdate || Trigger.isInsert)){
           ContractTriggerHelper.updateContractNumberOnOrder(Trigger.new, Trigger.oldMap); 
        }   
        //Check for after update condition
        if(Trigger.isAfter && Trigger.isUpdate){
           ContractTriggerHelper.updateOrderStatus(Trigger.new, Trigger.oldMap);
        }
    }
    catch(Exception ex){
        System.assert(false, ex.getMessage() +'at this line number' + ex.getLineNumber());
    }
}