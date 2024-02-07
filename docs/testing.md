## `prof_income_current_fiscal_year.txt`

Import from the SoS website on income for current fiscal year: (https://www.coloradosos.gov/pubs/lobby/downloadFiles/prof_income_current_fiscal_year.txt)

### Headers
* lobbyistName
* lobbyistLastName
* lobbyistFirstName
* lobbystFirmName
* lobbyistZip
* primaryLobbyistID
* annualLobbyistRegistrationId
* clientName
* clientZip
* businessType
* industryTradeType
* incomeAmount
* dateIncomeReceived
* reportMonth
* reportDueDate
* fiscalYear
* runDate

Necessary ones:

* primaryLobbyistID (matches lobbyist record)
* annualLobbyistRegistrationId (not super necessary)
* clientName
* clientZip
* businessType
* industryTradeType
* incomeAmount
* dateIncomeReceived
* reportMonth
* reportDueDate
* fiscalYear
* runDate


Client Columns

**ISSUE**

What do I do if a client hires multiple lobbyists? How might I consolidate that? Thoughts, at the moment.
- Search for an identical name
- Find a way to consolidate names and entities even though they might have different spellings or addresses. For example, Xcel energy might have offices in Denver and in Minnesota.
- For now, just enter every one in

| Header | Data Type | Example | Notes| |
|---|---| ---|---|---|
| `primaryLobbyistID` | reference | | | |
| `annualLobbyistRegistrationID` | bigint | | Maybe a future reference to `Lobbyist`, once I figure out how to save annual IDs as a list| |
| `clientName` | string | | | |
| `clientAdress` | string | | | |
| `clientCity` |string | | | |
| `clientState` |string | | | |
| `clientZip` |string | | | |
| `clientPhone` |string | | | |
| `industryTradeType` | string| | | |
| `businessType` |string | | | |
| `clientBeginDate` | date| | | |
| `clientEndDate` |date | | | |
| `clientStatus` | string| | | |
| `ceoNames` | string| | | |
| `fiscalYear` | string| | | |

rails g model Client name:string address:string city:string state:string zip:string phone:string industry_trade_type:string business_type:string begin_date:date end_date:date status:string ceo_names:string fiscal_year:string annual_lobbyist_registration_id:bigint lobbyist:references


0. lobbyistName
1. lobbyistLastName
1. lobbyistFirstName
1. lobbyistFirmName
1. lobbyistZip
1. primaryLobbyistID
1. annualLobbyistRegistrationID
1. clientName
1. clientAdress
1. clientCity
1. clientState
1. clientZip
1. clientPhone
1. industryTradeType
1. businessType
1. clientBeginDate
1. clientEndDate
1. clientStatus
1. ceoNames
1. fiscalYear
1. runDate



Colorado Advocates, Inc.
Colorado Advocates, Inc.