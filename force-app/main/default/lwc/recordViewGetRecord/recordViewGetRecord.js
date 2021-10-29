import { LightningElement,api, wire } from 'lwc';
/* Wire adapter to fetch record data */
import {getRecord,getFieldValue } from 'lightning/uiRecordApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Phone';

export default class RecordViewGetRecord extends LightningElement {
    @api recordId;
    accountObject = ACCOUNT_OBJECT;
    @wire(getRecord, { recordId: '$recordId', fields: [NAME_FIELD] })
    record;
    get nameValue() {
        return this.record.data ? getFieldValue(this.record.data, NAME_FIELD) : '';
    }
}