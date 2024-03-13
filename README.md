
# README


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
| `lobbyist_id` | _bigint_ | Reference to a [`lobbyist`](#lobbyist) |
| `created_at`| _datetime_ | |
| `updated_at`| _datetime_ | |

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
| `lobbyist_id` | _bigint_ | Reference to a [`lobbyist`](#lobbyist) |
| `client_id` | _bigint_ | Reference to a [`client`](#client) |
| `created_at` | _datetime_ | |
| `updated_at`| _datetime_ | |

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
| `lobbyist_type` | _string_ | |
| `designation` | _string_ | |
| `status` | _string_ | |
| `created_at` | _datetime_ | |
| `updated_at` | _datetime_ | |

### `position`

The position of a client on a particular piece of legislation. Reported monthly. Specific to a client and lobbyist.

| Attribute | Datatype | Notes |
|---|---|---|
| `id` | _bigint_ | |
| `report_month` | _string_ | |
| `fiscal_year` | _string_ | |
| `position` | _position_ | Support, Oppose, Watching, Amending, etc.  |
| `bill_id` | _bigint_ | Reference to a [`bill`](#bill) |
| `client_id` | _bigint_ | Reference to a [`client`](#client) |
| `lobbyist_id` | _bigint_ | Reference to a [`lobbyist`](#lobbyist) |
| `created_at` | _datetime_ | |
| `updated_at`| _datetime_ | |
