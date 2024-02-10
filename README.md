
# README
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Model Schema

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