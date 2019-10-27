# Simple/handy bash stuff

```
if [ $uptime -lt 0 -o $questions -lt 1 -o $slow -gt 10 ] ; then
    some code
fi

PWD="$(pwd)"
SOURCE="${BASH_SOURCE[0]}"
```

Print variable in a string
```
TEST="HI THERE"
ECHO "RANDOM GREETING $TEST"
```

Make dir if it doesn't exist
```
dir=RANDO
[[ -d $dir ]] || mkdir $dir
```

Save to JSON file:
```
JSON_TEXT=$(cat <<EOF
    [
		{
			"ParameterKey": "KeyPairName",
			"ParameterValue": "MyKey"
		}, 
		{
			"ParameterKey": "InstanceType",
			"ParameterValue": "m1.micro"
		}
	]
EOF
)

echo $JSON_TEXT > test.json
```
