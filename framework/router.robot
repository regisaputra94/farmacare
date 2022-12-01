*** Settings ***
## Library
Library             SeleniumLibrary
Library             OperatingSystem
Library             String

## Setting Config
Resource            config.robot
Resource            base.robot

## Data
Resource            ../properties/data.robot

## Page Objects
Resource            ../pageObjects/Homepage.robot
Resource            ../pageObjects/LoginPage.robot