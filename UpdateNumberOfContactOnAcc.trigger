trigger UpdateNumberOfContactOnAcc on Contact (after insert, after update, after delete, after undelete) {
    Set<Id> accountIds = new Set<Id>();
    List<Account> accountsToUpdate = new List<Account>();
    
    // Get the set of Account IDs associated with the Contacts
    for (Contact c : Trigger.new) {
        accountIds.add(c.AccountId);
    }
    for (Contact c : Trigger.old) {
        accountIds.add(c.AccountId);
    }
    
    // Query the Account records and update the custom field with the count of related Contacts
    accountsToUpdate = [SELECT Id, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :accountIds];
    for (Account acc : accountsToUpdate) {
        Integer count = 0;
        for (Contact con : acc.Contacts) {
            count++;
        }
    	acc.Number_of_Contacts__c = count;
    }
    update accountsToUpdate;
}