/**
 * Description	:	Test class for Contract Trigger
 * Coverage		:	
 **/
@isTest
public class SOWContractTrigger_Test {
	
    @testSetup static void createTestData() {
     	
        //Start test here
        Test.startTest();
        
        //List of account
        List<Account> accounts = TestDataUtility.createAccounts(1);
        
        //Assert
        System.assertEquals(1, accounts.size());
        
        //Insert Contact under account
        Contact con = new Contact();
        con.FirstName = 'Test';
        con.LastName = 'Con';
        con.LeadSource = 'Marketing';
        con.AccountId = accounts[0].Id;
        insert con;
        
        Opportunity opp = new Opportunity();
        opp.name = 'Hello Kitty';
        opp.AccountId = accounts[0].Id;
        opp.Primary_Contact__c = con.Id;
        opp.Type = 'Services';
        opp.StageName = '1 - Identify';
        opp.TradeShift_Category__c = 'Upside';
        opp.Trigger__c = 'Alliances';
        opp.CloseDate = System.today().addDays(10);
        opp.Implementation_List_Price__c = 10;
        opp.Implementation_Discounted_Price__c = 0;
        opp.Implementation_Effort__c = 10;
        opp.Carve_Out_Allocation__c = 10;
        opp.Supplier_IaaS_List_Price__c = 10;
        opp.Supplier_Enrollment_Fees__c = 10;
        opp.Internal_Cost_Amount__c = 100;
        opp.Product_New_Features__c = 'New Pay Product';
        opp.PS_Region__c = 'EMEA';
        opp.PS_Territory__c = 'UK';
        
        insert opp;
        
        //Stop test here
        Test.stopTest();        
    }
    
