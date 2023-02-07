@isTest
private class TacticalHashedCryptographTest {
	@isTest static void ObjectTest() {
		TacticalHashedCryptograph.inputData testData = new TacticalHashedCryptograph.inputData();
		Account source = new Account();
		source.Name = 'First Account';
		testData.source = source.Name;
		List<String> results = TacticalHashedCryptograph.hash(new List<TacticalHashedCryptograph.inputData>{testData});
	}
	@isTest static void SimpleTest() {
		TacticalHashedCryptograph.inputData testData = new TacticalHashedCryptograph.inputData('test','not real');
		List<String> results = TacticalHashedCryptograph.hash(new List<TacticalHashedCryptograph.inputData>{testData});
	}
	@isTest static void ExceptionTest() {
		Boolean exceptionOccurred = false;
		try {
			TacticalHashedCryptograph.inputData testData = new TacticalHashedCryptograph.inputData();
			Opportunity source = new Opportunity();
			source.Id = 'Invalid Blob';
			testData.source = (String)source.get('Id');
			List<String> results = TacticalHashedCryptograph.hash(new List<TacticalHashedCryptograph.inputData>{testData});
		} catch(Exception e) {
			TacticalHashedCryptograph.TacticalHashedCryptographException n = TacticalHashedCryptograph.newTacticalHashedCryptographException(e.getMessage());
			exceptionOccurred = true;
		}
		System.assert(exceptionOccurred, 'An Exception was not thrown');
	}
}
