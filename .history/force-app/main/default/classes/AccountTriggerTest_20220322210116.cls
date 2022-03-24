@IsTest
public class AccountTriggerTest {
    
    /Test 1- criar uma conta com tarefa
    static void AccountTriggerTest() {

        Account accountObj = new Account();
        accountObj.Name    = 'Tete 1';
        accountObj.OwnerShip = 'Private';
        accountObj.Phone     = '76483452';

        insert accountObj;

        List<Task> taskList = new List<Task>([SELECT Id FROM Tsk WHERE WhatId = :accountObj.Id AND Subject = 'Verificar dads das contas']);

        System.AssertEquals(taskList.size(),1);

    
    }


}
