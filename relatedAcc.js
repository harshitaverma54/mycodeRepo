import { LightningElement, wire } from 'lwc';
import getRecentAccounts from '@salesforce/apex/AccountLWC.getRecentAccounts';

export default class RecentAcc extends LightningElement {
    accounts;

    @wire(getRecentAccounts)
    wiredAccounts({ error, data }) {
        if (data) {
            this.accounts = data;
        } else if (error) {
            console.log(error);
        }
    }
}