public with sharing class Carro{

    public static Boolean ligarCarro(Boolean ligarCarro){

        Boolean carroLigado = ligacarro ? true : false;

        if(ligacarro == true){
            system.debug('ligou o carro');
        }else {
            system.debug('desligou o carro');
        }

        return carroLigado
    }    


}

