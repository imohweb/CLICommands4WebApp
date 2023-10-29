#!/bin/bash
# Resources to create
RESOURCE_GROUP_NAME=my-webapp-rg
APPSERVICE_PLAN_NAME=my-plan$RANDOM
WEBAPP_NAME=my-web-app$RANDOM
DEPLOYMENT_SOURCE=https://github.com/Azure-Samples/html-docs-hello-world
# Create Resource Group
az group create --name $RESOURCE_GROUP_NAME --location eastus
# Create an App Service Plan
az appservice plan create --name $APPSERVICE_PLAN_NAME --resource-group $RESOURCE_GROUP_NAME --location eastus --sku F1
# Create WebApp 
az webapp create --name $WEBAPP_NAME --resource-group $RESOURCE_GROUP_NAME --plan $APPSERVICE_PLAN_NAME
# Deply an app from GitHub to Azure App Service 
az webapp deployment source config --repo-url $DEPLOYMENT_SOURCE --branch master --manual-integration --name $WEBAPP_NAME --resource-group $RESOURCE_GROUP_NAME