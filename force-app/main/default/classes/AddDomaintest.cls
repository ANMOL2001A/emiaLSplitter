@isTest
public class AddDomaintest {
    @isTest
    public static void testContactForMap() {
        // Test data setup
        
        TriggerConfig__c triggerConfig=new TriggerConfig__c();
        triggerConfig.ApexHandler__c='AccountHandler';
        triggerConfig.IsActive__c=TRUE;
        triggerConfig.SkipForUsers__c=NULL;
        triggerConfig.Name='Contact';
        insert triggerConfig;
        
        account acc= new account(name='sharma');
        insert acc;
        
        List<Contact> contacts = new List<Contact>();
        for(integer i=0;i<200;i++){
            contacts.add(new Contact(Email = 'anmol@sharma.com',LastName='annmoll'));
        
        }
        insert contacts;
        list<contact> conc=[select name,id from contact where id in :contacts];
        system.assertEquals(200,conc.size());
        Test.startTest();
       // AddDomainHelper.contactForMap(contacts);
         Test.stopTest();
       
        
        // Perform assertions on the result
       // System.assertEquals(200, result.size(), 'Map size should be 2');
       // System.assertEquals('Example', result.get('example.com'), 'Incorrect AccountId for example.com');
        // Add more assertions as needed
    }
    
  /*  @isTest
    public static void testAccounts() {
        // Test data setup
        Contact contact = new Contact(Email = 'test@example.com');
        Map<String, Id> accountIdMap = new Map<String, Id>();
        accountIdMap.put('example', '001XXXXXXXXXXXX');
        
        Test.startTest();
        
        // Call the method to be tested
        /*ddDomainHelper.accounts(contact, accountIdMap);
        
        Test.stopTest();
        
        // Perform assertions on the updated contact
        System.assertEquals('001XXXXXXXXXXXX', contact.AccountId, 'AccountId should be updated');
        // Add more assertions as needed
    }
    
    @isTest
    public static void testContactForMap_NoEmail() {
        // Test data setup
        List<Contact> contacts = new List<Contact>();
        contacts.add(new Contact(Email = null));
        
        Test.startTest();
        
        // Call the method to be tested
        Map<String, Id> result = AddDomainHelper.contactForMap(contacts);
        
        Test.stopTest();
        
        // Perform assertions on the result
        System.assertEquals(0, result.size(), 'Map size should be 0');
        // Add more assertions as needed
    }
    
// Add more test methods to cover different scenarios*/
    
}
