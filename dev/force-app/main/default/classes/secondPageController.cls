public class secondPageController {
    public String LastName{get;set;}
    public String Email{get;set;}
    public String Phone{get;set;}
    public String OtherPhone{get;set;}
    public String Fax{get;set;}
    public String AssistantName{get;set;}
    public String AssistantPhone{get;set;}
    public String MobilePhone{get;set;}
    public String TaxcountryC{get;set;}
    public String TaxcityC{get;set;}
    public String selectedCountry2{get;set;}
	public String selectedCountry3{get;set;}
    
    public Integer counter{get;set;}
    public Integer limitSize {get;set;}
    public Integer totalSize {get;set;} 
public secondPageController()
{
    counter=0;
    limitSize=10;
}
    
    public List<SelectOption> getCountriesOptions() {
        List<SelectOption> countryOptions = new List<SelectOption>();
        countryOptions.add(new SelectOption('--None--','--None--'));
        countryOptions.add(new SelectOption('Ukraine','Ukraine'));
        countryOptions.add(new SelectOption('Poland','Poland'));
        countryOptions.add(new SelectOption('USA','USA'));
        return countryOptions;
    }
     
    public List<SelectOption> getCityOptions() {
        List<SelectOption> cityOptions = new List<SelectOption>();
        if(selectedCountry2=='--None--')cityOptions.add(new SelectOption('--None--','--None--'));
        else if(selectedCountry2=='Ukraine'){
            cityOptions.add(new SelectOption('--None--','--None--'));
             cityOptions.add(new SelectOption('Kiyv','Kiyv'));
             cityOptions.add(new SelectOption('Lviv','Lviv'));
             cityOptions.add(new SelectOption('Dnipro','Dnipro'));
        }else if(selectedCountry2=='Poland'){
            cityOptions.add(new SelectOption('--None--','--None--'));
             cityOptions.add(new SelectOption('Warsaw','Warsaw'));
             cityOptions.add(new SelectOption('Krakow','Krakow'));
             cityOptions.add(new SelectOption('Wroclaw','Wroclaw'));
        }
        else if(selectedCountry2=='USA'){
            cityOptions.add(new SelectOption('--None--','--None--'));
             cityOptions.add(new SelectOption('LA','LA'));
             cityOptions.add(new SelectOption('NY','NY'));
             cityOptions.add(new SelectOption('NOLA','NOLA'));
        }
        else{cityOptions.add(new SelectOption('--None--','--None--'));}
      return cityOptions;
    }
    
    public void setCountries(String[] countries) {
            this.selectedCountry2 = selectedCountry2;
        }
         
    public  List<Contact> getContacts(){
        List<Contact> result=[SELECT LastName,Email FROM Contact limit :limitSize OFFSET :counter];
        totalSize=result.size();
        return result;
    }

    public void next(){ 
        counter+=limitSize;
    }
    public void previous(){
        counter-=limitSize;
    }
    
    
    
    public pageReference  Save(){
        Contact ct=new Contact(LastName=LastName,Email=Email,Phone=Phone,
                               OtherPhone=OtherPhone,Fax=Fax,AssistantName=AssistantName,
                               AssistantPhone=AssistantPhone,MobilePhone=MobilePhone,
                               Tax_country__c=TaxcountryC,Tax_city__c=TaxcityC);
        insert ct;
        return null;
    }
}