public class AddDomainHelper {
    public static Map<String, Id> contactForMap(List<sObject> contactList)
    {
     Set<String> contactsMails = New Set<String>();
     List<Contact> con = (List<Contact>)contactList;
     for(Contact conEmails:con)
    {
        
         String emailDom=conEmails.Email.split('@').get(1);
        //String[] splitExtension=emailDomain.split('\\.');
        String dots=emailDom.split('\\.').get(0);
        contactsMails.add(dots);

    }  
       /* list<account> accounts =[select name,id from account where name=:dots limit 1];
        if(accounts.size() > 0){
            cons.AccountId=accounts[0].id;
        }*/
        Map<String, Id>DomainAccountIdMap = new Map<String, Id>();
        //Iterated through Account and get the id,Name related to contactEmail
        for(Account account:[SELECT Id,Name FROM Account WHERE Name IN:contactsMails])
        {
            //Added id and name to Map websiteDomainAccountIdMap
            DomainAccountIdMap.put(account.Name, account.Id);
        } 
        return  DomainAccountIdMap;
        }
        public static void accounts(contact contacts,Map<String,Id> DomainAccountIdMap)
        {
            String contactsEmail;
            if(contacts.email != null)
            {
                String emailDom=contacts.Email.split('@').get(1);
                String dots=emailDom.split('\\.').get(0);
                contactsEmail=dots;
            }
            if(DomainAccountIdMap.containsKey(contactsEmail)){
                contacts.AccountId = DomainAccountIdMap.get(contactsEmail);
        }
        
    }
          }