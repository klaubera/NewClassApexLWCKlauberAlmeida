public Boolean ligarCarro(Boolean ligarCarro){
    Boolean carroLigado = ligarCarro ? true : false;
    if(ligarCarro == true){
        system.debug('ligou o carro');
    }else {
        system.debug('desligou o carro');
    }
    return carroLigado
    
}

public 