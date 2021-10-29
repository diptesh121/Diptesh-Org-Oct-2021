import { LightningElement,api } from 'lwc';

export default class MyComponent extends LightningElement {
    @api recordId;
   // @api objectApiName;
    fields = ['Name', 'Email','Account_Type__c','CreatedById'];
}