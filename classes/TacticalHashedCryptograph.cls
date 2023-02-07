public class TacticalHashedCryptograph {
	public class TacticalHashedCryptographException extends Exception {}

	@InvocableMethod(label='Create One-way Hash' description='Uses a secure algorithm to convert a protected value to a publicly useful piece of information')
	public static List<sObject> hash(List<TacticalHashedCryptograph.inputData> inputs) {
		List<String> outputs = new List<String>();
		for(TacticalHashedCryptograph.inputData input : inputs) {
			try {
				Blob hashedValue = Crypto.generateDigest(input.hashType, (Blob)input.source);
				outputs.add(hashedValue);
			} catch(Exception e) {
				throw newTacticalHashedCryptographException(e.getMessage());
			}
		}
		return outputs;
	}
	public class inputData {
		@AuraEnabled @InvocableVariable(label='Source Value' description='Data to be secured' required=true)
		public string source;
		@AuraEnabled @InvocableVariable(label='Hashing Algorithm' description='Select an algorithm supported by Salesforce (if it left blank the default is SHA-256)')
		public String hashType;
		private List<String> algorithms = ["MD5","SHA1","SHA3-256","SHA3-384","SHA3-512","SHA-256","SHA-512"];

		public comparisonData() { this.hashType = 'SHA-256'; }
		public comparisonData(String s) {
			this.source = s;
			this.hashType = 'SHA-256'
		}
		public comparisonData(String s, String h) {
			this.source = s;
			if(!this.algorithms.contains(h)) {
				h = 'SHA-256';
			}
			this.hashType = h;
		}
	}
	static TacticalHashedCryptographException newTacticalHashedCryptographException(String message) {
		TacticalHashedCryptographException err = new TacticalHashedCryptographException(message);
		err.setMessage(message);
		return err;
	}
}
