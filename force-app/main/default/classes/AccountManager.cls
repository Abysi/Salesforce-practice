@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    @HttpGet 
    global  static Account getAccount(){
        RestRequest req= RestContext.request;
        List<String> reqUrl = req.requestURI.split('/');
        String accId=reqUrl[reqUrl.size()-2];
        system.debug('accId - ' + accId);
        Account result=[Select Id,Name,(Select Id,Name From Contacts) From Account Where Id=:accId];
        return result;
        
       
    }
}