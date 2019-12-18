/*
* Description   :   Trigger will fire on before insert
*
* Created By    :   Akshay Bagrecha
*
* Created Date  :   31/01/2019
*
* Version       :   V1.0 Created
*             
*/
trigger Trigger_ProductOption on SBQQ__ProductOption__c (before insert) {

    try{
        //Checks for before trigger
        if(Trigger.isBefore) {

            //Checks for insert operation
            if(Trigger.isInsert) {

                //Calling Tigger helper class method
                ProductOptionTriggerHelper.updateProductOptField(Trigger.new);
            }
        }
    }catch(Exception excpt){

        System.debug(excpt.getMessage()+'   :'+ excpt.getLineNumber());

    }
}