*** Settings ***
Library          SeleniumLibrary
Suite Setup      Speed
Test Setup       Login to decision
Test Teardown    Close All Browsers    

*** Keywords ***
Speed
    Set Selenium Speed            0.2 seconds
    Set Selenium Implicit Wait    3s
Login to decision
    Open Browser                        https://thinker-sit.blockfint.com/product/login                     chrome
    Page Should Contain                 Welcome to Thinker
    Input Text                          id = email                                                          ${username}
    Input Text                          id = password                                                       ${password}
    Click Element                       xpath = //*[@id="__next"]/div/div/div[2]/div/form/button/span[1]
    Wait Until Page Contains            Library
    Click Element                       xpath = //*[@id="__next"]/div/div[2]/div[1]/ul/a[2]
    Wait Until Page Contains Element    xpath = //*[@id="simple-tab-1"]
    Click Element                       xpath = //*[@id="simple-tab-1"]
Create new Tree
    Page Should Contain Element    xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/button
    Click Element                  xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/button
    Page Should Contain            Create a new Tree
    Page Should Contain            Specific Tree Detail
    Page Should Contain            Tree Name
    Page Should Contain            Tree Name
    Page Should Contain            Tree ID
    Element Should Be Enabled      xpath = /html/body/div[3]/div[3]/div/div[3]/button
    Element Should Be Enabled      xpath = /html/body/div[3]/div[3]/div/div[3]/button[1]
    Element Should Be Enabled      xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
Search
    Page Should Contain Element    xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/div/button
    Click Element                  xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/div/button
    Page Should Contain Element    xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/div/div[1]/div/input
    Element Should Be Enabled      xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/div/div[1]/div/div/button
Click ...
    Page Should Contain Element    xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[3]/div/div/div[1]
    Mouse Over                     xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[3]/div/div/div[1]
    Page Should Contain Element    xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[3]/div/div/div[1]/a/div/button
    Click Element                  xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[3]/div/div/div[1]/a/div/button
    Element Should Be Enabled      xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[3]/div/div/div[1]/div/h6[1]
    Element Should Be Enabled      xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[3]/div/div/div[1]/div/h6[2]
Rename
    Click ...
    Click Element                  xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[3]/div/div/div[1]/div/h6[1]
    Page Should Contain            Rename the Tree
    Page Should Contain            Specific a new name
    Page Should Contain            Tree Name
    Page Should Contain Element    xpath = /html/body/div[3]/div[3]/div/form/div[2]/div/div/div/input
    Element Should Be Enabled      xpath = /html/body/div[3]/div[3]/div/form/div[1]/button
    Element Should Be Enabled      xpath = /html/body/div[3]/div[3]/div/form/div[3]/button[1]
    Element Should Be Enabled      xpath = /html/body/div[3]/div[3]/div/form/div[3]/button[2]
Clear Tree Name
    ${treename} =    Get Element Attribute                                                 xpath = /html/body/div[3]/div[3]/div/form/div[2]/div/div/div/input    value
    ${len} =         Get Length                                                            ${treename}
    FOR              ${num}                                                                IN RANGE                                                              ${len}
    Press Keys       xpath = /html/body/div[3]/div[3]/div/form/div[2]/div/div/div/input    BACKSPACE
    END
Clear Tree ID
    ${treeid} =    Get Element Attribute                                               xpath = /html/body/div[3]/div[3]/div/div[2]/div[2]/div/div/input    value
    ${len} =       Get Length                                                          ${treeid}
    FOR            ${num}                                                              IN RANGE                                                            ${len}
    Press Keys     xpath = /html/body/div[3]/div[3]/div/div[2]/div[2]/div/div/input    BACKSPACE
    END
Sort by
    Element Should Be Enabled    xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/div/div[3]
    Click Element                xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/div/div[3]
    Element Should Be Enabled    xpath = //*[@id="menu-"]/div[3]/ul/li[2]
    Element Should Be Enabled    xpath = //*[@id="menu-"]/div[3]/ul/li[3]
Delete
    ${decision}         Get WebElements                                                                       xpath://*[@id="__next"]/div/div[2]/div[2]/div[2]/div[3]/div/div/div
    ${len_decision}     Get Length                                                                            ${decision}
    Click ...
    Click Element       xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[3]/div/div/div[1]/div/h6[2]
    sleep               2
    ${decision1}        Get WebElements                                                                       xpath://*[@id="__next"]/div/div[2]/div[2]/div[2]/div[3]/div/div/div
    ${len_decision1}    Get Length                                                                            ${decision1}
    ${len_decision}=    Evaluate                                                                              ${len_decision}-1
    Should Be Equal     ${len_decision}                                                                       ${len_decision1}

*** Variables ***
${username}    user1@thinker.com
${password}    1q2w3e4r

*** Test Cases ***
LB-DC-04-21
    Create new Tree               
    Input Text                    xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    tmmm
    Page Should Contain           tmmm
    Capture Element Screenshot
# # LB-DC-04-22
# #    Create new Tree        
# #    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    tt2
# #    Clear Tree ID
# #    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[2]/div/div/input    กกก
# #    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
# #    Page Should Contain    tt2
# LB-DC-04-23
#    Create new Tree        
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    tt3
#    Clear Tree ID
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[2]/div/div/input    test1234567
#    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
#    Page Should Contain    tt3
# # LB-DC-04-24
# #    Create new Tree        
# #    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    tt4
# #    Clear Tree ID
# #    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[2]/div/div/input    กก12345
# #    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
# #    Page Should Contain    tt4
# LB-DC-04-25
#    Create new Tree        
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    tt5
#    Clear Tree ID
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[2]/div/div/input    1234567
#    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
#    Page Should Contain    Can not have space in prefix and postfix
# LB-DC-04-26
#    Create new Tree        
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    tt6
#    Clear Tree ID
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[2]/div/div/input    -
#    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
#    Page Should Contain    Can not have space in prefix and postfix
# LB-DC-04-27
#    Create new Tree        
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    tt7
#    Clear Tree ID
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[2]/div/div/input    test--
#    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
#    Page Should Contain    tt7
# LB-DC-04-28
#    Create new Tree        
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    tt8
#    Clear Tree ID
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[2]/div/div/input    -test
#    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
#    Page Should Contain    Can not have space in prefix and postfix
# LB-DC-04-29
#    Create new Tree        
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    tt9
#    Clear Tree ID
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[2]/div/div/input    ${SPACE}
#    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
#    Page Should Contain    Can not have space in prefix and postfix
# LB-DC-04-30
#    Create new Tree        
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    tt10
#    Clear Tree ID
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[2]/div/div/input    a${SPACE}aa
#    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
#    Page Should Contain    Can not have space in prefix and postfix
# LB-DC-04-31
#    Create new Tree        
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    tt11
#    Clear Tree ID
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[2]/div/div/input    AA
#    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
#    Page Should Contain    Can not have space in prefix and postfix
# LB-DC-04-32
#    Create new Tree        
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    tt12
#    Clear Tree ID
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[2]/div/div/input    test
#    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
#    Page Should Contain    test is already used