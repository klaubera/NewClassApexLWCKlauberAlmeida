public with sharing class Carro {

    //Atributo do carro
    public String modelo {get; set;}
    public String cor {get; set;}
    public Boolean ligado {get; set}
    public Interger velocidadeCarro {get; set;}
    public Boolean estadoPorta {get; set;}
    // Desafio - No carro criar um método chamado Acelerar, passar nesse método o número da velocidade , retornar a mesma velocidade.
    //No motorista vocês devem mandar para o carro o valor da velocidade, porém só pode acelerar se o carro estiver ligado.
    public Boolean acelerar(Interger velocidade){
        return velocidade > 0 && velocidade != null && this.ligado == true ? true : false;
    }
    /*public Boolean ligarCarro(Boolean ligarCarro){

        Boolean carroLigado = ligarCarro ? true : false;

        if(ligarCarro == true){
            system.debug('ligou o carro');
        }else {
            system.debug('desligou o carro');
        }

        return carroLigado;
    }    
    public Boolean ligarFarois(Boolean ligarFarois){
        Boolean ligouFarol = ligarFarois ? true : false;
        if(ligarFarois){
            system.debug('Ligou os farois');
        }else{
            system.debug('Desligou os farois');
        }
        return ligouFarol;
    }
    
    public Boolean ligarSeta(Boolean ligarSeta){
        Boolean ligouSeta = ligarSeta ? true : false;
        if(ligarSeta){
            system.debug('Ligou as setas');
        }else{
            system.debug('Desligou as setas');
        }
        return ligouSeta;
    */}

}

