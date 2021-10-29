import { LightningElement, track } from 'lwc';

export default class HelloDiptesh extends LightningElement {
   @track greeting= 'Diptesh';
    changeHandler(event) {
        this.greeting = event.target.value;
    }
}