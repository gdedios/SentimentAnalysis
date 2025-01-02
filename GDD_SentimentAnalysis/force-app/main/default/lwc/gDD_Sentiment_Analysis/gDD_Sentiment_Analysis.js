import { LightningElement, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import CUSTOMER_SENTIMENT_FIELD from '@salesforce/schema/MessagingSession.Customer_Sentiment__c';

export default class GDD_Sentiment_Analysis extends LightningElement {

    @api recordId;
    @api fieldName = 'Customer_Sentiment__c'; // Default field name
    @api sentimentValue;

    @wire(getRecord, { recordId: '$recordId', fields: [CUSTOMER_SENTIMENT_FIELD]})
    wiredRecord({ error, data }) {
        if (data) {
            const sentimentAnalysis = data.fields.Customer_Sentiment__c.value;
            this.sentimentValue = sentimentAnalysis.split('\n')[0];
        } else if (error) {
            console.error('Error:', error);
        }
    }
    
    get imageUrl() {
        if (!this.sentimentValue) {
            console.log('The sentimentValue is not set. Please check the wiredRecord function');
            return '';
        }

        if (this.sentimentValue.includes('Bueno')) {
            return '/resource/GDD_SA_Green';
        } else if (this.sentimentValue.includes('Positivo')) {
            return '/resource/GDD_SA_Green';
        }else if (this.sentimentValue.includes('Neutral')) {
            return '/resource/GDD_SA_Yellow';
        } else if (this.sentimentValue.includes('Malo')) {
            return '/resource/GDD_SA_Red';
        } else if (this.sentimentValue.includes('Negativo')) {
            return '/resource/GDD_SA_Red';
        } else {
            return '';
        }
    }
}

