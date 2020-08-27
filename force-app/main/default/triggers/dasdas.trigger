trigger dasdas on Opportunity (before delete) {
    for(Opportunity opp:Trigger.old){
        If(opp.StageName!='CLosed Lost'){
            opp.addError('Only CLosed Lost Can Be Deleted');
        }
    }
    
}