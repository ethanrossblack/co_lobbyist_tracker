
# Colorado Lobbyist Tracker

This project is a website that aggregates and organizes lobbying data in Colorado.

## Versioning
* Ruby 3.2.2
* Rails 7.0.8

To create the database, run 

```
rails db:{create,migrate}
```

To import test data, run

```
rails import_data:all
```

Importing all the data takes a little while, but you should see progress in your terminal.

## Listing Relationships

A `client` hires a `lobbyist`\
A `lobbyist` can have many `clients`\
A `client` can hire many `lobbyists`

A `lobbyist` receives monthly `income` from a `client`

A `position` belongs to one `client` and one `lobbyist`\
A `position` corresponds with one `bill` (or issue)

## The Problem

The main problem that I'm trying to solve is of how to best show the relationships between
- Lobbyists
- Clients
- Bill
- Income
- Position

## Model Schema

* [bill](#bill)
* [client](#client)
* [income](#income)
* [lobbyist](#lobbyist)
* [position](#position)

### `bill`

A piece of legislation from the Colorado legislature.

| Attribute | Datatype | Notes |
|---|---|---|
| `id` | _bigint_ | |
| `bill_num` | _string_ | A unique bill number. _HB24-1001_, for example. |
| `title` | _string_ | Short bill title. |
| `fiscal_year` | _string_ | Fiscal year of the bill, IE 2024-2025. |
| `created_at`| _datetime_ | |
| `updated_at`| _datetime_ | |

### `client`

Someone who hires a lobbyist or the organization for whom a lobbyist works. From CO SoS office.

| Attribute | Datatype | Notes |
|---|---|---|
| `id` | _bigint_ | |
| `name` | _string_ | |
| `address` | _string_ | |
| `city` | _string_ | |
| `state` | _string_ | |
| `zip` | _string_ | |
| `phone` | _string_ | |
| `industry_trade_type` | _string_ | |
| `business_type` | _string_ | |
| `begin_date` | _date_ | |
| `end_date` | _date_ | |
| `status` | _string_ | |
| `ceo_names` | _string_ | |
| `fiscal_year` | _string_ | |
| `annual_lobbyist_registration_id` | _bigint_ | |
| `lobbyist_id` | _bigint_ | FK [`lobbyist`](#lobbyist) |

### `income`

A payment from a [`client`](#client) to a [`lobbyist`](#lobbyist).

| Attribute | Datatype | Notes |
|---|---|---|
| `id` | _bigint_ | |
| `annual_lobbyist_registration_id` | _bigint_ | |
| `client_name` | _string_ | |
| `client_zip` | _string_ | |
| `business_type` | _string_ | |
| `industry_trade_type` | _string_ | |
| `amount` | _integer_ | |
| `date_received` | _date_ | |
| `report_month` | _string_ | |
| `report_due_date` | _date_ | |
| `fiscal_year` | _string_ | |
| `lobbyist_id` | _bigint_ | FK [`lobbyist`](#lobbyist) |
| `client_id` | _bigint_ | FK [`client`](#client) |

### `lobbyist`

A Registered lobbyist in the state of Colorado. Data comes from the SoS office.

| Attribute | Datatype | Notes |
|---|---|---|
| `id` | _bigint_ | The `primaryLobbyistId` assigned by the CO SoS. |
| `name` | _string_ | |
| `last_name` | _string_ | |
| `first_name` | _string_ | |
| `middle_name` | _string_ | |
| `suffix` | _string_ | |
| `firm_name` | _string_ | |
| `address` | _string_ | |
| `city` | _string_ | |
| `state` | _string_ | |
| `zip` | _string_ | |
| `phone` | _string_ | |
| `fiscal_years_registered` | _string_ | |
| `lobbyist_type` | _string_ | Mostly ***Professional***. Some ***State*** and ***Redistricting***.|
| `designation` | _string_ | - Individual lobbyist that is not employed by a lobbying firm<br> - Individual lobbyist employed by a lobbying firm<br>- Lobbying firm with 2 or more members<br>- Single-member lobbying firm<br>- Entities reporting contributions and expenditures only<br>- designation not available |
| `status` | _string_ | * Current <br> * Expired<br> * Terminated|
| `created_at` | _datetime_ | |
| `updated_at` | _datetime_ | |

### `position`

The position of a client on a particular piece of legislation. Reported monthly. Specific to a client and lobbyist.

| Attribute | Datatype | Notes |
|---|---|---|
| `id` | _bigint_ | |
| `report_month` | _string_ | |
| `fiscal_year` | _string_ | |
| `position` | _position_ | Support, Oppose, Watching, or Amending  |
| `bill_id` | _bigint_ | Reference to a [`bill`](#bill) |
| `client_id` | _bigint_ | Reference to a [`client`](#client) |
| `lobbyist_id` | _bigint_ | Reference to a [`lobbyist`](#lobbyist) |
| `created_at` | _datetime_ | |
| `updated_at`| _datetime_ | |

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
