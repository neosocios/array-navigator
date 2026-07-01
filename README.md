# Array Navigator

A Google Tag Manager **server-side** variable template that extracts a single
value from an array of `{ name, value }` objects contained in the event data.

Given an array key, an object name, and an element key, the variable:

1. Reads the event data array at **Array Key**.
2. Finds the object whose `name` matches **Object Name**.
3. Parses that object's `value` as JSON.
4. Returns the value of **Element Key** from the parsed object.

If any step fails (missing input, missing array, no matching object, invalid
JSON), the variable returns `undefined`.

## Fields

| Field | Description |
| --- | --- |
| **Array Key** | Key in the event data holding the array to search. |
| **Object Name** | The `name` of the target object within the array. |
| **Element Key** | Key to return from the parsed `value` JSON. |

## Permissions

- **Read event data** — reads all event data to locate the target array.

## License

Licensed under the [Apache License 2.0](LICENSE).

Maintained by [Neosocios](https://neosocios.com/).
