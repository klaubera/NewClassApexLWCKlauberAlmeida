public with sharing class Carro {

    public static Boolean ligarCarro(Boolean ligarCarro){

        Boolean carroLigado = ligarCarro ? true : false;

        if(ligarCarro == true){
            system.debug('ligou o carro');
        }else {
            system.debug('desligou o carro');
        }

        return carroLigado;
    }    
    public static Boolean ligarFarois(Boolean ligarFarois){
        Boolean ligouFarol = ligarFarois ? true : false;
        if(ligarFarois){
            system.debug('Ligou os farois');
        }else{
            system.debug('Desligou os farois');
        }
        return ligouFarol;
    }
    public static Boolean ligarFarois(Boolean ligarFarois){
        Boolean ligouFarol = ligarFarois ? true : false;
        if(ligarFarois){
            system.debug('Ligou os farois');
        }else{
            system.debug('Desligou os farois');
        }
        return ligouFarol;
    }
    public static Boolean ligarSeta(Boolean ligarSeta){
        Boolean ligouSeta = ligarFarois ? true : false;
        if(ligarFarois){
            system.debug('Ligou as setas');
        }else{
            system.debug('Desligou as setas');
        }
        return ligouSeta;
    }

}
