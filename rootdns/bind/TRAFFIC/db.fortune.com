;Traffic-WebHost
$TTL	86400
@	IN	SOA	@	ns1.fortune.com. 42 3H 15M 1W 1D
@	IN	NS		ns1.fortune.com.
@	IN	MX	10	fortune.com.
@	IN	A		13.249.85.47
mail	IN	A		13.249.85.47
www	IN	A		13.249.85.47
ns1	IN	A		198.41.0.4