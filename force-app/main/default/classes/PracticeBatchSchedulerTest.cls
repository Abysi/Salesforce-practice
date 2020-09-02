@isTest
private class PracticeBatchSchedulerTest {
    @TestSetup
    static void makeData(){
        CustomSettingsForTask__c t=new CustomSettingsForTask__c();
        t.DaysForTask__c=-1;
        insert t;
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
        System.assertEquals(10, [SELECT count() FROM Opportunity WHERE StageName='Closed Lost']);
    }
    @isTest
    static void ShedulableTest(){
        String CRON_EXP = '0 00 00 * * ?';
        Test.startTest();
        String jobId=System.schedule('SheduledApex', CRON_EXP, new PracticeBatchScheduler());
        List<Opportunity> opp=[SELECt id From Opportunity WHERE StageName='Closed Lost'];
        System.assertEquals(0, opp.size(),'Opps exist before job has run');
        Test.stopTest();
    }
   
}