    @isTest static void testUpdateOppRegion() {
        
        List<Opportunity> opps = [Select Id, PS_Territory__c, AccountId, Primary_Contact__c,  PS_Region__c  From Opportunity];
        System.assertEquals(1, opps.size());
        
        SOW_Contract__c cont = [Select Id, Opportunity__c From SOW_Contract__c Where Opportunity__c = : opps[0].Id Limit 1];
		System.assertEquals(cont.Opportunity__c, opps[0].Id);
        
        Opportunity oppforNordics = new Opportunity();
        oppforNordics.name = 'Hello Kitty';
        oppforNordics.AccountId = opps[0].AccountId;
        oppforNordics.Primary_Contact__c = opps[0].Primary_Contact__c ;
        oppforNordics.Type = 'Services';
        oppforNordics.StageName = '1 - Identify';
        oppforNordics.TradeShift_Category__c = 'Upside';
        oppforNordics.Trigger__c = 'Alliances';
        oppforNordics.CloseDate = System.today().addDays(10);
        oppforNordics.Implementation_List_Price__c = 10;
        oppforNordics.Implementation_Discounted_Price__c = 0;
        oppforNordics.Implementation_Effort__c = 10;
        oppforNordics.Carve_Out_Allocation__c = 10;
        oppforNordics.Supplier_IaaS_List_Price__c = 10;
        oppforNordics.Supplier_Enrollment_Fees__c = 10;
        oppforNordics.Internal_Cost_Amount__c = 100;
        oppforNordics.Product_New_Features__c = 'New Pay Product';
        oppforNordics.PS_Region__c = 'EMEA';
        oppforNordics.PS_Territory__c = 'Nordics';
        
        insert oppforNordics;
        
        SOW_Contract__c contForNordics = [Select Id, Opportunity__c From SOW_Contract__c Where Opportunity__c =: oppforNordics.Id Limit 1];
		System.assertEquals(contForNordics.Opportunity__c, oppforNordics.Id);
        
         Opportunity oppforFrance = new Opportunity();
        oppforFrance.name = 'Hello Kitty';
        oppforFrance.AccountId = opps[0].AccountId;
        oppforFrance.Primary_Contact__c = opps[0].Primary_Contact__c ;
        oppforFrance.Type = 'Services';
        oppforFrance.StageName = '1 - Identify';
        oppforFrance.TradeShift_Category__c = 'Upside';
        oppforFrance.Trigger__c = 'Alliances';
        oppforFrance.CloseDate = System.today().addDays(10);
        oppforFrance.Implementation_List_Price__c = 10;
        oppforFrance.Implementation_Discounted_Price__c = 0;
        oppforFrance.Implementation_Effort__c = 10;
        oppforFrance.Carve_Out_Allocation__c = 10;
        oppforFrance.Supplier_IaaS_List_Price__c = 10;
        oppforFrance.Supplier_Enrollment_Fees__c = 10;
        oppforFrance.Internal_Cost_Amount__c = 100;
        oppforFrance.Product_New_Features__c = 'New Pay Product';
        oppforFrance.PS_Region__c = 'EMEA';
        oppforFrance.PS_Territory__c = 'France';
        
        insert oppforFrance;
        
        SOW_Contract__c contForFrance = [Select Id, Opportunity__c From SOW_Contract__c Where Opportunity__c =: oppforFrance.Id Limit 1];
		System.assertEquals(contForFrance.Opportunity__c, oppforFrance.Id);
        
         Opportunity oppforChina = new Opportunity();
        oppforChina.name = 'Hello Kitty';
        oppforChina.AccountId = opps[0].AccountId;
        oppforChina.Primary_Contact__c = opps[0].Primary_Contact__c ;
        oppforChina.Type = 'Services';
        oppforChina.StageName = '1 - Identify';
        oppforChina.TradeShift_Category__c = 'Upside';
        oppforChina.Trigger__c = 'Alliances';
        oppforChina.CloseDate = System.today().addDays(10);
        oppforChina.Implementation_List_Price__c = 10;
        oppforChina.Implementation_Discounted_Price__c = 0;
        oppforChina.Implementation_Effort__c = 10;
        oppforChina.Carve_Out_Allocation__c = 10;
        oppforChina.Supplier_IaaS_List_Price__c = 10;
        oppforChina.Supplier_Enrollment_Fees__c = 10;
        oppforChina.Internal_Cost_Amount__c = 100;
        oppforChina.Product_New_Features__c = 'New Pay Product';
        oppforChina.PS_Region__c = 'EMEA';
        oppforChina.PS_Territory__c = 'China & APAC';
        
        insert oppforChina;
        
        SOW_Contract__c contForChina = [Select Id, Opportunity__c From SOW_Contract__c Where Opportunity__c =: oppforChina.Id Limit 1];
		System.assertEquals(contForChina.Opportunity__c, oppforChina.Id);
        
         Opportunity oppforAmerica = new Opportunity();
        oppforAmerica.name = 'Hello Kitty';
        oppforAmerica.AccountId = opps[0].AccountId;
        oppforAmerica.Primary_Contact__c = opps[0].Primary_Contact__c ;
        oppforAmerica.Type = 'Services';
        oppforAmerica.StageName = '1 - Identify';
        oppforAmerica.TradeShift_Category__c = 'Upside';
        oppforAmerica.Trigger__c = 'Alliances';
        oppforAmerica.CloseDate = System.today().addDays(10);
        oppforAmerica.Implementation_List_Price__c = 10;
        oppforAmerica.Implementation_Discounted_Price__c = 0;
        oppforAmerica.Implementation_Effort__c = 10;
        oppforAmerica.Carve_Out_Allocation__c = 10;
        oppforAmerica.Supplier_IaaS_List_Price__c = 10;
        oppforAmerica.Supplier_Enrollment_Fees__c = 10;
        oppforAmerica.Internal_Cost_Amount__c = 100;
        oppforAmerica.Product_New_Features__c = 'New Pay Product';
        oppforAmerica.PS_Region__c = 'EMEA';
        oppforAmerica.PS_Territory__c = 'Americas';
        
        insert oppforAmerica;
        
        SOW_Contract__c contForAmerica = [Select Id, Opportunity__c From SOW_Contract__c Where Opportunity__c =: oppforAmerica.Id Limit 1];
		System.assertEquals(contForAmerica.Opportunity__c, oppforAmerica.Id);
    }
}