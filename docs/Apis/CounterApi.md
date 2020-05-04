# CounterApi

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiCountersCounterIdDelete**](CounterApi.md#apiCountersCounterIdDelete) | **DELETE** /api/counters/{counterId} | Resets a counter value
[**apiCountersCounterIdGet**](CounterApi.md#apiCountersCounterIdGet) | **GET** /api/counters/{counterId} | Returns a counter value
[**apiCountersCounterIdPut**](CounterApi.md#apiCountersCounterIdPut) | **PUT** /api/counters/{counterId} | Updates a counter value


<a name="apiCountersCounterIdDelete"></a>
# **apiCountersCounterIdDelete**
> String apiCountersCounterIdDelete(counterId)

Resets a counter value

    Reset a given counter value to 0

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **counterId** | **Integer**| The ID of the counter to return | [default to null]

### Return type

[**String**](..//Models/string.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: text/plain

<a name="apiCountersCounterIdGet"></a>
# **apiCountersCounterIdGet**
> String apiCountersCounterIdGet(counterId)

Returns a counter value

    Returns the current counter value, or 0 if the counter just got initialized

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **counterId** | **Integer**| The ID of the counter to return | [default to null]

### Return type

[**String**](..//Models/string.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: text/plain

<a name="apiCountersCounterIdPut"></a>
# **apiCountersCounterIdPut**
> String apiCountersCounterIdPut(counterId, counterCommand)

Updates a counter value

    Execute the given command against a counter to update its value

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **counterId** | **Integer**| The ID of the counter to update | [default to null]
 **counterCommand** | [**CounterCommand**](..//Models/CounterCommand.md)| Countains the command to execute, and an optional by attribute |

### Return type

[**String**](..//Models/string.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: text/plain

