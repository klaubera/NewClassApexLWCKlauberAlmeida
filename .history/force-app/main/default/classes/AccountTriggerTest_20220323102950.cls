@IsTest
public class AccountTriggerTest {

    //Test 1- criar uma conta com tarefa
    @IsTest
    static void AccountTriggerTest() {

        Account accountObj = new Account();
        accountObj.Name    = 'Teste 1';
        accountObj.OwnerShip = 'Private';
        accountObj.Phone     = '76483452';

        insert accountObj;

        List<Task> taskList = new List<Task>([SELECT Id FROM Task WHERE WhatId = :accountObj.Id AND Subject = 'Verificar dados das contas']);

        System.AssertEquals(taskList.size(),1);

    
    }

    //Teste 2 - criar uma conta sem conta sem tarefa

    @IsTest
    static void contaSemTarefa(){
        Account accountObj = new Account();
        accountObj.Name    = 'Teste 1';
        accountObj.OwnerShip = '';
        accountObj.Phone     = '76483452';

        insert accountObj;

        List<Task> taskList = new List<Task>([SELECT Id FROM Task WHERE WhatId = :accountObj.Id AND Subject = 'Verificar dados das contas']);

        System.AssertEquals(taskList.size(),0); 
    }
    //Teste 3 - Massa de dados grande
    @IsTest
    static void contasMassaDados(){

        List<Account> accountList = new List<Account>();
        Integer quntContas = 150;
        for(Integer i = 1; i <= quntContas; i++){
            Account accObj = new Account();
            accObj.Name    = 'Conta '+i;
            accObj.OwnerShip = 'Private';
            accObj.Phone     = '764839342';
            accountList.add(accObj);
        }

        insert accountList;

        List<Task> tasksList = new List<Task>([SELECT Id FROM Task WHERE WhatId in :accountList AND Subject = 'Verificar dados das contas']);

        System.AssertEquals(tasksList.size(),quntContas); 
    }


}
