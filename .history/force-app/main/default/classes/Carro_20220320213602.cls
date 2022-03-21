public with sharing class Carro {

    //Atributo do carro
    public String modelo {get; set;}
    public String cor {get; set;}
    public Boolean ligado {get; set}
    public Integer velocidadeCarro {get; set;}
    public Boolean estadoPorta {get; set;}

    // Desafio - No carro criar um método chamado Acelerar, passar nesse método o número da velocidade , retornar a mesma velocidade.
    //No motorista vocês devem mandar para o carro o valor da velocidade, porém só pode acelerar se o carro estiver ligado.

    public Boolean acelerar(Integer velocidade){
        return velocidade > 0 && velocidade != null && this.ligado == true ? true : false;
    }
    

}

