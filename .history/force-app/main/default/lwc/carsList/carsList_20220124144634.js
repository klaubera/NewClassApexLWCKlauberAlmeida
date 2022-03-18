import { LightningElement,  api, wire, track  } from 'lwc';

import getCars from "@salesforce/apex/CarsController.getContactCars";





const columns = [

​	 { label: 'Nome do fabricante ', fieldName: 'Name' },

​	 { label: 'Modelo do carro', fieldName: 'Model__c' },

 	{ label: 'Tem ar concionado', fieldName: 'Air_Conditioner__c' },

 	{ label: 'Tipo do carro', fieldName: 'Type__c' },

];



export default class CarsList extends LightningElement {

 	@api recordId;

 	columns = columns;



​	 @track carsList;



 	@wire( getCars, { contactId: '$recordId' } )

 	cars({ data, error }){

 		 if(data){

   			this.carsList = data;

   			console.log('Retorno', JSON.stringify(data));

  		} else if(error) {

   			console.error(error);

  		}

 	}

}