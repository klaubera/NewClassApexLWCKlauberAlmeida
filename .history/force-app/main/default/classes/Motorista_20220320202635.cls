public with sharing class Motorista {
    public static void carroMotorista();{
        Carro carroFusca = new Carro();
        Boolean fuscaLigado = carroFusca.ligarCarro(true);
        if(fuscaLigado){
            carroFusca.ligarSeta(true);
        } 
        system.debug('fuscaLigado '+fuscaLigado);

        Carro carroOpala = new Carro();
        Boolean opalaLigado = carroOpala.ligarCarro(true);
        if(OpalaLigado){
            carroOpala.ligarSeta(true);
        } 
        system.debug('opalaLigado '+opalaLigado);
    }
}
