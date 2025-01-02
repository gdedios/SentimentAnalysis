import { LightningElement, track, wire, api } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import getInsights from '@salesforce/apex/MockedCalculatedInsightsCT.getInsights';

export default class MockedCalculatedInsights extends NavigationMixin(
    LightningElement
) {
    @api cardTitle = 'Calculated Insights';
    @api cardIcon = 'standard:data_cloud';
    @api columns = 2;
    @api layoutVariation = 'stacked';
    @track insights = [];
    error;

    get size() {
        return 12 / this.columns;
    }

    get layoutVariationClass() {
        let baseClass = 'slds-form-element slds-form-element_readonly';
        return this.layoutVariation === 'stacked'
            ? baseClass
            : baseClass + ' slds-form-element_horizontal';
    }

    @wire(getInsights)
    wiredInsights({ error, data }) {
        if (data) {
            this.insights = data.toSorted((a, b) => a.Order__c - b.Order__c);
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.insights = null;
        }
    }

    newRecord() {
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Mocked_Calculated_Insight__c',
                actionName: 'list',
            },
            state: {
                filterName: 'All',
            },
        });
    }
}
