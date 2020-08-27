@isTest
private class PracticeBatchSchedulerTest {
    @TestSetup
    static void makeData(){
        List<Opportunity> opps=new List<Opportunity>();
        for (Integer i = 0; i < 10; i++) {
            opps.add(new Opportunity(Name='Test'+i,StageName='Prospecting',CloseDate=Date.today()));
        }
        insert opps;
    }
    @isTest
    static void batchTest(){
        Test.startTest();
        PracticeBatchScheduler pbs=new PracticeBatchScheduler();
        Database.executeBatch(pbs);
        Test.stopTest();
        System.assertEquals(0, [SELECT count() FROM Opportunity WHERE StageName='Closed Lost']);

        
    }
   
}
