# X Exchange

## How to run the project

- Before the running we should enter in terminal:

```Terminal
    ./codegen.sh
```

- After generating all files we can either launch the project from IDE or go to project directory and execute:

```Terminal
    flutter run
```
## Description

Personal Flutter project for the testing assignment for M10. 

## Project folder structure

- Project uses Clean Architecture which separates it into three main layers `data`, `domain`, and `presentation`. 

## State Management 

- [flutter_bloc](https://pub.dev/packages/flutter_bloc) is used for state management. Every widget or screen that needs to be changed has its own `cubit`, which handles its states.

## Local Persistence 

- [hive](https://pub.dev/packages/hive) is used to store the user credentials in the encrypted box. We also have `hive_storage.dart`, which serves as API for interacting with it.

## Remote data

- Data is fetched from the https://api2.binance.com/api/v3/ticker/24hr we display the change percentage for each coin. It is possible to refresh the page with a swipe down.
