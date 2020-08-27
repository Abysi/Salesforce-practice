@isTest
public class ContactTriggerTest {
    @isTest static void test1(){
        Contact cnt=new Contact(LastName='Test',Email='test@test.ru');
        Database.SaveResult insertResult=Database.insert(cnt,false);
        System.assert(insertResult.isSuccess());
        
        cnt.Email='test2@test.ru';
        cnt.Email_change_counter__c=null;
        Database.SaveResult updateResult=Database.update(cnt);
        System.assert(updateResult.isSuccess());
    }
    @isTest static void test2(){
        Contact cnt=new Contact(LastName='Test',Email='test@mail.ru');
        Database.SaveResult insertResult=Database.insert(cnt,false);
        System.assert(!insertResult.isSuccess());
    }
    @isTest static void test3(){
        Contact cnt=new Contact(LastName='Test',Email='test@gh.ru');
        Database.SaveResult insertResult=Database.insert(cnt,false);
        System.assert(insertResult.isSuccess());
        cnt.Email='test2@mail.ru';
        Database.SaveResult updateResult=Database.update(cnt);
        System.assert(!updateResult.isSuccess());
    }
}