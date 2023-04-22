public class AccountLWC {
    @AuraEnabled(cacheable=true)
    //query will return list of account by createddate
    public static List<Account> getRecentAccounts() {
        return [SELECT Id, Name FROM Account ORDER BY CreatedDate DESC LIMIT 10];
    }
}