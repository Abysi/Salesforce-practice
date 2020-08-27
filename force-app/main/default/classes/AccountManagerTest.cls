@isTest
public class AccountManagerTest {
    @isTest static void testGetAccountById()
    {
        ID recordId=createAccountRecord();
        RestREquest request =new RestRequest();
        request.requestUri =
            'https://resilient-wolf-ln596e-dev-ed.lightning.force.com/lightning/r/Account/'
            + recordId+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request=request;
        
        system.debug('recordId - ' + recordId);
        Account acc=AccountManager.getAccount();
        System.assert(acc != null);
        System.assertEquals('SAss', acc.Name);
    }
    static Id createAccountRecord() {
        Account acc=new Account();
        acc.name='SAss';
        insert acc;
        return acc.Id;
    }          
}