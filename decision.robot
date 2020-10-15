*** Settings ***
Library          SeleniumLibrary
Suite Setup      Speed
Test Setup       Login to decision
Test Teardown    Close All Browsers    

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

*** Variables ***
${username}    user1@thinker.com
${password}    1q2w3e4r

*** Test Cases ***
LB-DC-01-01
    Element Should Be Enabled    xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/div/button
    Element Should Be Enabled    xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/div/div[3]/div/div
    Element Should Be Enabled    xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/button
LB-DC-03-01
    Sort by
LB-DC-04-01
    Create new Tree
LB-DC-04-02
    Create new Tree
    Click Element              xpath = /html/body/div[3]/div[3]/div/div[3]/button
    Page Should Not Contain    Specific Tree Detail
LB-DC-04-03
    Create new Tree
    Click Element              xpath = /html/body/div[3]/div[3]/div/div[3]/button[1]
    Page Should Not Contain    Specific Tree Detail
LB-DC-04-04
    Create new Tree        
    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    test98
    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
    Page Should Contain    test98
LB-DC-04-05
    Create new Tree        
    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    test
    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
    Page Should Contain    test
# LB-DC-04-06
#    Create new Tree        
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    กก
#    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
#    Page Should Contain    กก
# LB-DC-04-07
#    Create new Tree        
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    test1234
#    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
#    Page Should Contain    test1234
# LB-DC-04-08
#    Create new Tree        
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    กก1234
#    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
#    Page Should Contain    กก1234
# LB-DC-04-09
#    Create new Tree        
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    1234
#    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
#    Page Should Contain    Invalid name
# LB-DC-04-10
#    Create new Tree        
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    _
#    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
#    Page Should Contain    Invalid name
# LB-DC-04-11
#    Create new Tree        
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    ${SPACE}
#    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
#    Page Should Contain    Can not have space in prefix and postfix
# LB-DC-04-12
#    Create new Tree        
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    ${SPACE}${SPACE}${SPACE}
#    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
#    Page Should Contain    Can not have space in prefix and postfix
# LB-DC-04-13
#    Create new Tree        
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    test_
#    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
#    Page Should Contain    test_
# LB-DC-04-14
#    Create new Tree        
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    _test
#    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
#    Page Should Contain    Invalid name
# LB-DC-04-15
#    Create new Tree        
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    @#$
#    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
#    Page Should Contain    Special Character cannot be used
# LB-DC-04-16
#    Create new Tree        
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    ${SPACE}testt
#    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
#    Page Should Contain    testt
# LB-DC-04-17
#    Create new Tree        
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    testtt${SPACE}
#    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
#    Page Should Contain    testtt
# LB-DC-04-18
#    Create new Tree        
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    a${SPACE}a
#    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
#    Page Should Contain    a${SPACE}a
# LB-DC-04-19
#    Create new Tree        
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    a${SPACE}${SPACE}${SPACE}aa
#    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
#    Page Should Contain    a${SPACE}aa
# LB-DC-04-20
#    Create new Tree        
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    test
#    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
#    Page Should Contain    test is already used
# LB-DC-04-21
#    Create new Tree    
#    Input Text         xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    tt1
#    Clear Tree ID
#    Input Text         xpath = /html/body/div[3]/div[3]/div/div[2]/div[2]/div/div/input    zz
#    Click Element      xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
    # Page Should Contain    tt1
# LB-DC-04-22
#    Create new Tree        
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    tt2
#    Clear Tree ID
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[2]/div/div/input    กกก
#    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
#    Page Should Contain    tt2
# LB-DC-04-23
#    Create new Tree        
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    tt3
#    Clear Tree ID
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[2]/div/div/input    test1234567
#    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
#    Page Should Contain    tt3
# LB-DC-04-24
#    Create new Tree        
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[1]/div/div/input    tt4
#    Clear Tree ID
#    Input Text             xpath = /html/body/div[3]/div[3]/div/div[2]/div[2]/div/div/input    กก12345
#    Click Element          xpath = /html/body/div[3]/div[3]/div/div[3]/button[2]
#    Page Should Contain    tt4
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
LB-DC-02-01
    Search
