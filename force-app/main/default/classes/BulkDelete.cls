global class BulkDelete implements Database.Batchable<sObject>{


   global Database.QueryLocator start(Database.BatchableContext BC){
       String query = 'SELECT Id, name, createdDate FROM Lead WHERE CreatedDate = LAST_N_DAYS:10 and ownerId = \'00557000008PvNU\'';
      return Database.getQueryLocator(query);
   }

   global void execute(Database.BatchableContext BC, List<Lead> scope){
     delete scope;
    }

   global void finish(Database.BatchableContext BC){
   }
}