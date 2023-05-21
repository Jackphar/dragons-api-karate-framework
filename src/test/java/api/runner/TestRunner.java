package api.runner;

import com.intuit.karate.junit5.Karate;

public class TestRunner {
	
	@Karate.Test
	public Karate TestRunner() {
		return Karate.run("classpath:features")
				.tags("Regression");	
		
	}

}
