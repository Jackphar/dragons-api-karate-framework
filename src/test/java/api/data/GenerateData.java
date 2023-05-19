package api.data;

public class GenerateData {
// this method generate random email
	public static String getEmail() {
		String email = "randomEmail";
		String provider = "@tekschool.us";
		int randomNumber = (int) (Math.random() * 1000);
		String autoEmail = email + randomNumber + provider;
		return autoEmail;
	}

//this method generate random phone number
	public static String getPhoneNumber() {
		String phoneNumber = "9";
		for (int i = 0; i < 9; i++) {
			phoneNumber += (int) (Math.random() * 10);
		}
		return phoneNumber;
	}

	// this method generate random license plate
//	public static String getLicensePlate() {
//
//	}
	
//	public static void main(String[] args) {
//	System.out.println(getPhoneNumber());
//}
}


