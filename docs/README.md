# Documentation for Stats API

<a name="documentation-for-api-endpoints"></a>
## Documentation for API Endpoints

All URIs are relative to *http://localhost:3000*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*AccountApi* | [**apiAccountsAccountIdGet**](Apis/AccountApi.md#apiaccountsaccountidget) | **GET** /api/accounts/{accountId} | Returns an account balance
*AccountApi* | [**apiAccountsAccountIdTransactionsGet**](Apis/AccountApi.md#apiaccountsaccountidtransactionsget) | **GET** /api/accounts/{accountId}/transactions | Returns an account transactions
*AccountApi* | [**apiAccountsAccountIdTransactionsPost**](Apis/AccountApi.md#apiaccountsaccountidtransactionspost) | **POST** /api/accounts/{accountId}/transactions | Create a new transaction
*CounterApi* | [**apiCountersCounterIdDelete**](Apis/CounterApi.md#apicounterscounteriddelete) | **DELETE** /api/counters/{counterId} | Resets a counter value
*CounterApi* | [**apiCountersCounterIdGet**](Apis/CounterApi.md#apicounterscounteridget) | **GET** /api/counters/{counterId} | Returns a counter value
*CounterApi* | [**apiCountersCounterIdPut**](Apis/CounterApi.md#apicounterscounteridput) | **PUT** /api/counters/{counterId} | Updates a counter value


<a name="documentation-for-models"></a>
## Documentation for Models

 - [Account](.//Models/Account.md)
 - [AccountAttributes](.//Models/AccountAttributes.md)
 - [ApiAccountsAccountIdTransactionsData](.//Models/ApiAccountsAccountIdTransactionsData.md)
 - [ApiAccountsAccountIdTransactionsDataAttributes](.//Models/ApiAccountsAccountIdTransactionsDataAttributes.md)
 - [CounterCommand](.//Models/CounterCommand.md)
 - [Error](.//Models/Error.md)
 - [InlineObject](.//Models/InlineObject.md)
 - [InlineResponse200](.//Models/InlineResponse200.md)
 - [InlineResponse2001](.//Models/InlineResponse2001.md)
 - [InlineResponse201](.//Models/InlineResponse201.md)
 - [Transaction](.//Models/Transaction.md)


<a name="documentation-for-authorization"></a>
## Documentation for Authorization

All endpoints do not require authorization.
