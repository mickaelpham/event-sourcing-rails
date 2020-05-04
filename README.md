# Stats [![CircleCI][circleci-shield]][circleci-master]

Practice implementation of [event sourcing][event-sourcing].

## Usage

```
git clone https://github.com/mickaelpham/stats
cd stats
bin/setup
bin/rails server
```

Then check out the [API documentation](docs/README.md).

## Commands

### Counter

| command | description                                |
| ------- | ------------------------------------------ |
| `incr`  | increment the number by `n` (default: `1`) |
| `decr`  | decrement the number by `n` (default: `1`) |
| `reset` | reset the counter to `0`                   |

There are no `counters` database tables. Instead, there is a `counter_events`
table which store the events for a given `model_id` (= counter ID).

### Account

| command    | description                                         |
| ---------- | --------------------------------------------------- |
| `withdraw` | Withdraw money from account (if sufficient balance) |
| `deposit`  | Deposit a **positive** amount to an account         |

[event-sourcing]: https://martinfowler.com/eaaDev/EventSourcing.html
[circleci-shield]:
  https://circleci.com/gh/mickaelpham/stats/tree/master.svg?style=svg
[circleci-master]: https://circleci.com/gh/mickaelpham/stats/tree/master
