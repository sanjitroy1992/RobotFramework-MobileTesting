*** Settings ***
Library    AppiumLibrary
Variables    ../GenericConfiguration/GenericConfig.py
Variables    ../ObjectMap/locators.py
Suite Setup    Open Application    ${Appium_Server}    platformName=${Platform_Name}    deviceName=${Device_Name}    automationName=${Automation_Name}    appPackage=${appPackage}    appActivity=${AppActivity}
Suite Teardown    Close Application  
*** Keywords ***
Mobile Click Element
    [Arguments]    ${Locator}
    [Documentation]    Used to waits until element specified with `locator` appears on current page and click the element identified by `locator`.
    AppiumLibrary.Wait Until Element Is Visible    ${Locator}    ${Timeout}
    AppiumLibrary.Click Element    ${Locator}
Mobile Input Text
    [Documentation]    Used to waits until element specified with `locator` appears on current page and Input Text identified by `locator`.
    [Arguments]    ${locator}    ${text}
    AppiumLibrary.Wait Until Element Is Visible    ${locator}    ${Timeout}
    AppiumLibrary.Input Text    ${locator}    ${text}
*** Test Cases ***
The user goes to amazon.com and searches for an item "Apple iPhone 11 pro max"
    ${Status}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    ${Skip_Sign_In_Loc}    ${Timeout}
    Run Keyword If   '${Status}'=='True'     Mobile Click Element    ${Skip_Sign_In_Loc}  
    Mobile Click Element    ${App_Search_Box_Loc}
    Mobile Input Text    ${App_Search_Box_Loc}    ${Product_Name3}
    Sleep    ${Time}
    Press Keycode    ${Enter}
    Sleep    ${Time}
The user then looks for variants locked to the carrier "Simple Mobile" and verifies whether both "White" and "midnight green" are available as options in the search results page 1
    Mobile Click Element    ${App_Midnight_Green_Product_Loc}
    Sleep    ${Time}
The user sets his US delivery zip code to 90201
    Mobile Click Element    ${App_Enter_Pincode_Loc}
    Mobile Click Element    ${App_Pincode_Text_Area_Loc}
    Clear Text    ${App_Pincode_Text_Area_Loc}
    Mobile Input Text    ${App_Pincode_Text_Area_Loc}    ${PinCode}
    Sleep    ${Time}
    Press Keycode    ${Enter}
    Mobile Click Element    ${App_Pindoce_Apply_Loc}
    
    