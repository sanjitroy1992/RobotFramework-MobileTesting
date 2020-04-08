The project is build using Robot Framework AppiumLibrary for mobile web browsers using an open-source testing solution. 

To run the Mobile Test case please follow the below steps.
1. Clone the project.
2. Let's say you have extracted the project under  'D:\Project' path. now go in inside the project by navigating to 'D:\Project\TestAutomationAssignment' path.
3. Open cmd and type the below command to run the test case.
To run Mobile Test:
robot -P "D:\Project\TestAutomationAssignment\venv\Lib\site-packages" TestCases\MobileWebAutomation.robot


PREREQUISITES
 - Java installed on system
 - JAVA_HOME is set in environment variables
 command to check : java -version
 - An android mobile device
 - Connecting cable
 - 200 MB to 1 GB of free space

Step 1 : Download SDK tools
 https://developer.android.com/studio
----------------------------------------------------------------------------------
Step 2 : Unzip folder & Extract platform tools
----------------------------------------------------------------------------------
Step 3 : Set environment variables
 ANDROID_HOME = location of sdk folder
 Path : append path of platform_tools folder
----------------------------------------------------------------------------------
Step 4 : Check command adb devices on command line
----------------------------------------------------------------------------------
Step 5 : Make device ready
 - enable developer mode
 - make USB Debugging on
----------------------------------------------------------------------------------
Step 6 : Connect device to computer system thorugh USB cable
 - if asked enable USB Debbugging
----------------------------------------------------------------------------------
Step 7 : Run command adb devices
  adb = android debug bridge
 Check your device id displayed


1. Install Appium from:https://github.com/appium/appium-desktop/releases/tag/v1.15.1

commands:

adb devices
--> This will show the list of all the mobile devices connected to the windows.

2. To see the current app info(make sure app is open in phone):
adb shell
$ dumpsys window windows | grep -E 'mCurrentFocus'

--> this will give the apkpackage name.

3. Open App info app to see the appActivity

4. Desire capabilities:

AmazonApp desire capabilities:
{
  "automationName": "Appium",
  "platformName": "Android",
  "platformVersion": "8.0.0",
  "deviceName": "ce11160bab38a11e04",
  "appPackage": "in.amazon.mShop.android.shopping",
  "appActivity": "com.amazon.mShop.home.HomeActivity"
}
----------------------------------------------------------------------------------
BigbasketApp desire capabilities:
{
  "automationName": "Appium",
  "platformName": "Android",
  "platformVersion": "8.0.0",
  "deviceName": "ce11160bab38a11e04",
  "appPackage": "com.bigbasket.mobileapp",
  "appActivity": "com.bigbasket.mobileapp.activity.SplashActivity"
}
----------------------------------------------------------------------------------
Links:
1. Appium Desired Capabilities:http://appium.io/docs/en/writing-running-appium/caps/
2. KeyEvent: https://developer.android.com/reference/android/view/KeyEvent
----------------------------------------------------------------------------------
