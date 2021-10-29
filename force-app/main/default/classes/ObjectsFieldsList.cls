public class ObjectsFieldsList {
    @AuraEnabled
    public static List<string> getAllObjects(){
        List<string> SObjectList = new List<string>();
        for(Schema.SObjectType objTyp : Schema.getGlobalDescribe().Values()){
            String Name = objTyp.getDescribe().getName();
             if(!name.containsignorecase('history') && !name.containsignorecase('tag')&&
    !name.containsignorecase('share') && !name.containsignorecase('feed')){      
      SobjectList.add(name);
      System.debug( 'Name : ' + name);
  }

}
        return SObjectList;
   }
    @AuraEnabled
    public static List<string> getAllFields(String fld){
        List<string> fieldList = new List<string>();
        Map<String,Schema.SObjectType> gd = Schema.getGlobalDescribe();
        Schema.SObjectType sobjType = gd.get(fld);
        Schema.DescribeSObjectResult describeResult = sobjType.getDescribe();
        Map<String,Schema.SObjectField> fieldsMap = describeResult.fields.getMap(); 
        for(string str: fieldsMap.keySet()){
            fieldList.add(fieldsMap.get(str).getDescribe().getLabel());                
        }
        return fieldList;  
    } 
}