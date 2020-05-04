# AccountApi

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiAccountsAccountIdGet**](AccountApi.md#apiAccountsAccountIdGet) | **GET** /api/accounts/{accountId} | Returns an account balance
[**apiAccountsAccountIdTransactionsGet**](AccountApi.md#apiAccountsAccountIdTransactionsGet) | **GET** /api/accounts/{accountId}/transactions | Returns an account transactions
[**apiAccountsAccountIdTransactionsPost**](AccountApi.md#apiAccountsAccountIdTransactionsPost) | **POST** /api/accounts/{accountId}/transactions | Create a new transaction


<a name="apiAccountsAccountIdGet"></a>
# **apiAccountsAccountIdGet**
> inline_response_200 apiAccountsAccountIdGet(accountId)

Returns an account balance

    Returns the given account balance, and 0 if the account has no transactions

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **accountId** | **Integer**| The ID of the account to return | [default to null]

### Return type

[**inline_response_200**](..//Models/inline_response_200.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/vnd.api+json

<a name="apiAccountsAccountIdTransactionsGet"></a>
# **apiAccountsAccountIdTransactionsGet**
> inline_response_200_1 apiAccountsAccountIdTransactionsGet(accountId)

Returns an account transactions

    Returns the given account past transactions

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **accountId** | **Integer**| The ID of the account to return | [default to null]

### Return type

[**inline_response_200_1**](..//Models/inline_response_200_1.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/vnd.api+json

<a name="apiAccountsAccountIdTransactionsPost"></a>
# **apiAccountsAccountIdTransactionsPost**
> inline_response_201 apiAccountsAccountIdTransactionsPost(accountId, inlineObject)

Create a new transaction

    Create a new transaction for the account

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **accountId** | **Integer**| The ID of the account for the transaction | [default to null]
 **inlineObject** | [**InlineObject**](..//Models/InlineObject.md)|  |

### Return type

[**inline_response_201**](..//Models/inline_response_201.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/vnd.api+json
- **Accept**: application/vnd.api+json

