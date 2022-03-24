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

}
