
import com.activities.entities.Activities;
import com.activities.entities.FocusArea;
import com.activities.entities.LeadingPractice;
import com.activities.entities.ProcessActivity;
import com.activities.entities.SubActivity;
import com.activities.services.ActivitiesService;
import com.activities.services.LeadingPracticeService;
import com.activities.services.SubActivityService;
import static java.util.Collections.list;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * getLeadingPracticeByFocusAreaProcessActivitySubActivity2
 * @author ERavhengani
 */
public class Test {
    public static void main (String [] me){
     LeadingPracticeService leadingPracticeService = new LeadingPracticeService();
     ActivitiesService aService = new ActivitiesService();
     
     
//     List<SubActivity> list2 = subActivityService.getAllSubActivities();
 String focusAreaname1 = "OHS";
FocusArea focusArea =  new FocusArea(focusAreaname1);
 String paName = "Stopping";
 String saName = "Blasting";
 List<Activities> list = aService.getActivitiesBySubActivityName(new ProcessActivity(paName), new SubActivity(saName));
 


   System.out.println(list.size());

    }
}
