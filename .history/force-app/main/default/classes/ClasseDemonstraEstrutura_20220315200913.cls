public with sharing class ClasseDemonstraEstrutura {//inicio da classe
    
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

        return bFalse;
    }//fim do método

    //classe sem retorno
    public static void metodoSemRetorno(){
        
    }

    }//fim da classe
    //ESTRUTURA DO SOQL
    //SELECT
    //CAMPOS
    //FROM
    //nome do objeto
    //WHERE
    //condição de busca
    private static List<Account> getAccounts(){
        List<Account> accountList = new List<Account>([SELECT id, Name FROM Account where iD != '']);
        return accountList;
    }

    public static void getAccountPrivate();{
        system.debug(ClasseDemonstraEstrutura.getAccounts());
    }    
    // DESAFIO - mONTAR UM METODO QUE 
    public static List<Opportunity> getOpportunitiesCloseWon(){
        List<Opportunity> oppList = new List<Opportunity>();

        oppList - [SELECT Id, Name FROM Opportunity WHERE StageName = 'Closed Won'];

        system.debug(oppList);
        system.debug('tamanho '+oppList.size());

        return oppList;
    }

}//fim da classe