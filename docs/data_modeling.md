# Data Modeling

The Problem

The main problem that I'm trying to solve is of how to best show the relationships between
- Lobbyists
- Clients
- Bill
- Income
- Position



## Raw Data

#### Links to file on the Colorado Sos's website.

* [Professional lobbyists and firms directory (TXT)](https://www.coloradosos.gov/pubs/lobby/downloadFiles/prof_lobbyist_directory.txt)
* [Client positions - subjects and bills - current fiscal year (TXT)](https://www.coloradosos.gov/pubs/lobby/downloadFiles/prof_bills_current_fiscal_year.txt)
* [Client directory - current fiscal year (TXT)](https://www.coloradosos.gov/pubs/lobby/downloadFiles/prof_clients_current_fiscal_year.txt)
* [Lobbying income - current fiscal year (TXT)](https://www.coloradosos.gov/pubs/lobby/downloadFiles/prof_income_current_fiscal_year.txt)


#### Links that I don't use currently but could beuseful later
* [Client positions - subjects and bills - 5-year history (TXT)](https://www.coloradosos.gov/pubs/lobby/downloadFiles/prof_bills_5_years.txt)
* [Client directory - 5-year history (TXT)](https://www.coloradosos.gov/pubs/lobby/downloadFiles/prof_clients_5_years.txt)
* [Lobbying income - 5-year history (TXT)](https://www.coloradosos.gov/pubs/lobby/downloadFiles/prof_income_5_years.txt)

#### General Resources
* [Lobbying Guidance Manual](https://www.coloradosos.gov/pubs/lobby/files/guidanceManual.pdf)
* [Colorado Secretary of State Lobbying Homepage](https://www.coloradosos.gov/pubs/lobby/lobby_home.html)

---

### **[Professional lobbyists and firms directory (TXT)](https://www.coloradosos.gov/pubs/lobby/downloadFiles/prof_lobbyist_directory.txt)**

Contains a list of every registered lobbyist and lobbying firm in CO. Has a lot of outdated and expired lobbyists.

#### Sample Raw Data
```tsv
lobbyistName	lobbystLastName	lobbyistFirstName	lobbyistMiddleName	lobbyistSuffix	lobbyistFirmName	lobbyistAddress	lobbyistCity	lobbyistState	lobbyistZip	primaryLobbyistID	lobbyistPhone	fiscalYearsRegistered	registrationEndDate	lobbyistType	lobbyistDesignation	status	runDate
76 Group					76 Group	7600 E. Eastman Ave, Suite 405	Denver	CO	80231	20135004567	720-420-4250	2012-2013; 2013-2014; 2014-2015; 2015-2016; 2016-2017; 2017-2018; 2018-2019; 2019-2020; 2020-2021; 2021-2022; 2022-2023; 2023-2024		Professional	Lobbying firm with 2 or more members                       	Current   	02/28/2024
...
Adams, Tiffany (Forbes Tate Partners)	Adams	Tiffany			Forbes Tate Partners	777 6th St, 8th Floor	Washington	DC	20001	20205003050	202-638-0125	2019-2020; 2020-2021	01/15/2021	Professional	Individual lobbyist employed by a lobbying firm            	Terminated	02/28/2024
```

#### Data Explained

| Header | Description | Example | Notes|
|-|-|-|-|
| `lobbyistName` | The full name of a lobbyist or lobbying firm.<br>If an individual is employed by a lobbying firm, the firm's name is listed in parenthesis `()` after the name.| |
| `lobbystLastName` |
| `lobbyistFirstName` |
| `lobbyistMiddleName` |
| `lobbyistSuffix` |
| `lobbyistFirmName` |
| `lobbyistAddress` |
| `lobbyistCity` | 
| `lobbyistState` |
| `lobbyistZip` |
| `primaryLobbyistID` |
| `lobbyistPhone` |
| `fiscalYearsRegistered` |
| `registrationEndDate` |
| `lobbyistType` |
| `lobbyistDesignation` |
| `status` |
| `runDate` |

## Listing Relationships

A `client` hires a `lobbyist`\
A `lobbyist` can have many `clients`\
A `client` can hire many `lobbyists`

A `lobbyist` receives monthly `income` from a `client`

A `position` belongs to one `client` and one `lobbyist`\
A `position` corresponds with one `bill` (or issue)