LB-DC-02-02
    ${search}          Get WebElements                                                                       xpath://*[contains(text(), "test")]
    ${len_search}      Get Length                                                                            ${search}
    Search
    Input Text         xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/div/div[1]/div/input    test
    ${search1}         Get WebElements                                                                       xpath://*[contains(text(), "test")]
    ${len_search1}     Get Length                                                                            ${search1}
    Should Be Equal    ${len_search}                                                                         ${len_search1}
# LB-DC-02-03
#    ${search}          Get WebElements                                                                       xpath://*[contains(text(), "กก")]
#    ${len_search}      Get Length                                                                            ${search}
#    Search
#    Input Text         xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/div/div[1]/div/input    test
#    ${search1}         Get WebElements                                                                       xpath://*[contains(text(), "กก")]
#    ${len_search1}     Get Length                                                                            ${search1}
#    Should Be Equal    ${len_search}                                                                         ${len_search1}
LB-DC-02-04
    ${search}          Get WebElements                                                                       xpath://*[contains(text(), "test1234")]
    ${len_search}      Get Length                                                                            ${search}
    Search
    Input Text         xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/div/div[1]/div/input    test1234
    ${search1}         Get WebElements                                                                       xpath://*[contains(text(), "test1234")]
    ${len_search1}     Get Length                                                                            ${search1}
    Should Be Equal    ${len_search}                                                                         ${len_search1}
# LB-DC-02-05
#    ${search}          Get WebElements                                                                       xpath://*[contains(text(), "กก1234")]
#    ${len_search}      Get Length                                                                            ${search}
#    Search
#    Input Text         xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/div/div[1]/div/input    กก1234
#    ${search1}         Get WebElements                                                                       xpath://*[contains(text(), "กก1234")]
#    ${len_search1}     Get Length                                                                            ${search1}
#    Should Be Equal    ${len_search}                                                                         ${len_search1}
LB-DC-02-06
    ${search}          Get WebElements                                                                       xpath://*[contains(text(), "1234")]
    ${len_search}      Get Length                                                                            ${search}
    Search
    Input Text         xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/div/div[1]/div/input    1234
    ${search1}         Get WebElements                                                                       xpath://*[contains(text(), "1234")]
    ${len_search1}     Get Length                                                                            ${search1}
    Should Be Equal    ${len_search}                                                                         ${len_search1}
LB-DC-02-07
    ${search}          Get WebElements                                                                       xpath://*[contains(text(), "_")]
    ${len_search}      Get Length                                                                            ${search}
    Search
    Input Text         xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/div/div[1]/div/input    _
    ${search1}         Get WebElements                                                                       xpath://*[contains(text(), "_")]
    ${len_search1}     Get Length                                                                            ${search1}
    Should Be Equal    ${len_search}                                                                         ${len_search1}
LB-DC-02-08
    ${search}          Get WebElements                                                                       xpath://*[@id="__next"]/div/div[2]/div[2]/div[2]/div/div[2]/div[1]/a/div[contains(text(), " ")]
    ${len_search}      Get Length                                                                            ${search}
    Search
    Input Text         xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/div/div[1]/div/input    ${SPACE}
    ${search1}         Get WebElements                                                                       xpath://*[@id="__next"]/div/div[2]/div[2]/div[2]/div/div[2]/div[1]/a/div[contains(text(), " ")]
    ${len_search1}     Get Length                                                                            ${search1}
    Should Be Equal    ${len_search}                                                                         ${len_search1}
LB-DC-02-09
    ${search}          Get WebElements                                                                       xpath://*[@id="__next"]/div/div[2]/div[2]/div[2]/div/div[2]/div[1]/a/div[contains(text(), "${SPACE}${SPACE}${SPACE}")]
    ${len_search}      Get Length                                                                            ${search}
    Search
    Input Text         xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/div/div[1]/div/input    ${SPACE}${SPACE}${SPACE}
    ${search1}         Get WebElements                                                                       xpath://*[@id="__next"]/div/div[2]/div[2]/div[2]/div/div[2]/div[1]/a/div[contains(text(), "${SPACE}${SPACE}${SPACE}")]
    ${len_search1}     Get Length                                                                            ${search1}
    Should Be Equal    ${len_search}                                                                         ${len_search1}
LB-DC-02-10
    ${search}          Get WebElements                                                                       xpath://*[contains(text(), "test_")]
    ${len_search}      Get Length                                                                            ${search}
    Search
    Input Text         xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/div/div[1]/div/input    test_
    ${search1}         Get WebElements                                                                       xpath://*[contains(text(), "test_")]
    ${len_search1}     Get Length                                                                            ${search1}
    Should Be Equal    ${len_search}                                                                         ${len_search1}
