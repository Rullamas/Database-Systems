import java.sql.*;
import java.util.*;

/**
 * The class implements methods of the video and bookstore database
 * interface.
 *
 * All methods of the class receive a Connection object through which all
 * communication to the database should be performed. Note: the
 * Connection object should not be closed by any method.
 *
 * Also, no method should throw any exceptions. In particular, in case
 * that an error occurs in the database, then the method should print an
 * error message and call System.exit(-1);
 */
public class StoreApplication {

	/**
	 * Return a list of phone numbers of customers, given a first name and
	 * last name.
	 */
	public List<String> getCustomerPhoneFromFirstLastName(Connection connection,
			String firstName, String lastName) {
		List<String> result = new ArrayList<String>();
		try {
			Statement stmt = connection.createStatement();
			ResultSet res = stmt.executeQuery(" SELECT dva.phone FROM dv_address dva, dv_customer dvc WHERE dvc.first_name = '" + firstName + "' AND dvc.last_name = '" + lastName + "' AND dvc.address_id = dva.address_id");
			if (res != null) {
				while (res.next()){
					result.add(res.getString(1));
				}
			}
			res.close();
			stmt.close();
		} catch(Exception exc) {
			System.err.println("Exception caught.\n " + exc);
			exc.printStackTrace();
			System.exit(-1);
		}
		
		return result;
	}

	/**
	 * Return list of film titles whose length is is equal to or greater
	 * than the minimum length, and less than or equal to the maximum
	 * length.
	 */
	public List<String> getFilmTitlesBasedOnLengthRange(Connection connection,
			int minLength, int maxLength) {
		List<String> result = new LinkedList<String>();
		try {
			Statement stmt = connection.createStatement();
			ResultSet res = stmt.executeQuery(" SELECT dvf.title FROM dv_film dvf WHERE dvf.length >= " + minLength + " AND dvf.length <= " + maxLength);
			if (res != null) {
				while (res.next()){
					result.add(res.getString(1));
				}
			}
			res.close();
			stmt.close();
		} catch(Exception exc) {
			System.err.println("Exception caught.\n " + exc);
			exc.printStackTrace();
			System.exit(-1);
		}
		
		return result;
	}

	/**
	 * Return the number of customers that live in a given district and
	 * have the given active status.
	 */
	public final int countCustomersInDistrict(Connection connection,
			String districtName, boolean active) {
		int result = -1;
		try {
			Statement stmt = connection.createStatement();
			ResultSet res = stmt.executeQuery(" SELECT COUNT(dva.district) FROM dv_address dva, mg_customers mgc WHERE  mgc.address_id = dva.address_id AND mgc.active = " + active + " AND dva.district = '" + districtName + "' GROUP BY dva.district");
			if (res != null) {
				while (res.next()){
					result = Integer.parseInt(res.getString(1));
				}
			}
			res.close();
			stmt.close();
		} catch(Exception exc) {
			System.err.println("Exception caught.\n " + exc);
			exc.printStackTrace();
			System.exit(-1);
		}
		
		return result;
	}

	/**
	 * Add a film to the inventory, given its title, description,
	 * length, and rating.
	 *
	 * Your query will need to cast the rating parameter to the
	 * enumerared type mpaa_rating. Whereas an uncast parameter is
	 * simply a question mark, casting would look like ?::mpaa_rating 
	 */
	public void insertFilmIntoInventory(Connection connection, String
			title, String description, int length, String rating)
	{
	try {
			PreparedStatement stmt = connection.prepareStatement("INSERT INTO dv_film (title, description, length, rating) VALUES ('" + title + "', '" + description + "', " + length + ", '" + rating + "')");
			stmt.executeUpdate();
			stmt.close();
		} catch(Exception exc) {
			System.err.println("Exception caught.\n " + exc);
			exc.printStackTrace();
			System.exit(-1);
		}
		
	}

	/**
	 * Constructor
	 */
	public StoreApplication()
	{}

};
