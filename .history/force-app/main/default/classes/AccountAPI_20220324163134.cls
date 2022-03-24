//DESAFIO - Criar uma API que consulta as contas, onde eu posso pesquisar uma conta pelo nome
//DESAFIO - Na mesma classe de API criar um post que receba os dados básicos e inclua a conta, podendo retornar apenas com OK no JSON
//**Post recebe um wrapper com os campos em portugues*/
@RestResource(urlMapping = '/AulaDeApex/Accounts/*')

global with sharing class AccountAPI {

    @HttpGet
    global static void AccountAPI() {
        RestResponse resultRest = RestContext.response;
        String asParamStr = RestContext.request.requestURI.substring(RestContext.request.requestURI.lastIndexOf('/')+1); //aqui eu vejo se a URL do ger tem parâmetro
        //https://playful-panda-6d1pua-dev-ed.my.salesforce.com/services/apexrest/AulaDeApex/Leads?
        String sobrenome = String.IsNotBlank(asParamStr) ? RestContext.request.params.get('Account Name') : '';
        List<Account> AccList = new List<Account>();
        if(String.IsNotBlank(Account Name)){
            AccList = [SELECT Id, LastName FROM Account WHERE LastName = :'Account Name'];
        }else{
            AccList = [SELECT Id, LastName FROM Account];
        }
        //List<Lead> leadsList = new List<Lead>([SELECT Id, LastName FROM Lead]);
        resultRest.responseBody = Blob.valueOf(JSON.serializePretty(AccList));
        resultRest.StatusCode = 200;


    }
}
