# TacticalHashedCryptograph

[<img src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">](https://githubsfdeploy.herokuapp.com/?owner=dannysummerlin&repo=TacticalHashedCryptograph&ref=main)

a Salesforce Lightning Flow Action to create a one-way hash from a given value; can be used to create a secure queryable field from an encrypted or hidden field

### Intergration
You can use Javascript to get an SHA-256 value by using a function like
```Javascript
const hash = (string)=>{
	const utf8 = new TextEncoder().encode(string)
	return crypto.subtle.digest('SHA-256', utf8).then((hashBuffer) => {
		const hashArray = Array.from(new Uint8Array(hashBuffer))
		const hashHex = hashArray
			.map((bytes) => bytes.toString(16).padStart(2, '0'))
			.join('')
		return hashHex
	})
}
```
