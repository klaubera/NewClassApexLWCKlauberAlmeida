import { LightningElement, wire, track } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import {fireEvent, registerListener} from 'c/pubsub';

export default class CartDetail extends LightningElement {
    @wire(CurrentPageReference) pageRef;
    @track accountId = null;
    @track products = [];

    connectedCallback(){
        registerListener('selectedProduct', this.hadleProductSelected, this);
        registerListener('selectedAccount', this.getAccount, this);
    }

    getAccount(account){
        this.accountId = account;
    }

    get getAccountId(){
        return this.accountId;
    } 
    
    hadleProductSelected(product){
        console.log('capturou o produto', product);
        let newProduct = {...JSON.parse(product)}
        console.log('Aqui esta o produto parseado', newProduct);
        console.log('Aqui esta o preço', newProduct.preco);
        this.products.push({...newProduct,quantidade:1});
    }
        
}

    