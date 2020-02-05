# CLI commands

Set up new repo
```
sam init --runtime python3.7 --dependency-manager pip --app-template hello-world --name sample
```

To build the app, at the root of the directory, run the following:
```
sam build
```

To test locally:
```
sam local invoke RandomFunction --event events/event.json
```

To deploy
```
sam build && sam deploy
```
