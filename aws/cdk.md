# how to start a new boilerplate with cdk v2

## initial installation and setup
```
cdk init app --language python
source .venv/bin/activate
pip install -r requirements.txt
```
 
## build
```
sam-beta-cdk build --use-container
```
 
## check what we have
```
cdk synth
```
