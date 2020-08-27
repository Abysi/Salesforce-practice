public with sharing class AccountTriggerHandler {
    public AccountTriggerHandler() {

    }
    public static void CreateAccounts(List<Account> accts){
        List<Account> acc = new List<Account>();
        for (Account a : accts) {
            If(a.ShippingState!=a.BillingState){
                a.ShippingState=a.BillingState;
               
                acc.add(a);
            }
        }
        
        if(acc.size()>0){
            insert acc;
        }
    }
}