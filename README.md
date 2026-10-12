# Messages API

A minimal Rails 8 JSON REST API backed by SQLite, with one resource: `Message` (`id`, `content`, `created_at`, `updated_at`).

## Requirements

- Ruby 3.3 (see `.ruby-version`)
- SQLite 3

On macOS with Homebrew:

```sh
brew install ruby@3.3
export PATH="/opt/homebrew/opt/ruby@3.3/bin:$PATH"
```

## Setup

```sh
bundle install
bin/rails db:prepare
```

## Run

```sh
bin/rails server
```

The server listens on http://localhost:3000.

## Endpoints

| Action | Method | Path            |
| ------ | ------ | --------------- |
| List   | GET    | `/messages`     |
| Create | POST   | `/messages`     |
| Read   | GET    | `/messages/:id` |
| Update | PATCH  | `/messages/:id` |
| Delete | DELETE | `/messages/:id` |

## Examples

Create:

```sh
curl -X POST http://localhost:3000/messages \
  -H "Content-Type: application/json" \
  -d '{"message": {"content": "Hello, world"}}'
```

List:

```sh
curl http://localhost:3000/messages
```

Read:

```sh
curl http://localhost:3000/messages/1
```

Update:

```sh
curl -X PATCH http://localhost:3000/messages/1 \
  -H "Content-Type: application/json" \
  -d '{"message": {"content": "Updated"}}'
```

Delete:

```sh
curl -X DELETE http://localhost:3000/messages/1
```
