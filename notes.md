# Terraform intro oppgaver

## Innledning - presentasjon

Intro til tema i powerpoint

## Client setup

- Terraform
- Git
- Azure CLI
- VSCode eller egen editor og relevante extensions

## Terraform basics og HCL

- Resource
- Data
- Variable
- Output
- Local

- Lag et terraform “hello world” prosjekt som skriver noe på skjerm når du kjører apply.
- Lag noe som tar input og skriver dette ut til skjermen ved apply.
- Definer en map med noen forfattere og bøker de har skrevet.
- Lag en liste med valgfritt innhold (superhelter, tv-serier, e.l.) som skrives ut på skjerm ved apply.
- Lag et eller annet som bruker conditional expressions på input eller locals, og skriver på skjerm ved apply.
- Ta tidligere laget liste og kombiner den med en ny liste med en funksjon.
- Lag en lokal liste med numeriske verdier, finn største tall med en funksjon.
- Sorter listen du laget i forrige oppgave med en funksjon
- Kjør et lokalt script med Terraform (powershell eller bash)

- Format
- Validate
- Init
- Plan
- Apply
- Destroy

- Hent inn lokal json-fil i en lokal variabel og gjør noe med innholdet
  - Hvordan påvirkes state når man endrer filen og kjører plan?
  - 

## Terraform providers

- AzureRM
- Random
- Time
- Null
- Local
- Spotify

### AzureRM oppgaver

- Lag et terraform-prosjekt med AzureRM provider konfigurert til ditt miljø i Azure.
- Lag en ressursgruppe
  - Navn: rg-{de tre første bokstavene i fornavn}-{de tre første bokstavene i etternavn}
  - Location: Norway East
- Lag et virtuelt nettverk i ressursgruppen
  - Navn: vnet1
  - Location: Norway East
  - Address Space: 10.0.0.0/16
  - Subnet: subnet1 (10.0.0.0/24)
- Lag en storage account med valgfrie settings. Navn må være globalt unikt med bare små bokstaver og  tall. Ingen bindestrek eller understrek.
  - Lag den så sikker som mulig.
- Lag en virtuell windows maskin i nettverket du etablerte tidligere
  - Hvordan legge inn passord sikkert? Vurdèr random_string.
- Lag en basic Azure SQL Server med en Database
  - Juster settings og kjør plan/apply

### Spotify provider

- Følg [veiledning](https://developer.hashicorp.com/terraform/tutorials/community-providers/spotify-playlist hos Hashicorp) (Krever Spotify-abonnement og mulighet for å kjøre containere lokalt på klient!)


## Terraform backend and state

- Lokal state (default)
- Remote state (Azure storage account)

- Bruk oppgave fra forrige kapittel og sjekk state fil der.
- Forbered en remote state med å lage storage account og tilganger til din service principal
- Prøv å flytte state fra local state til remote state. Er det mulig?
- Hvis ikke punkt 2 går, lag nytt prosjekt med ny remote state.
- Undersøk state i storage account. Hvordan ser den ut?
- Bytt fra autentisering med access keys til Entra ID (Azure AD).
- Gjør noen manuelle endringer og se hva som skjer.


## Terraform modules

- Lag en modul for etablering av ressursgruppe
  - Legg på tags som default
  - Navn skal være mulig å påvirke
  - Location valgfri men en fornuftig default
- Last ned modul for å opprette en virtuell maskin
  - Bruk den til å lage en VM
- Gjør om løsningene fra AzureRM-oppgaver til moduler
  - Er det enkelt å gjøre om fra enkeltbruk til modul?
  - Hvordan gjøre det fleksibelt?


## Advanced Terraform

Undersøk AVM fra Microsoft
Se på Terraform CAF-modul fra Microsoft
Finn moduler og bruk til å lage et lite miljø:
- Azure Virtual Network
- Azure Virtual Machine
- Azure Load Balancer
- Azure Network Security Group

Etabler en policy assignment på ressursgruppe for deny

Hvordan lage tre like miljøer med omtrent like ressurser her? dev/test/prod