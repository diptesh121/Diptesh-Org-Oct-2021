public class StringArrayTest {
        public static String[] generateStringArray(Integer length) {
        String[] myArray = new List<String>();
        for(Integer i=0;i<length;i++) {
           myArray.add('Test ' + i);

            System.debug(myArray[i]);
        } 
        return myArray;
    }     
}