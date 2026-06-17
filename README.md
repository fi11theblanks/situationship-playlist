# situationship playlist

tell me about your situationship, i'll make you a playlist.

a rails app that takes your situationship inputs (emotional intensity, power dynamic, attachment clash, hope level and more) and generates a personalized playlist via LLM with track recommendations and reasoning. sign in with Spotify to save your results.

## stack

- Ruby 3.3.5
- Rails 8
- PostgreSQL
- Spotify OAuth (omniauth-spotify)
- LLM playlist generation (GPT-4o via RubyLLM)

## setup

```bash
git clone git@github.com:fi11theblanks/situationship-playlist.git
cd situationship-playlist
bundle install
```

copy the environment variables:

```bash
cp .env.example .env
```

fill in your Spotify app credentials and OpenAI key in `.env`.

create and migrate the database:

```bash
rails db:create db:migrate
```

run the server:

```bash
rails s
```

## environment variables

SPOTIFY_CLIENT_ID=

SPOTIFY_CLIENT_SECRET=

OPENAI_API_KEY=

## models

- `User` — Spotify OAuth credentials and profile
- `Situationship` — form inputs describing the situationship
- `PlaylistResult` — generated tracks with reasoning, cached by input hash
