*** Settings ***
Library    SeleniumLibrary
Resource    Resource/locator.robot
Variables    Resource/adat.yaml

Test Setup       Egyedi Lokátorok hozzáadása
*** Test Cases ***
Oldal Indítása
    Oldal Indítás
Regisztráció
    Headerben kattintás      Sign in
    
    Szövegbeírás             Create an account;Email address                               ${Email address}
    Gombra kattintás         Create an account;Create an account
    
    Radio gomb választás     Your personal information;Title                               ${Title}
    Szövegbeírás             First name                                                    ${First Name}
    Szövegbeírás             Last name                                                     ${Last Name}
    Szövegellenőrzés         Email                                                         ${Email address}
    Szövegbeírás             Password                                                      ${Password}
    Dátumválasztás           Your personal information;Date of Birth;days                  ${Date of Birth['Days']}
    Dátumválasztás           Date of Birth;months                                          ${Date of Birth['Months']}
    Dátumválasztás           Date of Birth;years                                           ${Date of Birth['Years']}
    Szövegbeírás             Your address;First name                                       ${Your Address First Name}
    Szövegbeírás             Your address;Last name                                        ${Your Address Last Name}
    Szövegbeírás             Your address;Company                                          ${Company}
    Szövegbeírás             Your address;Address                                          ${Address}
    Szövegbeírás             Your address;Address (Line 2)                                 ${Address2}
    Szövegbeírás             Your address;City                                             ${City}
    Legördülő beállítás      Your address;State                                            ${State}
    Szövegbeírás             Your address;Zip/Postal Code                                  ${Zip}
    Legördülő beállítás      Country                                                       ${Country}
    Szövegbeírás             Your address;Additional information                           ${Additional information}
    Szövegbeírás             Your address;Home phone                                       ${Home phone}
    Szövegbeírás             Your address;Mobile phone                                     ${Mobile phone}
    Szövegbeírás             Your address;Assign an address alias for future reference.    ${Alias}
    Gombra kattintás         Register
    
    Headerben kattintás      Sign out
*** Keywords ***
Egyedi Lokátorok hozzáadása
    locator.Add locators
Oldal Indítás
    SeleniumLibrary.Open Browser	http://automationpractice.com    Chrome
	SeleniumLibrary.Maximize Browser Window
	Set Browser Implicit Wait    2000 
Headerben kattintás    [Arguments]    ${nev}
    SeleniumLibrary.Click Link    LOC_header:${nev}
Szövegbeírás    [Arguments]    ${hely}        ${szoveg}
    SeleniumLibrary.Input Text    LOC_text:${hely}    ${szoveg}
Gombra kattintás    [Arguments]    ${nev}
    SeleniumLibrary.Click Element    LOC_button:${nev}
Radio gomb választás    [Arguments]    ${hely}    ${ertek}
    SeleniumLibrary.Click Element    LOC_Radio:${hely};${ertek}
Szövegellenőrzés    [Arguments]    ${hely}    ${ertek}
    SeleniumLibrary.Textfield Value Should Be    LOC_text:${hely}   ${ertek}
Dátumválasztás    [Arguments]    ${hely}    ${ertek}
    SeleniumLibrary.Select From List by Value    LOC_SelectDate:${hely}    ${ertek}
Legördülő beállítás    [Arguments]    ${hely}    ${ertek}
    SeleniumLibrary.Select From List by Label    LOC_Select:${hely}    ${ertek}
    