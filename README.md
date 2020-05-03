# Stats [![CircleCI][circleci-shield]][circleci-master]

Practice implementation of [event sourcing][event-sourcing].

## Counter

| command | description                                |
| ------- | ------------------------------------------ |
| `incr`  | increment the number by `n` (default: `1`) |
| `decr`  | decrement the number by `n` (default: `1`) |
| `reset` | reset the counter to `0`                   |

There are no `counters` database tables. Instead, there is a `counter_events`
table which store the events for a given `model_id` (= counter ID).

[event-sourcing]: https://martinfowler.com/eaaDev/EventSourcing.html
[circleci-shield]:
  https://circleci.com/gh/mickaelpham/stats/tree/master.svg?style=svg
[circleci-master]: https://circleci.com/gh/mickaelpham/stats/tree/master
