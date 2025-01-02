public with sharing class QBL_EinsteinPrebuiltPredictions_MFG_Risk {
    public QBL_EinsteinPrebuiltPredictions_MFG_Risk() {

    }
    public void parseStaticResources() {
        // Load and parse the first static resource
        String csvContent = loadStaticResource('QBL_EinsteinPrection_Account');
        List<Account> accounts = parseAccountCsv(csvContent);

        // Insert the parsed accounts
        insert accounts;

        // Load and parse the second static resource
        String contactCsvContent = loadStaticResource('QBL_EinsteinPrection_Contact');
        System.debug(contactCsvContent);
        List<Contact> contacts = parseContactCsv(contactCsvContent);

        // Associate the parsed contacts with accounts
        associateContactsWithAccounts(contacts, accounts);

        insert contacts;
        

        // Load and parse the third static resource
        String assetCsvContent = loadStaticResource('QBL_EinsteinPrection_Manufacturing_RiskOfFailure');
        System.debug(assetCsvContent);
        List<Asset> assets = parseAssetCsv(assetCsvContent);


        // Associate the parsed assets with contacts and accounts
        associateAssetsWithContactsAndAccounts(assets, contacts, accounts);

        // Insert the parsed assets
        insert assets;
        System.debug(assets.size());
    }

    private static String loadStaticResource(String resourceName) {
        // Load the static resource
        StaticResource resource = [SELECT Id, Body FROM StaticResource WHERE Name = :resourceName LIMIT 1];

        // Return the resource body as a string
        return EncodingUtil.base64Encode(resource.Body);
    }

    private static List<Account> parseAccountCsv(String csvContent) {
        List<Account> accounts = new List<Account>();
        List<String> lines = csvContent.split('\n');

        for (Integer i = 1; i < lines.size(); i++) {
            String line = lines[i];
            List<String> columns = line.split(',');

            if (columns.size() == 1) {
                String name = columns[0];

                Account account = new Account(Name = name);
                accounts.add(account);
            }
        }

        return accounts;
    }

    private static List<Contact> parseContactCsv(String csvContent) {
        List<Contact> contacts = new List<Contact>();
        List<String> lines = csvContent.split('\n');

        for (Integer i = 1; i < lines.size(); i++) {
            String line = lines[i];
            List<String> columns = line.split(',');

            if (columns.size() == 2) {
                String firstName = columns[0];
                String lastName = columns[1];

                Contact contact = new Contact(FirstName = firstName, LastName = lastName);
                contacts.add(contact);
            }
        }

        return contacts;
    }

    private static List<Asset> parseAssetCsv(String csvContent) {
        List<Asset> assets = new List<Asset>();
        List<String> lines = csvContent.split('\n');

        for (Integer i = 1; i < lines.size(); i++) {
            String line = lines[i];
            List<String> columns = line.split(',');

            if (columns.size() == 6) {
                String name = columns[0];
                Decimal tenure = Decimal.valueOf(columns[1]);
                Decimal fuelEfficiency = Decimal.valueOf(columns[2]);
                Decimal averageTemperature = Decimal.valueOf(columns[3]);
                Decimal oilLevel = Decimal.valueOf(columns[4]);
                Decimal daysSinceLastCheck = Decimal.valueOf(columns[5]);
                Decimal riskOfFailure = Decimal.valueOf(columns[6]);

                Asset asset = new Asset(
                    Name = name,
                    QBL_Tenure__c = tenure,
                    QBL_fuel_efficiency__c = fuelEfficiency,
                    QBL_average_temperature__c = averageTemperature,
                    QBL_oil_level__c = oilLevel,
                    QBL_days_since_last_check_c__c = daysSinceLastCheck,
                    QBL_risk_of_failure__c = riskOfFailure
                );
                assets.add(asset);
            }
        }

        return assets;
    }

    private static void associateContactsWithAccounts(List<Contact> contacts, List<Account> accounts) {
        for (Contact contact : contacts) {
            for (Account account : accounts) {
                contact.AccountId = account.Id;
            }
        }
    }

    private static void associateAssetsWithContactsAndAccounts(List<Asset> assets, List<Contact> contacts, List<Account> accounts) {
        for (Asset asset : assets) {
            for (Contact contact : contacts) {
                for (Account account : accounts) {
                    asset.ContactId = contact.Id;
                    asset.AccountId = account.Id;
                }
            }
        }
    }
}