public class CustomExtension {
    private final Contact cnt;
    public CustomExtension(ApexPages.StandardController stdController){
        this.cnt=(Contact)stdController.getRecord();
    }
    
    public void mySave(){
        update cnt;
    }
}