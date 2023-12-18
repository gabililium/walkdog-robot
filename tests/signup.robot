*** Settings ***
Documentation        Suíte de testes de cadastro de dog walker

Resource        ../resources/base.resource  #require
Test Setup        Start session     #inicia e finaliza a session antes de cada teste
Test Teardown     Finish session


*** Test Cases ***
Deve poder cadastrar um novo dog walker
    [Tags]    smoke
    ${dog_walker}        Create Dictionary 
    ...        name=Gabriela Lima
    ...        email=gl@gmail.com
    ...        cpf=03500014141
    ...        cep=04534011
    ...        street=Rua Joaquim Floriano
    ...        district=Itaim Bibi
    ...        city_uf=São Paulo/SP
    ...        number=1000
    ...        details=Apto 28
    ...        cnh=0411.jpg
    
    Go to signup page
    Fill signup form    ${dog_walker} 
    Submit signup form
    Popup should be      Recebemos o seu cadastro e em breve retornaremos o contato.


Não deve cadastrar se os campos obrigatórios não forem preenchidos
    [Tags]    required

    Go to signup page
    Submit signup form 
    
    Alert should be    Informe o seu nome completo
    Alert should be    Informe o seu melhor email
    Alert should be    Informe o seu CPF
    Alert should be    Informe o seu CEP
    Alert should be    Informe um número maior que zero
    Alert should be    Adcione um documento com foto (RG ou CHN)



Não deve cadastrar se o cpf for incorreto
    [Tags]    cpf_inv
    ${dog_walker}        Create Dictionary 
    ...        name=Gabriela Lima
    ...        email=gl@gmail.com
    ...        cpf=03500014141aa
    ...        cep=04534011
    ...        street=Rua Joaquim Floriano
    ...        district=Itaim Bibi
    ...        city_uf=São Paulo/SP
    ...        number=1000
    ...        details=Apto 28
    ...        cnh=0411.jpg
    
    Go to signup page
    Fill signup form    ${dog_walker} 
    Submit signup form
    Alert should be    CPF inválido


Deve poder cadastrar um novo dog walker que sabe cuidar de pets
    [Tags]    aservice
    ${dog_walker}        Create Dictionary 
    ...        name=Gabriela Lima
    ...        email=gl@gmail.com
    ...        cpf=03500014141
    ...        cep=04534011
    ...        street=Rua Joaquim Floriano
    ...        district=Itaim Bibi
    ...        city_uf=São Paulo/SP
    ...        number=1000
    ...        details=Apto 28
    ...        cnh=0411.jpg
 
    
    Go to signup page
    Fill signup form    ${dog_walker} 
    Additional Service    Cuidar
    Submit signup form
    Popup should be      Recebemos o seu cadastro e em breve retornaremos o contato.


Deve poder cadastrar um novo dog walker que sabe adestrar de pets
    [Tags]    aservice
    ${dog_walker}        Create Dictionary 
    ...        name=Gabriela Larissa
    ...        email=gla@gmail.com
    ...        cpf=03500014141
    ...        cep=04534011
    ...        street=Rua Joaquim Floriano
    ...        district=Itaim Bibi
    ...        city_uf=São Paulo/SP
    ...        number=1000
    ...        details=Apto 28
    ...        cnh=0411.jpg

    
    Go to signup page
    Fill signup form    ${dog_walker} 
    Additional Service    Adestrar
    Submit signup form
    Popup should be      Recebemos o seu cadastro e em breve retornaremos o contato.



