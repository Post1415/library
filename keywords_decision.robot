*** Keywords ***
Speedç
    Set Selenium Speed            0.2 seconds
    Set Selenium Implicit Wait    3s
Login to decision
    Open Browser                        https://thinker-sit.blockfint.com/product/login                     headlesschrome
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
