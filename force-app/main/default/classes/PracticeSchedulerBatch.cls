global class PracticeSchedulerBatch implements Schedulable {
   
    // global static String scheduleMe() {
    //     Scheduler_class SC = new PracticeSchedulerBatch(); 
    //     return System.schedule('My batch Job', sched, SC);
    // }
    global void execute(SchedulableContext sc){
        PracticeBatchScheduler b1=new PracticeBatchScheduler();
        Database.executeBatch(b1);
        String sched = '0 00 00 * * ?';
    }
}