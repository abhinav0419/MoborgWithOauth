import java.util.Date;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import com.mob.model.LocationLogs;
import com.mob.model.OfficeAddress;
import com.mob.model.Title;
import com.mob.model.User;



public class MainClass {
	public static void main(String[] args) {
		

//		System.out.println(DispatcherServlet.WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		Session session = Util.getSessionFactory().openSession();
		session.beginTransaction();
		try {
			Title title = new Title();
			title.setTitleName("Resource Manager");
			
			OfficeAddress officeAddress = new OfficeAddress();
			officeAddress.setAddressLine1("address line 1");
			officeAddress.setAddressLine2("address line 2");
			officeAddress.setCity("ahmedabad");
			officeAddress.setState("gujarat");
			officeAddress.setOfficeContactNo("21312123");
			officeAddress.setZipCode("23423");
			officeAddress.setCountry("india");
			officeAddress.setOfficeContactNo("3242342");
			officeAddress.setLatitude(23432.23423);
			officeAddress.setLongitude(23432.23423);
		//	officeAddress.setOfficeName("Atlanta");
			
			LocationLogs locationLogs = new LocationLogs();
			locationLogs.setCity("ahm");
			locationLogs.setCountry("india");
			locationLogs.setIpAddress("192.168.300.33");
			locationLogs.setLatitude(2323.2323);
			locationLogs.setLongitude(543.23424);
			locationLogs.setState("gujarat");
			locationLogs.setCurrentDate(new Date());
			
			
			User user1 = new User();
			user1.setActive(true);
			user1.setContactNo("123123213");
			user1.setEmailId("rnair@mobiquityinc.com");
			user1.setFullName("ronak shah");
			user1.setHobbies("riding horse");
			user1.setOfficeContactNo("223-12312-21312");
			user1.setOfficeLocationId(officeAddress);
			user1.setResourceManager(true);
			user1.setTitleId(title);
			user1.setResourceManagerId(1l);
			user1.setJobDescription("computer engg");

		//	user1.setLocationLogs(locationLogs);

//			user1.setLocationLogs(locationLogs);

			
			locationLogs.setUserId(user1);
			session.save(title);
			session.save(officeAddress);
			session.save(locationLogs);
			session.save(user1);
		} catch (HibernateException e) {
			e.printStackTrace();
		} finally {
			session.getTransaction().commit();
			session.close();
		}

	}
}
