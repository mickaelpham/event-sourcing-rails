# frozen_string_literal: true

CounterEvent.create([
  { model_id: 1, name: 'Incremented', data: { by: 1 } },
  { model_id: 1, name: 'Incremented', data: { by: 2 } },
  { model_id: 1, name: 'Incremented', data: { by: 3 } },
  { model_id: 2, name: 'Decremented', data: { by: 1 } },
  { model_id: 2, name: 'Reset', data: {} },
  { model_id: 2, name: 'Decremented', data: { by: 1 } },
  { model_id: 2, name: 'Incremented', data: { by: 1 } },
  { model_id: 2, name: 'Incremented', data: { by: 2 } }
])
