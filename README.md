<div>
	<img align="right" width="150" src="images/qbranch_logo.gif">
</div>

# _Sentiment Analysis_

<p align="center">
	<img src="images/Sentiment Analysis.png">
</p>

---

## Features

A component that shows a descriptive image of the Sentiment Analysis depending on the AI Generated input from a cusotm field within a Messaging Session

<p align="center">
	<img src="images/Messaging Session 360.png">
</p>

## Getting Started

Here you'll find the Images and the Component to show the Sentiment Analysis within the V360 of a messaging session. You'll not find the custom field, so please follow the Prerequisites steps.

### Prerequisites

_Are there any prerequisites? E.g.: Only works in retail IDO, etc._

### Install

Deploy the source:

1. Clone this repository:

```
git clone https://github.com/gdedios/SentimentAnalysis.git
cd GDD_SentimentAnalysis
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

#### Does it work in Communities?

> No

#### Does it work in Mobile?

> Yes

#### Extras

There's an alternative that I totally recommend also, which is _[Caio Ono's Sentiment Analysis component](https://democomponents.qlabs.sfdc.sh/#/demo-component-detail/a01Kc000000M063IAC)_ . The use case is a little bit different but I think it's worth checking it
