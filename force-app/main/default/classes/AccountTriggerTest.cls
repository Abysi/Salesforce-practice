@isTest
public with sharing class AccountTriggerTest {
    @TestSetup static void testSetup()
    {
        System.debug('Setup');
    }
 @isTest static void TestCreate200Records()
 {
     List<Account> accts = new List<Account>();
     for (integer i=0;i<200;i++) {
         Account acct=new Account(Name='Test'+i,BillingState='CA');
         accts.add(acct);
     }

     insert accts;

Task s=new Task();

     List<Account>listAcc=[Select ShippingState From Account];
     for (Account a : listAcc) {
         System.assertEquals('Ca',a.ShippingState);
     }
 }
    @isTest static void TestCreate2002Records()
 {
     List<Account> accts = new List<Account>();
     for (integer i=0;i<200;i++) {
         Account acct=new Account(Name='Test'+i,BillingState='CA');
         accts.add(acct);
     }

     insert accts;

Task s=new Task();

     List<Account>listAcc=[Select ShippingState From Account];
     for (Account a : listAcc) {
         System.assertEquals('Ca',a.ShippingState);
     }
 }
}