LB-DC-02-11
    ${search}          Get WebElements                                                                       xpath://*[contains(text(), "_test")]
    ${len_search}      Get Length                                                                            ${search}
    Search
    Input Text         xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/div/div[1]/div/input    _test
    ${search1}         Get WebElements                                                                       xpath://*[contains(text(), "_test")]
    ${len_search1}     Get Length                                                                            ${search1}
    Should Be Equal    ${len_search}                                                                         ${len_search1}
LB-DC-02-12
    ${search}          Get WebElements                                                                       xpath://*[contains(text(), "@#$")]
    ${len_search}      Get Length                                                                            ${search}
    Search
    Input Text         xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/div/div[1]/div/input    @#$
    ${search1}         Get WebElements                                                                       xpath://*[contains(text(), "@#$")]
    ${len_search1}     Get Length                                                                            ${search1}
    Should Be Equal    ${len_search}                                                                         ${len_search1}
LB-DC-02-13
    ${search}          Get WebElements                                                                       xpath://*[contains(text(), " testt")]
    ${len_search}      Get Length                                                                            ${search}
    Search
    Input Text         xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/div/div[1]/div/input    testt
    ${search1}         Get WebElements                                                                       xpath://*[contains(text(), " testt")]
    ${len_search1}     Get Length                                                                            ${search1}
    Should Be Equal    ${len_search}                                                                         ${len_search1}
LB-DC-02-14
    ${search}          Get WebElements                                                                       xpath://*[contains(text(), "testtt ")]
    ${len_search}      Get Length                                                                            ${search}
    Search
    Input Text         xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/div/div[1]/div/input    testtt
    ${search1}         Get WebElements                                                                       xpath://*[contains(text(), "testtt ")]
    ${len_search1}     Get Length                                                                            ${search1}
    Should Be Equal    ${len_search}                                                                         ${len_search1}
LB-DC-02-15
    ${search}          Get WebElements                                                                       xpath://*[contains(text(), "a a")]
    ${len_search}      Get Length                                                                            ${search}
    Search
    Input Text         xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/div/div[1]/div/input    a${SPACE}a
    ${search1}         Get WebElements                                                                       xpath://*[contains(text(), "a a")]
    ${len_search1}     Get Length                                                                            ${search1}
    Should Be Equal    ${len_search}                                                                         ${len_search1}
LB-DC-02-16
    ${search}          Get WebElements                                                                       xpath://*[contains(text(), "a${SPACE}${SPACE}${SPACE}aa")]
    ${len_search}      Get Length                                                                            ${search}
    Search
    Input Text         xpath = //*[@id="__next"]/div/div[2]/div[2]/div[2]/div[1]/div/div/div[1]/div/input    a${SPACE}${SPACE}${SPACE}aa
    ${search1}         Get WebElements                                                                       xpath://*[contains(text(), "a${SPACE}${SPACE}${SPACE}aa")]
    ${len_search1}     Get Length                                                                            ${search1}
    Should Be Equal    ${len_search}                                                                         ${len_search1}
LB-DC-05-01
    Click ...
LB-DC-05-02
    Rename
LB-DC-05-03
    Rename                 
    Clear Tree Name
    Input Text             xpath = /html/body/div[3]/div[3]/div/form/div[2]/div/div/div/input    rename
    Click Element          xpath = /html/body/div[3]/div[3]/div/form/div[3]/button[2]
    Page Should Contain    rename
