<div>
	<img align="right" width="150" src="images/qbranch_logo.gif">
</div>

# _[Assist Number With Link to Org62](https://org62.lightning.force.com/lightning/r/SSE_Assist__c/a300M000003aY3MQAU/view)_

#### Customer: _Customer company name goes here_

#### Sub-title about your assist goes here with any relevant <a href="https://developer.salesforce.com/">links...</a>

<h4 align="center">
	<a href="#features">Features</a> |
	<a href="#getting-started">Getting Started</a> |
	<a href="#usage">Usage</a> |
	<a href="#faqs">FAQs</a> |
</h4>

<p align="center">
	<img src="images/silhouette_placeholder.gif">
</p>

---

## Features

_Add a description about the features included in this assist here._

## Getting Started

_Add details about how someone can install the content of this repo in their org._

### Prerequisites

_Are there any prerequisites? E.g.: Only works in retail IDO, etc._

### Install

_Add installation instructions here._

_Below is an example of what that might look like._

Deploy the source:

1. Clone this repository:

```
git clone git@github.com:sfdc-qbranch/<REPONAME>.git
cd <REPONAME>
```

2. Authorize with your org and provide it with an alias (OrgAlias):

```
sfdx force:auth:web:login -a "OrgAlias"
```

3. Push the app to your org:

```
sfdx force:source:deploy --sourcepath force-app/main/default --json --loglevel fatal --targetusername "OrgAlias"
```

4. Open the default org:

```
sfdx force:org:open --targetusername "OrgAlias"
```

## Usage

_Add some instructions on how to use your solution_

## FAQs

_Any FAQs? Add them here_

#### Does it work in Communities?

> Yes

#### Does it work in Mobile?

> Yes

#### Others?

## [Contributing](/CONTRIBUTING.md)

See the list of [Contributors][contributors-url] who participated in this project.

If you would like to join these awesome people, please refer to [contributing.md](/CONTRIBUTING.md) for guidelines.

## License

[![License][license-shield]][license-url] Copyright © 2020 [Q Branch][author-url]

<!--- Images -->

[license-shield]: https://img.shields.io/badge/License-BSD%203--Clause-blue.svg

<!--- Urls -->

[repository-url]: https://github.com/sfdc-qbranch/AssistTemplateRepo
[license-url]: http://opensource.org/licenses/BSD-3-Clause
[author-url]: http://github.com/MaxGoldschmidt
[contributors-url]: https://github.com/sfdc-qbranch/AssistTemplateRepo/contributors
