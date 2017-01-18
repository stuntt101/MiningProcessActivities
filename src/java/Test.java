
import com.activities.entities.SubActivity;
import com.activities.services.SubActivityService;
import static java.util.Collections.list;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ERavhengani
 */
public class Test {
    public static void main (String [] me){
     SubActivityService subActivityService = new SubActivityService();
     List<SubActivity> list2 = subActivityService.getAllSubActivities();
     
     for(SubActivity sb:list2){
    
    System.out.println(sb.getSubActivityName());
}
    }
}
