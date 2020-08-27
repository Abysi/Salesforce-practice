trigger AccountTrigger on Account (before insert) {
   public final static String s='0';
   ParentClass.callout();
}