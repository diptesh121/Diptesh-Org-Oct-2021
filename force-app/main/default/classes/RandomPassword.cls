public class RandomPassword {
    public static void randomPass(){
    Integer len = 10;
Blob blobKey = crypto.generateAesKey(128);
String key = EncodingUtil.convertToHex(blobKey);
String pwd = key.substring(0,len);
//System.debug('pwd---'+pwd);
system.debug('pass--'+pwd);
    }
}