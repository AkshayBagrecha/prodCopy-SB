/** 
*    Description     :      This class is used auto populate the field on th product option as the option sku product on before insert
*
*    Created By      :      Akshay Bagrecha
*
*    Created Date    :      31/01/2019
* 
*    Revision Logs   :      V_1.0 - Created
*                      
**/
public class ProductOptionTriggerHelper {

	/*
	* Description   :  This method is used auto populate the field on product option recor  
	*
	* Created By    :   Akshay Bagrecha
	*
	* Created Date  :   31/01/2019
	*
	* Version       :   V1.0 Created
	*             
	*/
	public static void updateProductOptField(List<SBQQ__ProductOption__c> listNewProductOpt){
		
		//Set to contain the ID of the option product
		Set<Id> setOfOptionalSKUId = new Set<Id>();

		//Size check on list
		if(listNewProductOpt.size()> 0){
			for(SBQQ__ProductOption__c productOpt : listNewProductOpt){
				
				if(productOpt.SBQQ__OptionalSKU__c != null)
					//Adding ID's into set
					setOfOptionalSKUId.add(productOpt.SBQQ__OptionalSKU__c);
			}
		}

		//Map to hold the product detail
		Map<Id, Product2> mapProductDetails = new Map<Id, Product2>([SELECT Id, Live_Doc_Firewall_Multi_way_Matching__c, AP_Automation_Workflow__c, 
																		Customer_need_ext_points__c, Customer_Need_Dynamic_Discounting__c, Need_Supply_Chain_Finance__c
																		FROM Product2 WHERE Id IN: setOfOptionalSKUId]);
		//Size check for the map
		if(mapProductDetails.size() > 0){

			//Loop over the new list of product option
			for(SBQQ__ProductOption__c pdtOpt : listNewProductOpt){

				//Updating
				pdtOpt.Live_Doc_Firewall_Multi_way_Matching__c = mapProductDetails.get(pdtOpt.SBQQ__OptionalSKU__c).Live_Doc_Firewall_Multi_way_Matching__c;	
				pdtOpt.AP_Automation_Workflow__c = 	mapProductDetails.get(pdtOpt.SBQQ__OptionalSKU__c).AP_Automation_Workflow__c ;
				pdtOpt.Customer_need_ext_points__c = 	mapProductDetails.get(pdtOpt.SBQQ__OptionalSKU__c).Customer_need_ext_points__c ;
				pdtOpt.Customer_Need_Dynamic_Discounting__c = mapProductDetails.get(pdtOpt.SBQQ__OptionalSKU__c).Customer_Need_Dynamic_Discounting__c ;
				pdtOpt.Need_Supply_Chain_Finance__c	 = mapProductDetails.get(pdtOpt.SBQQ__OptionalSKU__c).Need_Supply_Chain_Finance__c ;
			}
		}



		/*
		//Set to contain the ID of the option product
		Set<Id> setOfOptionalSKUId = new Set<Id>();
		
		//Map to hold Id with the field which are going to auto populate
		Map<ID, Product2> mapOfIDwithField = new Map<ID, Product2>();

		//Size check on list
		if(listNewProductOpt.size()> 0){
			for(SBQQ__ProductOption__c productOpt : listNewProductOpt){
				
				//Adding ID's into set
				setOfOptionalSKUId.add(productOpt.SBQQ__OptionalSKU__c);
			}
		}

		//Size check on set
		if(setOfOptionalSKUId.size()>0){

			//Loop over the Product
			for(Product2 prodct : [Select Id, Live_Doc_Firewall_Multi_way_Matching__c, AP_Automation_Workflow__c, Customer_need_ext_points__c, Customer_Need_Dynamic_Discounting__c, Need_Supply_Chain_Finance__c from Product2 where ID IN: setOfOptionalSKUId]){

				//Contains check
				if(!mapOfIDwithField.containsKey(prodct.Id))
                	mapOfIDwithField.put(prodct.Id, prodct);
			}
		}

		//Size check on map
		if(mapOfIDwithField.size() > 0){

			for(SBQQ__ProductOption__c pdtOpt : listNewProductOpt){

				//Check for ID
				if(mapOfIDwithField.containsKey(pdtOpt.SBQQ__OptionalSKU__c)){

					//Check for the product field if its true then put yes in product option field
					if( mapOfIDwithField.get(pdtOpt.SBQQ__OptionalSKU__c).Live_Doc_Firewall_Multi_way_Matching__c){
						pdtOpt.Live_Doc_Firewall_Multi_way_Matching__c = 'Yes';	
					}
					if( mapOfIDwithField.get(pdtOpt.SBQQ__OptionalSKU__c).AP_Automation_Workflow__c){
						pdtOpt.AP_Automation_Workflow__c = 'Yes';	
					}
					if( mapOfIDwithField.get(pdtOpt.SBQQ__OptionalSKU__c).Customer_need_ext_points__c){
						pdtOpt.Customer_need_ext_points__c = 'Yes';	
					}
					if( mapOfIDwithField.get(pdtOpt.SBQQ__OptionalSKU__c).Customer_Need_Dynamic_Discounting__c){
						pdtOpt.Customer_Need_Dynamic_Discounting__c = 'Yes';	
					}
					if( mapOfIDwithField.get(pdtOpt.SBQQ__OptionalSKU__c).Need_Supply_Chain_Finance__c){
						pdtOpt.Need_Supply_Chain_Finance__c	 = 'Yes';	
					}
				}
			}
		}*/
	}
}