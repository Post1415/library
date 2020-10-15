# *** Settings ***
# Library          SeleniumLibrary
# Suite Setup      Speed
# Test Setup       Login to fullform
# Test Teardown    Close All Browsers    

# *** Keywords ***
# Speed
#    Set Selenium Speed            0.2 seconds
#    Set Selenium Implicit Wait    3s
# Login to fullform
#    Open Browser                        https://thinker-sit.blockfint.com/product/login                     chrome
#    Page Should Contain                 Welcome to Thinker
#    Input Text                          id = email                                                          ${username}
#    Input Text                          id = password                                                       ${password}
#    Click Element                       xpath = //*[@id="__next"]/div/div/div[2]/div/form/button/span[1]
#    Wait Until Page Contains            Library
#    Click Element                       xpath = //*[@id="__next"]/div/div[2]/div[1]/ul/a[2]
#    Wait Until Page Contains Element    xpath = //*[@id="simple-tab-0"]
#    Click Element                       xpath = //*[@id="simple-tab-0"]
# Create new fullform
#    Page Should Contain Element    xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/button
#    Click Element                  xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/button
#    Page Should Contain            Create a new Full Form
#    Page Should Contain            Specific Full Form Detail
#    Page Should Contain            Full Form Name
#    Element Should Be Enabled      xpath = /html/body/div[3]/div[3]/div/div[1]/button
#    Element Should Be Enabled      xpath = /html/body/div[3]/div[3]/div/div[3]/button[1]
#    Element Should Be Enabled      xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
# Search
#    Page Should Contain Element    xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/div/button
#    Click Element                  xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/div/button
#    Page Should Contain Element    xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/div/div[1]/div/input
#    Element Should Be Enabled      xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/div/div[1]/div/div/button
# Click ...
#    Page Should Contain Element    xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[2]/div/div/div[1]
#    Mouse Over                     xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[2]/div/div/div[1]
#    Page Should Contain Element    xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[2]/div/div/div[1]/a/div/button
#    Click Element                  xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[2]/div/div/div[1]/a/div/button
#    Element Should Be Enabled      xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[2]/div/div/div[1]/div/h6[1]
#    Element Should Be Enabled      xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[2]/div/div/div[1]/div/h6[2]
# Rename
#    Click ...
#    Click Element                  xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[2]/div/div/div[1]/div/h6[1]
#    Page Should Contain            Rename the Full Form
#    Page Should Contain            Specific a new name
#    Page Should Contain            Full Form Name
#    Page Should Contain Element    xpath = /html/body/div[3]/div[3]/div/form/div[2]/div/div/div/input
#    Element Should Be Enabled      xpath = /html/body/div[3]/div[3]/div/form/div[1]/button
#    Element Should Be Enabled      xpath = /html/body/div[3]/div[3]/div/form/div[3]/button[1]
#    Element Should Be Enabled      xpath = /html/body/div[3]/div[3]/div/form/div[3]/button[2]
# Clear Full Form Name
#    ${fullformname} =    Get Element Attribute                                                 xpath = /html/body/div[3]/div[3]/div/form/div[2]/div/div/div/input    value
#    ${len} =             Get Length                                                            ${fullformname}
#    FOR                  ${num}                                                                IN RANGE                                                              ${len}
#    Press Keys           xpath = /html/body/div[3]/div[3]/div/form/div[2]/div/div/div/input    BACKSPACE
#    END
# Sort by
#    Element Should Be Enabled    xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/div/div[3]
#    Click Element                xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/div/div[3]
#    Element Should Be Enabled    xpath = //*[@id="menu-"]/div[3]/ul/li[2]
#    Element Should Be Enabled    xpath = //*[@id="menu-"]/div[3]/ul/li[3]
# Delete
#    ${fullform}         Get WebElements                                                                       xpath://*[@id="__next"]/div/div[2]/div[2]/div[2]/div[2]/div/div/div
#    ${len_fullform}     Get Length                                                                            ${fullform}
#    Click ...
#    Click Element       xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[2]/div/div/div[1]/div/h6[2]
#    sleep               2
#    ${fullform1}        Get WebElements                                                                       xpath://*[@id="__next"]/div/div[2]/div[2]/div[2]/div[2]/div/div/div
#    ${len_fullform1}    Get Length                                                                            ${fullform1}
#    ${len_fullform}=    Evaluate                                                                              ${len_fullform}-1
#    Should Be Equal     ${len_fullform}                                                                       ${len_fullform1}

# *** Variables ***
# ${username}    user1@thinker.com
# ${password}    1q2w3e4r

# *** Test Cases ***
# LB-FF-05-19
#    Delete