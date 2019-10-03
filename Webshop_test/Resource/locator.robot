*** Settings ***
Library    SeleniumLibrary 
Library    String

*** Keywords *** 
Add locators
    Add Location Strategy 	LOC_header 	Locator Header
    Add Location Strategy 	LOC_text 	Locator Text
    Add Location Strategy 	LOC_button 	Locator Button
    Add Location Strategy 	LOC_SelectDate 	Locator SelectDate
    Add Location Strategy 	LOC_Select 	Locator Select
    Add Location Strategy 	LOC_Radio 	Locator Radio
Locator Header    [Arguments]    ${browser}    ${locator}    ${tag}    ${constraints}
    ${element}= 	SeleniumLibrary.Get WebElement    //div[@class='header-container']//a[contains(text(),'${locator}')]
    [Return] 	${element} 
Locator Radio    [Arguments]    ${browser}    ${locator}    ${tag}    ${constraints}
	@{element_parameterek} =	Split String	${locator}    ;
    ${lista_meret}=    Get Length    ${element_parameterek}    
    ${element}=    Run keyword if    ${lista_meret} < 3    SeleniumLibrary.Get WebElement    //label[contains(text(),'@{element_parameterek}[0]')]/..//label[contains(normalize-space(.), "@{element_parameterek}[1]")]/..//input		
	    ...    ELSE    SeleniumLibrary.Get WebElement    //h3[contains(text(),'@{element_parameterek}[0]')]/..//label[contains(text(),'@{element_parameterek}[1]')]/..//label[contains(normalize-space(.), "@{element_parameterek}[2]")]/..//input
    [Return] 	${element}
Locator Text    [Arguments]    ${browser}    ${locator}    ${tag}    ${constraints}
    @{element_parameterek} =	Split String	${locator}    ;
    ${lista_meret}=    Get Length    ${element_parameterek}    
    ${element}=    Run keyword if    ${lista_meret} < 2    SeleniumLibrary.Get WebElement    //label[contains(text(),'@{element_parameterek}[0]')]/ancestor::*[substring-after(@class, "form-")="group" or substring-before(@class, "group")="form-"]//*[self::input or self::textarea] 		
	    ...    ELSE    SeleniumLibrary.Get WebElement    //h3[contains(text(),'@{element_parameterek}[0]')]/..//label[contains(text(),'@{element_parameterek}[1]')]/ancestor::*[substring-after(@class, "form-")="group" or substring-before(@class, "group")="form-"]//*[self::input or self::textarea]
	[Return] 	${element} 	
Locator Button    [Arguments]    ${browser}    ${locator}    ${tag}    ${constraints}
    @{element_parameterek} =	Split String	${locator}    ;
    ${lista_meret}=    Get Length    ${element_parameterek}   
    ${element}=    Run keyword if    ${lista_meret} < 2    SeleniumLibrary.Get WebElement    //span[text()[normalize-space() = '@{element_parameterek}[0]']]/ancestor::button
        ...    ELSE    SeleniumLibrary.Get WebElement    //h3[contains(text(),'@{element_parameterek}[0]')]/..//span[text()[normalize-space() = '@{element_parameterek}[1]']]/ancestor::button
    [Return] 	${element} 
Locator Select    [Arguments]    ${browser}    ${locator}    ${tag}    ${constraints}
    @{element_parameterek} =	Split String	${locator}    ;
    ${lista_meret}=    Get Length    ${element_parameterek}  
    ${element}=    Run keyword if    ${lista_meret} < 2    SeleniumLibrary.Get WebElement    //label[contains(text(),'@{element_parameterek}[0]')]/ancestor::*[substring-after(@class, "form-")="group" or substring-before(@class, "group")="form-"]//select
        ...    ELSE    SeleniumLibrary.Get WebElement    //h3[contains(text(),'@{element_parameterek}[0]')]/..//label[contains(text(),'@{element_parameterek}[1]')]/ancestor::*[substring-after(@class, "form-")="group" or substring-before(@class, "group")="form-"]//select
	[Return] 	${element}
Locator SelectDate    [Arguments]    ${browser}    ${locator}    ${tag}    ${constraints}
    @{element_parameterek} =	Split String	${locator}    ;
    ${lista_meret}=    Get Length    ${element_parameterek}  
    ${element}=    Run keyword if    ${lista_meret} < 3    SeleniumLibrary.Get WebElement    //label[contains(text(),'@{element_parameterek}[0]')]/ancestor::*[substring-after(@class, "form-")="group" or substring-before(@class, "group")="form-"]//select[@id='@{element_parameterek}[1]']
        ...    ELSE    SeleniumLibrary.Get WebElement    //h3[contains(text(),'@{element_parameterek}[0]')]/..//label[contains(text(),'@{element_parameterek}[1]')]/ancestor::*[substring-after(@class, "form-")="group" or substring-before(@class, "group")="form-"]//select[@id='@{element_parameterek}[2]']
	[Return] 	${element}
    
