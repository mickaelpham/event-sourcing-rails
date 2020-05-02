# Stats

Practice implementation of
[event sourcing](https://martinfowler.com/eaaDev/EventSourcing.html).

## Counter

| command | description                                |
| ------- | ------------------------------------------ |
| `incr`  | increment the number by `n` (default: `1`) |
| `decr`  | decrement the number by `n` (default: `1`) |
| `reset` | reset the counter to `0`                   |

There are no `counters` database tables. Instead, there is a `counter_events`
table which store the events for a given `model_id` (= counter ID).
