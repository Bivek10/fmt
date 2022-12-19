# fmt

A new Flutter project.

Getting Started
This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

Lab: Write your first Flutter app
Cookbook: Useful Flutter samples
For help getting started with Flutter development, view the online documentation, which offers tutorials, samples, guidance on mobile development, and a full API reference.

It uses get_cli tool for the creating views,controller and the binding.(https://pub.dev/packages/get_cli)

Git Cli Tool Command:
// To install: pub global activate get_cli // (to use this add the following to system PATH: [FlutterSDKInstallDir]\bin\cache\dart-sdk\bin

flutter pub global activate get_cli

// To create a flutter project in the current directory: // Note: By default it will take the folder's name as project name // You can name the project with get create project:my_project // If the name has spaces use get create project:"my cool project" get create project

// To generate the chosen structure on an existing project: get init

// To create a page: // (Pages have controller, view, and binding) // Note: you can use any name, ex: get create page:login // Nota: use this option if the chosen structure was Getx_pattern get create page:home

// To create a screen // (Screens have controller, view, and binding) // Note: you can use any name, ex: get screen page:login // Nota: use this option if the chosen structure was CLEAN (by Arktekko) get create screen:home

// To create a new controller in a specific folder: // Note: you don't need to reference the folder, // Getx will search automatically for the home folder // and add your controller there. get create controller:dialogcontroller on home

// To create a new view in a specific folder: // Note: you don't need to reference the folder, // Getx will automatically search for the home folder // and insert your view there. get create view:dialogview on home

// To create a new provider in a specific folder: get create provider:user on home

// To generate a localization file: // Note: 'assets/locales' directory with your translation files in json format get generate locales assets/locales

// To generate a class model: // Note: 'assets/models/user.json' path of your template file in json format // Note: on == folder output file // Getx will automatically search for the home folder // and insert your class model there. get generate model on home with assets/models/user.json

//to generate the model without the provider get generate model on home with assets/models/user.json --skipProvider

//Note: the URL must return a json format get generate model on home from "https://api.github.com/users/CpdnCristiano"

// To install a package in your project (dependencies): get install camera

// To install several packages from your project: get install http path camera

// To install a package with specific version: get install path:1.6.4

// You can also specify several packages with version numbers

// To install a dev package in your project (dependencies_dev): get install flutter_launcher_icons --dev

// To remove a package from your project: get remove http

// To remove several packages from your project: get remove http path

// To update CLI: get update // or get upgrade

// Shows the current CLI version: get -v // or get -version

// For help get help

# =============== start===============

// Flutter Circle-ci integration and Fastlane configuration

// step to setup Cricle ci:

// step1: Create the flutter demo project :# flutter create flutter_demo
// step2: Create a folder named .circleci in the project's root directory:# md .circleci
// step3: Create a file named config.yml: # touch .circleci/config.yml
// step4: Then, add the following at the topmost part of the file:
jobs:
build:
docker: - image: cirrusci/flutter
steps: - checkout - run: flutter doctor - run: flutter test - run: flutter build apk --release - store_artifacts:
path: build/app/outputs/flutter-apk/app-release.apk
// step5: Integrates Circle CI with GitHub and other platforms like Bitbucket.

# =============== End ===============

# ==============Start==================

// help for fastlane setup in linux:
step:1 In order to setup the fastlane firstly, we need to install the ruby

# sudo apt install ruby ruby-dev

step:2 Add the following to top of "~/.profile" file : # .profile located in user director example home/user.

# export LC_ALL=en_US.UTF-8

# export LANG=en_US.UTF-8

step 3: Check of any errors with source ~/.profile command. If there is not output means all is good.

# ~/.profile

step4: Install Build essentials

# sudo apt-get update

# sudo apt-get install build-essential

step5: Fastlane depends on Google API Clint lets install that first

# sudo gem install google-api-client

step6: Install Fastlane

# sudo gem install fastlane -NV

step7: Check installation
Check your installation

# ================End============

# ================Start============

// fastlane setup for android project
step1: open the flutter project
setp2: cd to android folder
step3: enter following command

# fastlane init

enter the answer asked in terminal and
once setup is compelted fastlane folder is created inside the
android directory.

# ================End============

To deploy the build apk  in firebase, using firebase follow following steps:
# create firebase project
# add the applicaiton package id to firebase project.
# download the google-services.json file and placed it into <projectname>/android/app/.
# apply the google-service.json file in app-level build.gradle file 
# like this: apply plugin:'com.google.gms.google-services'

// once the firebase project setup is done click the app distribution tab
# located on left menu bar.
# click on create start.
# create the test user groups.
# all done..


# ============Start=============
To upload the apk bundle in app distribution test group.
Install firebase_app_distribution plugin inside the android directory by following commands.
# fastlane add_plugin firebase_app_distribution
Once the plugin is added.. 
Open the Fastlane file inside the fastlane folder.
# past the below code. 

platform:android do
  desc "Deploy to Firebase"
  lane:deploy do
  begin
     #(start) add this
     firebase_app_distribution(
         groups:"tester_group_name",
         release_notes:"Bug fixes and improvements.",
         apk_path:"../build/app/outputs/flutter-apk/app-release.apk",
         firebase_cli_path:"/home/bivek/nodejs/bin/firebase",
         firebase_cli_token:<firebase_cli_token>, 
         app:<app_id>, #found in firebase project setting. 
     )
     end
   end
 end

for firebase cli token 
enter following command
# firebase login:ci
You will get the firebase_cli_login_token place it into firebae_cli_token
After that, hit the following command to deploy the build apk in firebase app_distribution.
# fastlane deploy
This command automatically deploy the apk and send the invitation to all tester group memeber..
# =================Thank YOU ===============



# ===============End================
