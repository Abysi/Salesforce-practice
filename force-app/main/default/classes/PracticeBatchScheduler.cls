global class PracticeBatchScheduler implements Database.Batchable<sObject>,Schedulable {


    global Database.QueryLocator start(Database.BatchableContext bc){
        String query='SELECT Id,StageName,LastModifiedDate FROM Opportunity';
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext bc, List<Opportunity> scope){
        List<Opportunity> opps = new List<Opportunity>();
        for (Opportunity opportunity : scope) {
            if(Date.valueOf(opportunity.LastModifiedDate).addDays((Integer)CustomSettingsForTask__c.getInstance().DaysForTask__c)<Date.today()){
            opportunity.StageName='Closed Lost';
            opps.add(opportunity);
            }
        }
        update opps;
    }   

    global void finish(Database.BatchableContext bc){}

    global void execute(SchedulableContext sc){
        PracticeBatchScheduler b1=new PracticeBatchScheduler();
        Database.executeBatch(b1);
        String sched = '0 00 00 * * ?';
        Id schedulableId= System.schedule('My batch Job', sched, b1);
    }
}