# LB-DC-05-04
#    Rename
#    Clear Tree Name
#    Input Text             xpath = /html/body/div[3]/div[3]/div/form/div[2]/div/div/div/input    รีเนม
#    Click Element          xpath = /html/body/div[3]/div[3]/div/form/div[3]/button[2]
#    Page Should Contain    รีเนม
# LB-DC-05-05
#    Rename
#    Clear Tree Name
#    Input Text             xpath = /html/body/div[3]/div[3]/div/form/div[2]/div/div/div/input    rename1234
#    Click Element          xpath = /html/body/div[3]/div[3]/div/form/div[3]/button[2]
#    Page Should Contain    rename1234
# LB-DC-05-06
#    Rename
#    Clear Tree Name
#    Input Text             xpath = /html/body/div[3]/div[3]/div/form/div[2]/div/div/div/input    รีเนม1234
#    Click Element          xpath = /html/body/div[3]/div[3]/div/form/div[3]/button[2]
#    Page Should Contain    รีเนม1234
# LB-DC-05-07
#    Rename
#    Clear Tree Name
#    Input Text             xpath = /html/body/div[3]/div[3]/div/form/div[2]/div/div/div/input    123456
#    Click Element          xpath = /html/body/div[3]/div[3]/div/form/div[3]/button[2]
#    Page Should Contain    123456
# LB-DC-05-08
#    Rename
#    Clear Tree Name
#    Input Text             xpath = /html/body/div[3]/div[3]/div/form/div[2]/div/div/div/input    _
#    Click Element          xpath = /html/body/div[3]/div[3]/div/form/div[3]/button[2]
#    Page Should Contain    Invalid name
# LB-DC-05-09
#    Rename
#    Clear Tree Name
#    Input Text             xpath = /html/body/div[3]/div[3]/div/form/div[2]/div/div/div/input    ${SPACE}
#    Click Element          xpath = /html/body/div[3]/div[3]/div/form/div[3]/button[2]
#    Page Should Contain    Can not have space in prefix and postfix
# LB-DC-05-10
#    Rename
#    Clear Tree Name
#    Input Text             xpath = /html/body/div[3]/div[3]/div/form/div[2]/div/div/div/input    ${SPACE}${SPACE}${SPACE}
#    Click Element          xpath = /html/body/div[3]/div[3]/div/form/div[3]/button[2]
#    Page Should Contain    Can not have space in prefix and postfix
# LB-DC-05-11
#    Rename
#    Clear Tree Name
#    Input Text             xpath = /html/body/div[3]/div[3]/div/form/div[2]/div/div/div/input    rename_
#    Click Element          xpath = /html/body/div[3]/div[3]/div/form/div[3]/button[2]
#    Page Should Contain    rename_
# LB-DC-05-12
#    Rename
#    Clear Tree Name
#    Input Text             xpath = /html/body/div[3]/div[3]/div/form/div[2]/div/div/div/input    _rename
#    Click Element          xpath = /html/body/div[3]/div[3]/div/form/div[3]/button[2]
#    Page Should Contain    _rename
# LB-DC-05-13
#    Rename
#    Clear Tree Name
#    Input Text             xpath = /html/body/div[3]/div[3]/div/form/div[2]/div/div/div/input    @#$
#    Click Element          xpath = /html/body/div[3]/div[3]/div/form/div[3]/button[2]
#    Page Should Contain    Special Character cannot be used
# LB-DC-05-14
#    Rename
#    Clear Tree Name
#    Input Text             xpath = /html/body/div[3]/div[3]/div/form/div[2]/div/div/div/input    ${SPACE}renamee
#    Click Element          xpath = /html/body/div[3]/div[3]/div/form/div[3]/button[2]
#    Page Should Contain    renamee
# LB-DC-05-15
#    Rename
#    Clear Tree Name
#    Input Text             xpath = /html/body/div[3]/div[3]/div/form/div[2]/div/div/div/input    renameee${SPACE}
#    Click Element          xpath = /html/body/div[3]/div[3]/div/form/div[3]/button[2]
#    Page Should Contain    renameee
# LB-DC-05-16
#    Rename
#    Clear Tree Name
#    Input Text             xpath = /html/body/div[3]/div[3]/div/form/div[2]/div/div/div/input    re${SPACE}name
#    Click Element          xpath = /html/body/div[3]/div[3]/div/form/div[3]/button[2]
#    Page Should Contain    re${SPACE}name
# LB-DC-05-17
#    Rename
#    Clear Tree Name
#    Input Text             xpath = /html/body/div[3]/div[3]/div/form/div[2]/div/div/div/input    re${SPACE}${SPACE}${SPACE}namee
#    Click Element          xpath = /html/body/div[3]/div[3]/div/form/div[3]/button[2]
#    Page Should Contain    re${SPACE}namee
# LB-DC-05-18
#    Rename
#    Clear Tree Name
#    Input Text             xpath = /html/body/div[3]/div[3]/div/form/div[2]/div/div/div/input    test
#    Click Element          xpath = /html/body/div[3]/div[3]/div/form/div[3]/button[2]
#    Page Should Contain    test is already used
LB-DC-05-19
    Delete