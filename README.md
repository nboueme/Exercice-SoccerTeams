# Exercice Mobile : SoccerTeams

## Screenshots

Home View - Search             |  Home View - Teams           |  Players View
:-------------------------:|:-------------------------:|:-------------------------:
![Home View Search](screenshots/home_view_search.png)  |  ![Home View Teams](screenshots/home_view_teams.png)  |  ![Players View](screenshots/players_view.png)

## Install

<details>
<summary>Install SwiftGen via <strong>Homebrew</strong> <em>(system-wide installation)</em></summary>

#### To install SwiftGen via [Homebrew](http://brew.sh), simply use:

```
brew install swiftgen
```

---
</details>
<details>
<summary>Install SwiftLint via <strong>Homebrew</strong> <em>(system-wide installation)</em></summary>

#### To install SwiftGen via [Homebrew](http://brew.sh), simply use:

```
brew install swiftlint
```

---
</details>
<details>
<summary>Install Slather via <strong>Ruby</strong></summary>

#### To install Slather via Ruby, simply use:

```
gem install slather
```

---
</details>

Open `SoccerTeams.xcworkspace`, then update `apiKey` with your own API Key on `NetworkService.swift`.

Then run.

## Architecture

MVP with Coordinator and Repository patterns.

## Unit testing

I use Slather to generate coverage report in HTML format.

Run the test suite on the project, and then run:

```
slather coverage --html --scheme SoccerTeams --workspace SoccerTeams.xcworkspace SoccerTeams.xcodeproj
```
