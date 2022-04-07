import { LightningElement, wire, track } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import {fireEvent, registerListener} from 'c/pubsub';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';

export default class accountList extends LightningElement {

    @track accountId = null;
    @track filter = null;
    @track pageNumber = 1;
    @track accountObj;

    @wire(CurrentPageReference) pageRef;

    connectedCallback(){
        
        registerListener('filterChangeSearch',this.getFilter, this);
        this.getAccountsJS();
    }

    getAccount(account){
        this.accountId = account;
    }

    get getAccountId(){
        return this.accountId;
    }    
    
    getFilter(filterParam){
        this.filter = filterParam;
        console.log('ENTROU NO GET FILTER ', filterParam);
        this.getAccountsJS();
    }

    getAccountsJS(){
        getAccounts({filter : this.filter, pageNumber : this.pageNumber}).then( (response) => {
            console.log('response getAccounts', response);
            this.accountsObj = response;
        }).catch((error) => {
            console.log('ERRO AO BUSCAR CLIENTES', error);
        });
    }

    handleProductSelected(event){
        console.log('Capturou o evento do componente filho', event.detail);
        fireEvent(this.pageRef, 'selectedAccount', event.detail);
    }

    handlePreviousPage(){
        this.pageNumber = this.pageNumber -1;
        this.getAccountsJS();
    }

    handleNextPage(){
        this.pageNumber = this.pageNumber +1;
        this.getAccountsJS();
    }

}