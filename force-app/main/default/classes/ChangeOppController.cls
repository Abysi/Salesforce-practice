public class ChangeOppController {
    @AuraEnabled
    public static Opportunity getOpp(string oppID){
        if(oppId == null) return null;
        Opportunity opp=[Select Id,Name,CloseDate,StageName FROM Opportunity WHERE Id = :oppId ];
        return opp;
    }
    
     @AuraEnabled
    public static void setOppStageToClose(Id oppId){
        if(oppId == null) return;
        Opportunity opp=[Select Id,Name,CloseDate,StageName FROM Opportunity WHERE Id = :oppId ];
        opp.StageName='Closed Won';
        update opp;
    }
}