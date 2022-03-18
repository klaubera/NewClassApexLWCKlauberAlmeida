//nome da classe
public with sharing class ClasseDemonstraEstrutura {//inicio da classe

    //SALVAR SEMPRE = CTRL + S
    
    //metodo da classe, uma classe pode ter varios metodos
    public static boolean nomeDoMetodo(){//inicio do método

        //TIPO VARIAVEL | NOME VARIAVEL | VALOR VARIAVEL
        Boolean bTrue = true;
        Boolean bFalse = false;
        Boolean bExemple;
        String exemploString = 'texto 123456';
        Integer exemploInteiro = 1;
        Decimal exemploDecimal = 1.02;
        Double exemploDouble = 1.0255464454546;

        //coleções
        List<String> exemploLista = new List<String>();
        //[0] - Edgar
        //[1] - João Paulo
        //[2] - Arnaldo
        //[3] - Guilherme
        exemploLista.add('Edgar');
        exemploLista.add('João Paulo');
        exemploLista.add('Arnaldo');
        exemploLista.add('Guilherme');
        exemploLista.add('Guilherme');
        exemploLista.add('Guilherme');
        exemploLista.add('Guilherme');
        system.debug('exemploLista = '+exemploLista);
        system.debug('exemploLista posição 2 = '+exemploLista.get(2));
        system.debug('exemploLista tamanho = '+exemploLista.size());

        List<Integer> exemploListaInteger = new List<Integer>();
        exemploListaInteger.add(null);
        exemploListaInteger.add(1);
        exemploListaInteger.add(2);
        exemploListaInteger.add(3);
        system.debug('exemploListaInteger = '+exemploListaInteger);

        //coleção set
        Set<String> exemploSet = new Set<String>();
        exemploSet.add('Edgar');
        exemploSet.add('João Paulo');
        exemploSet.add('Arnaldo');
        exemploSet.add('Guilherme');
        exemploSet.add('Guilherme');
        exemploSet.add('Guilherme');
        exemploSet.add('Guilherme');
        system.debug('exemploSet = '+exemploSet);
        system.debug('exemploSet tamalho = '+exemploSet.size());

        List<Opportunity> opportunityList =  new List<Opportunity>([SELECT Id, Name FROM Opportunity]);
        system.debug('opportunityList = '+opportunityList);
        system.debug('opportunityList posição 2 = '+opportunityList.get(2));
        system.debug('opportunityList nome posição 2 = '+opportunityList.get(2).Name);
        /*
        (
              Opportunity:{Id=0068c00000pMREmAAO, Name=Edge Emergency Generator}
            , Opportunity:{Id=0068c00000pMREtAAO, Name=Edge Installation}
            , Opportunity:{Id=0068c00000pMREuAAO, Name=Edge SLA}
            , Opportunity:{Id=0068c00000pMRF8AAO, Name=Edge Emergency Generator}
            , Opportunity:{Id=0068c00000pMRF1AAO, Name=Burlington Textiles Weaving Plant Generator}
            , Opportunity:{Id=0068c00000pMREoAAO, Name=Pyramid Emergency Generators}
            , Opportunity:{Id=0068c00000pMREeAAO, Name=Dickenson Mobile Generators}
        )
        */

        Account contaObjeto = new Account();
        contaObjeto.Name = 'Test';
        system.debug('contaObjeto '+contaObjeto);

        return bFalse;
    }//fim do método

    //classe sem retorno
    public static void metodoSemRetorno(){
        
    }

    //Estrutura do SOQL
    //SELECT
    //campos
    //FROM
    //nome do objeto
    //WHERE
    //condição de busca
    private static List<Account> getAccounts(){
        List<Account> accountList =  new List<Account>([SELECT Id, Name FROM Account WHERE Id != '']);
        return accountList;
    }

    public static void getAccountPrivate(){
        system.debug(ClasseDemonstraEstrutura.getAccounts());
    }

    //DESAFIO - Montar um método que busque e retorne uma lista com todas as oportunidade com a faze igual  'Closed Won'
    public static List<Opportunity> getOpportunitiesClosedWon(){
        List<Opportunity> oppList = new List<Opportunity>();

        oppList = [SELECT Id, Name FROM Opportunity WHERE StageName = 'Closed Won'];

        system.debug(oppList);
        system.debug('tamanho '+oppList.size());

        return oppList;
    }

    public static List<Opportunity> getOpportunitiesClosedWon2(){
        return [SELECT Id, Name FROM Opportunity WHERE StageName = 'Closed Won'];
    } 
    
    public static List<Opportunity> getOpportunitiesClosedWon3(){
        List<Opportunity> oppList = new List<Opportunity>([SELECT Id, Name FROM Opportunity WHERE StageName = 'Closed Won']);
        system.debug(oppList);
        system.debug('tamanho '+oppList.size());
        return oppList;
    } 
    
    //Exemplo parâmetros
    public static Integer exemploParametros(Integer pInt, Integer pDiv){
        Integer intTest = (10 + pInt)/pDiv;
        system.debug('o valor de intTest é '+intTest);
        return intTest;
    }

    //DESAFIO - criar um método que recebe um nome de uma pessoa, e imprima com o system debug 'Olá NOME'
    public static void helloName(String name, String sobrenome){
        system.debug('Olá '+name+' '+sobrenome);
    }

    public static String helloName2(String name, String sobrenome){
        return 'Olá '+name+' '+sobrenome;
    } 
    
    public static void callMethods(){
        //exemplo chamando o void
        ClasseDemonstraEstrutura.helloName('Tiago','Welter');

        //exemplo chamando um  metodo sem void e com retorno
        system.debug('O retorno do metodo helloName2 é : '+ClasseDemonstraEstrutura.helloName2('Tiago','Welter'));
    }

    //EXECUÇÃO DML - insert - update - delete - upsert
    public static Account dmlAccountInsert(String name){
        Account accountObj = new Account();
        accountObj.Name = name;
        insert accountObj;
        return accountObj;
    }

    public static Account dmlAccountUpdate(String name, String idDaConta){
        List<Account> accountList = new List<Account>([SELECT Id, Name FROM Account WHERE Id = :idDaConta]); //primeiro buscamos as informações
        Account accountObj = accountList.get(0); //depois pegamos a unica linha que retorna e colocamos no objeto Account
        accountObj.Name = name;
        update accountObj;
        return accountObj;
    }

    public static void dmlAccountDelete(String idDaConta){
        List<Account> accountList = [SELECT Id FROM Account WHERE Id = :idDaConta];
        delete accountList;
    }

    //DESAFIO - Receber o sobrenome e o nome da empresa e vamos inserir um Lead, o método deve retornar o Id do lead inserid
    public static Id insertLead(String lastName, String companyName){
        Lead leadObj = new Lead();
        leadObj.LastName = lastName;
        leadObj.Company = companyName;

        insert leadObj;

        return leadObj.Id;
    }

    //estruturas de condição
    public static boolean demosntraEstruturaCondicao(Integer idade){
        //quero returnar true se a pessoa for maior de idade, senão retorna false
        boolean bMaiorDeIdade;
        if( idade < 18 ){
            system.debug('menor de idade');
            bMaiorDeIdade = false;
        }else{
            system.debug('maior de idade');
            bMaiorDeIdade = true;
        }
        return bMaiorDeIdade;
    }

    public static void demosntraEstruturaCondicao2(Integer idade){
        if(idade < 0 || idade == null){
            system.debug('idade inválida');
        }else{
            if(idade < 13){
                system.debug('criança');
            }else if(idade >= 13 && idade <= 21 ){
                system.debug('adolescente');
            }else if(idade > 21 && idade < 65){
                system.debug('adulto');
            }else{
                system.debug('idoso');
            }
        }
    }

    //DESAFIO
    //Construir um método que receba dois parâmetros do tipo Inteiro e retorne o a soma destes dois parâmetros
    //Se o parâmetro 1 for maior do 5 deve somar mais dois neste resultado    
    public static exemploParametros(Integer num){
        if(num => 1 && num > 5; num= +2 ){
            system.debug(num)
        }
        return num;
    }

}//fim da classe