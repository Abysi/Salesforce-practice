trigger ContactTrigger on Contact (after insert,before update) { 
    if(Trigger.isInsert){  
        List<Task>arrTask=new List<Task>();
        for(Contact cnt:Trigger.New){
            if(string.isBlank(cnt.Email)||!cnt.Email.contains('@mail.ru')){
                Task customTask=new Task();
                customTask.Subject='Call to customer';
                customTask.WhoId=cnt.Id;
                arrTask.add(customTask);
            }
            else{
                cnt.addError('Inappropriate email');
            }
        }
        insert arrTask;  
    }
    if(Trigger.isUpdate){
        List<Old_email__c> arrOldMail=new List<Old_email__c>();
        for(Contact cnt:Trigger.New){
            if(string.isBlank(cnt.Email)||!cnt.Email.contains('@mail.ru')){
                if(cnt.Email!=Trigger.oldMap.get(cnt.Id).Email){
                    if(cnt.Email_change_counter__c==null){
                       cnt.Email_change_counter__c=0;
                    }
                    cnt.Email_change_counter__c+=1;
                    Old_email__c tmp=new Old_email__c();
                    tmp.OldEmailValue__c=Trigger.oldMap.get(cnt.Id).Email;
                    tmp.Contact__c=cnt.Id;
                    arrOldMail.add(tmp); 
                }
            }
            else{
                cnt.addError('Inappropriate email');
            }
        }
        insert arrOldMail;  
    }}