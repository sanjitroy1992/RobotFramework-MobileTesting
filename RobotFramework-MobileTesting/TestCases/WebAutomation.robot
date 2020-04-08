*** Settings ***
Library    SeleniumLibrary
Variables    ../GenericConfiguration/GenericConfig.py
Variables    ../ObjectMap/locators.py
Suite Setup    Wait Until Keyword Succeeds    5x    1s    Open Browser    ${Amazon_Url}    ${Browser}    executable_path=${EXECDIR}\\Drivers\\chromedriver.exe
Suite Teardown    Close All Browsers
*** Keywords ***
Mx Click Element
    [Arguments]    ${Locator}
    [Documentation]    Used to waits until element specified with `locator` appears on current page and click the element identified by `locator`.
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator}    ${Timeout}
    SeleniumLibrary.Click Element    ${Locator}
Mx Input Text
    [Documentation]    Used to waits until element specified with `locator` appears on current page and Input Text identified by `locator`.
    [Arguments]    ${locator}    ${text}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${Timeout}
    SeleniumLibrary.Input Text    ${locator}    ${text}
*** Test Cases ***
The user goes to amazon.com and searches for an item "Apple iPhone 11 pro max"
    Maximize Browser Window
    SeleniumLibrary.Wait Until Element Is Visible    ${Search_Box_Loc}    ${Timeout}
    Mx Input Text    ${Search_Box_Loc}    ${Product_Name1}
    Press Keys    ${Search_Box_Loc}    ENTER
The user then looks for variants locked to the carrier "Simple Mobile" and verifies whether both "White" and "midnight green" are available as options in the search results page 1
    ${Status}    Run Keyword And Return Status     Run Keywords    SeleniumLibrary.Wait Until Element Is Visible    ${Iphone_Midnight_Green_Loc}    ${Timeout}    AND    Scroll Element Into View    ${Iphone_Midnight_Green_Loc}
    Run Keyword If    '${Status}' == 'True'    Log    Apple Midnight Green as Simple Mobile is available    ELSE    Log    Apple Midnight Green as Simple Mobile not available
    ${Status}    Run Keyword And Return Status     SeleniumLibrary.Wait Until Element Is Visible    ${Iphone_White_Loc}    ${Timeout}
    Run Keyword If    '${Status}' == 'True'    Log    Apple Midnight Green as Simple Mobile is available    ELSE    Log    Apple White as Simple Mobile not available    
The user selects the "Midnight Green" variant and moves on to the product page
    Scroll Element Into View    ${Search_Box_Loc}
    Mx Input Text    ${Search_Box_Loc}    ${Product_Name2}
    Press Keys    ${Search_Box_Loc}    ENTER
    Mx Click Element    ${Product2_Loc}
The user adds the product to the cart. The user ignores the additional suggestions offered and clicks on proceed to cart. On doing so the user is prompted to log in. 
    Mx Click Element    ${Add_To_Cart_loc}
    Mx Click Element    ${Proceed_To_Checkout_Loc}
    Wait Until Element Contains    ${Sign_In_Loc}    ${Sign_In_Text}