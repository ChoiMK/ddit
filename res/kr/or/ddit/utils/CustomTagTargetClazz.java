package kr.or.ddit.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CustomTagTargetClazz {
   public static Integer plus(Integer i, Integer j){
      return i+j;
   }
   public static String today(Date date){
      SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
      String returnValue = dateFormat.format(new Date());
      return returnValue;
   }
   // 1234가나다라5678라마바사 = 라 가 몇번 반복 반환9
   public static Integer charCount(String target, String delim){
      int idx = target.indexOf(delim);
      int cnt = 0;
      for(; idx != -1; cnt++){
         target = target.substring(target.indexOf(delim)+1, target.length());
         idx = target.indexOf(delim);
      }
      return cnt;
   }
}